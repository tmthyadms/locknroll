import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:locknroll/components/buttons/elevated_btn.dart';
import 'package:provider/provider.dart';

import '../apis/notification_api.dart';
import '../components/buttons/circles/icon_circle_btn.dart';
import '../components/circular_progress.dart';
import '../components/error_msg.dart';
import '../components/gaps/vgap.dart';
import '../models/device_model.dart';
import '../providers/device_provider.dart';
import '../providers/layout_tertiary_provider.dart';
import '../services/device_details_service.dart';
import '../theme/utils/color_palette.dart';
import '../utils/constants.dart';

class DeviceControlView extends StatefulWidget {
  const DeviceControlView({super.key});

  @override
  State<DeviceControlView> createState() => _DeviceControlViewState();
}

class _DeviceControlViewState extends State<DeviceControlView> {
  // Initialize firebase realtime database
  DatabaseReference rtdb = FirebaseDatabase.instance.refFromURL(
      'https://locknroll-eb153-default-rtdb.asia-southeast1.firebasedatabase.app/');
  late DatabaseReference rtdbRef = rtdb.child('smartDoorLock');

  // Initialize firebase storage
  FirebaseStorage storage = FirebaseStorage.instance;
  late Reference storageRef = storage.ref('smartDoorLock');

  // Initialize variables
  bool isDoorbellPressed = false;
  bool isDoorLocked = true;
  bool isPhotoTaken = false;
  bool isAlarmActivated = false;

  Timer? alarmTimer;
  int alarmSeconds = 0;
  final alarmTimeout = 5;

  Timer? cameraTimer;
  int cameraSeconds = 0;
  final cameraTimeout = 30;

  // Set doorbell's status to false to cancel notification
  // as notification will be shown when doorbell's status is true
  void _cancelDoorbell() => rtdbRef.child('isDoorbellPressed').set(false);

  // Toggle door lock's status
  void _toggleLock() => rtdbRef.child('isDoorLocked').set(!isDoorLocked);

  // Toggle alarm's status
  void _toggleAlarm() =>
      rtdbRef.child('isAlarmActivated').set(!isAlarmActivated);

  void _captureImage() {
    rtdbRef.child('isPhotoTaken').set(true);
  }

  // Listen to notification
  void listenNotifications() =>
      NotificationApi.onNotifications.stream.listen(onClickedNotifications);

  // Action when notification is clicked
  void onClickedNotifications(String? payload) {
    Navigator.pushNamed(context, '/layoutPrimary');
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) => Scaffold(
    //       appBar: AppBar(
    //         title: const Text('Notification'),
    //         centerTitle: true,
    //       ),
    //       body: Center(
    //         child: Text(payload ?? ''),
    //       ),
    //     ),
    //   ),
    // );
  }

  // Get image's url from firebase storage
  Stream<String> getImageURL() =>
      storageRef.listAll().asStream().asyncMap((result) async {
        String url = await result.items.first.getDownloadURL();
        return url;
      });

  // esp smart config here

  void _startAlarmTimer() {
    const duration = Duration(seconds: 1);

    alarmTimer = Timer.periodic(duration, (timer) {
      setState(() {
        alarmSeconds++;
      });

      if (alarmSeconds >= alarmTimeout) {
        _cancelAlarmTimer();
        rtdbRef.child('isAlarmActivated').set(false);
      }
    });
  }

  void _cancelAlarmTimer() {
    alarmTimer?.cancel();
    alarmSeconds = 0;
  }

  void _startCameraTimer() {
    const duration = Duration(seconds: 1);

    cameraTimer = Timer.periodic(duration, (timer) {
      setState(() {
        cameraSeconds++;
      });

      if (cameraSeconds >= cameraTimeout) {
        _cancelCameraTimer();
        rtdbRef.child('isPhotoTaken').set(false);
      }
    });
  }

  void _cancelCameraTimer() {
    cameraTimer?.cancel();
    cameraSeconds = 0;
  }

  Future _openDialog(String url) => showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
            backgroundColor: ColorPalette.background,
            elevation: 0,
            content: ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: Image.network(url, fit: BoxFit.cover)),
            actions: [
              CustomElevatedBtn(
                onPressed: () => Navigator.of(context).pop(),
                name: 'Close',
                icon: Icons.close_rounded,
              )
            ],
          );
        },
      );

  @override
  void initState() {
    // Initialize notification
    // and listen to notification
    NotificationApi.init();
    listenNotifications();

    // Get value of doorbell's status from firebase realtime database
    // and show notification if doorbell is pressed
    rtdbRef.child('isDoorbellPressed').onValue.listen((event) {
      isDoorbellPressed = event.snapshot.value as bool;

      if (isDoorbellPressed) {
        NotificationApi.showNotification(
          title: 'Ding-dong!',
          body: 'Someone\'s at the door.',
          payload: 'door.status',
        );
        _cancelDoorbell();
      }

      setState(() {});
    });

    // Get value of photo's status from firebase realtime database
    rtdbRef.child('isPhotoTaken').onValue.listen((event) {
      setState(() => isPhotoTaken = event.snapshot.value as bool);

      if (isPhotoTaken) {
        _startCameraTimer();
      } else {
        _cancelCameraTimer();
      }
    });

    // Get value of door lock's status from firebase realtime database
    rtdbRef.child('isDoorLocked').onValue.listen(
        (event) => setState(() => isDoorLocked = event.snapshot.value as bool));

    // Get value of alarm's status from firebase realtime database
    rtdbRef.child('isAlarmActivated').onValue.listen((event) {
      setState(() => isAlarmActivated = event.snapshot.value as bool);

      if (isAlarmActivated) {
        _startAlarmTimer();
      } else {
        _cancelAlarmTimer();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    alarmTimer?.cancel();
    cameraTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;
    final currentDeviceID = context.watch<DeviceProvider>().currentDeviceID;

    return Padding(
      padding: Constants.bodyPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Align(
              child: Image.asset('images/3d-smart-door-2.png',
                  width: 300, height: 300)),
          const VGap(),

          // Title & minor buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Build device
                  FutureBuilder<DeviceModel?>(
                    future: readDevice(currentDeviceID),
                    builder: (context, snapshot) {
                      final deviceModel = snapshot.data;

                      if (snapshot.hasError) {
                        return ErrorMsg(msg: snapshot.toString());
                      } else if (snapshot.hasData) {
                        return deviceModel == null
                            ? Center(child: ErrorMsg(msg: snapshot.toString()))
                            : buildDevice(deviceModel);
                      } else {
                        return const CustomCircularProgress();
                      }
                    },
                  ),
                  Text('Status',
                      style: txtTheme.headlineMedium!.copyWith(
                          fontFamily: GoogleFonts.titilliumWeb().fontFamily,
                          fontWeight: FontWeight.w400)),
                ],
              ),
              Row(
                children: [
                  IconCircleBtn(
                      onPressed: () {
                        context.read<LayoutTertiaryProvider>().currentIndex = 0;
                        Navigator.pushNamed(context, '/layoutTertiary');
                      },
                      bgColor: ColorPalette.background,
                      icon: Icons.assignment_rounded),
                  IconCircleBtn(
                      onPressed: () {},
                      bgColor: ColorPalette.background,
                      icon: Icons.power_settings_new_rounded),
                ],
              )
            ],
          ),
          const VGap.large(),

          // Main buttons
          Card(
            color: ColorPalette.background,
            elevation: 4,
            child: Padding(
              padding: Constants.defaultPadding,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      StreamBuilder(
                        stream: getImageURL(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return ErrorMsg(msg: snapshot.toString());
                          } else if (snapshot.hasData) {
                            return IconCircleBtn(
                              onPressed: () {
                                _openDialog(snapshot.data as String);
                              },
                              bgColor: ColorPalette.shadow,
                              icon: Icons.photo_rounded,
                            );
                          } else {
                            return const CustomCircularProgress();
                          }
                        },
                      ),
                    ],
                  ),
                  const VGap.medium(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconCircleBtn(
                        onPressed: _captureImage,
                        bgColor: ColorPalette.shadow,
                        icon: Icons.photo_camera_rounded,
                      ),
                      IconCircleBtn(
                          onPressed: _toggleLock,
                          size: 96,
                          bgColor: isDoorLocked
                              ? ColorPalette.darkError
                              : ColorPalette.tertiary,
                          icon: isDoorLocked
                              ? Icons.vpn_key_off_rounded
                              : Icons.vpn_key_rounded,
                          fgColor: Colors.white),
                      IconCircleBtn(
                          onPressed: _toggleAlarm,
                          bgColor: isAlarmActivated
                              ? ColorPalette.darkError
                              : ColorPalette.shadow,
                          icon: Icons.warning_rounded,
                          fgColor: isAlarmActivated
                              ? Colors.white
                              : ColorPalette.darkError)
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildDevice(DeviceModel device) {
    return Text(device.name, style: Theme.of(context).textTheme.headlineMedium);
  }
}
