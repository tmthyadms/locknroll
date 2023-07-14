import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../components/circle_icon.dart';
import '../../components/circular_progress.dart';
import '../../components/error_msg.dart';
import '../../components/gaps/hgap.dart';
import '../../components/gaps/vgap.dart';
import '../../models/device_model.dart';
import '../../models/user_model.dart';
import '../../services/list_devices_service.dart';
import '../../services/user_details_service.dart';
import '../../utils/constants.dart';
import 'components/add_device_btn.dart';
import 'components/device_btn.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;

    return Padding(
      padding: Constants.bodyPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Greets user
          FutureBuilder<UserModel?>(
            future: readUser(),
            builder: (context, snapshot) {
              final userModel = snapshot.data;
              if (snapshot.hasError) {
                return ErrorMsg(msg: snapshot.toString());
              } else if (snapshot.hasData) {
                return userModel == null
                    ? Center(child: ErrorMsg(msg: snapshot.toString()))
                    : buildUser(userModel);
              } else {
                return const CustomCircularProgress();
              }
            },
          ),
          const VGap(),

          // Display current date
          Row(
            children: [
              const Icon(Icons.today),
              const HGap(),
              Text(DateFormat.yMMMMEEEEd().format(DateTime.now()),
                  style: txtTheme.titleSmall)
            ],
          ),
          const VGap.large(),

          // Divider
          const Divider(),
          const VGap.large(),

          // User devices
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Your devices', style: txtTheme.headlineSmall),
              GestureDetector(
                  onTap: () {},
                  child: const CircleIcon(
                      padding: 0, icon: Icons.more_horiz_rounded))
            ],
          ),
          const VGap.medium(),
          SizedBox(
            width: double.infinity,
            child: StreamBuilder<List<DeviceModel>>(
              stream: readDevices(),
              builder: (context, snapshot) {
                final devices = snapshot.data;

                if (snapshot.hasError) {
                  return ErrorMsg(msg: snapshot.toString());
                } else if (snapshot.hasData) {
                  final devicesList = devices?.map(buildDevice).toList();
                  devicesList?.add(const AddDeviceBtn());
                  return devices == null
                      ? Center(child: ErrorMsg(msg: snapshot.toString()))
                      : Wrap(
                          runSpacing: 10,
                          alignment: WrapAlignment.spaceBetween,
                          children: devicesList!);
                } else {
                  return const CustomCircularProgress();
                }
              },
            ),
          ),
          const VGap.large()
        ],
      ),
    );
  }

  Widget buildUser(UserModel user) {
    return Text('Welcome, ${user.firstName}',
        style: Theme.of(context).textTheme.headlineMedium);
  }

  Widget buildDevice(DeviceModel device) {
    return DeviceBtn(
        wasEnabled: device.isEnabled,
        wasLocked: device.isLocked,
        name: device.name,
        deviceID: device.deviceID);
  }
}
