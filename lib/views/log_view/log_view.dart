import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../components/circular_progress.dart';
import '../../components/error_msg.dart';
import '../../components/gaps/vgap.dart';
import '../../models/device_model.dart';
import '../../models/log_model.dart';
import '../../providers/device_provider.dart';
import '../../services/device_details_service.dart';
import '../../services/list_logs_service.dart';
import '../../theme/utils/color_palette.dart';
import '../../utils/constants.dart';
import '../../utils/event_type.dart';
import 'component/log_details_tile.dart';

class LogView extends StatefulWidget {
  const LogView({super.key});

  @override
  State<LogView> createState() => _LogViewState();
}

class _LogViewState extends State<LogView> {
  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;
    final currentDeviceID = context.watch<DeviceProvider>().currentDeviceID;

    return Padding(
        padding: Constants.bodyPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title log
            FutureBuilder(
              future: readDevice(currentDeviceID),
              builder: (context, snapshot) {
                final device = snapshot.data;

                if (snapshot.hasError) {
                  return ErrorMsg(msg: snapshot.toString());
                } else if (snapshot.hasData) {
                  return device == null
                      ? Center(child: ErrorMsg(msg: snapshot.toString()))
                      : buildDevice(device);
                } else {
                  return const CustomCircularProgress();
                }
              },
            ),
            Text('Log',
                style: txtTheme.headlineMedium!.copyWith(
                    fontFamily: GoogleFonts.titilliumWeb().fontFamily,
                    fontWeight: FontWeight.w400)),
            const VGap.large(),

            // Current date
            Text(DateFormat.MMMMEEEEd().format(DateTime.now()),
                style: txtTheme.headlineSmall),
            const VGap.medium(),

            // Logs
            Card(
                color: ColorPalette.background,
                elevation: 4,
                child: Padding(
                  padding: Constants.defaultPadding,
                  child: StreamBuilder<List<LogModel>>(
                      stream: readLogs(currentDeviceID),
                      builder: (context, snapshot) {
                        final logs = snapshot.data;

                        if (snapshot.hasError) {
                          return ErrorMsg(msg: snapshot.toString());
                        } else if (snapshot.hasData) {
                          final logsList = logs?.map(buildLog).toList();

                          if (logs!.isNotEmpty) {
                            return Column(children: logsList as List<Widget>);
                          } else {
                            return Center(
                                child: Text(
                                    'No activity yet.\nYour smart door lock is ready and waiting!',
                                    textAlign: TextAlign.center,
                                    style: txtTheme.labelLarge!
                                        .copyWith(color: Colors.black54)));
                          }
                        } else {
                          return const CustomCircularProgress();
                        }
                      }),
                )),
            const VGap.large()
          ],
        ));
  }

  Widget buildDevice(DeviceModel device) {
    return Text(device.name, style: Theme.of(context).textTheme.headlineMedium);
  }

  Widget buildLog(LogModel log) {
    String subject = '...';
    String status = '...';
    Color statusColor = Colors.black;
    IconData icon = Icons.hourglass_empty_outlined;

    switch (log.eventType) {
      case EventType.doorEnable:
        subject = 'Door';
        status = 'Enabled';
        statusColor = ColorPalette.tertiary;
        icon = Icons.power_settings_new_outlined;
        break;
      case EventType.doorDisable:
        subject = 'Door';
        status = 'Disabled';
        statusColor = ColorPalette.darkError;
        icon = Icons.power_settings_new_outlined;
        break;
      case EventType.doorKnock:
        subject = 'Door';
        status = 'Knocked';
        statusColor = ColorPalette.secondary;
        icon = Icons.doorbell_outlined;
        break;
      case EventType.doorLock:
        subject = 'Door';
        status = 'Locked';
        statusColor = ColorPalette.tertiary;
        icon = Icons.vpn_key_outlined;
        break;
      case EventType.doorUnlock:
        subject = 'Door';
        status = 'Unlocked';
        statusColor = ColorPalette.darkError;
        icon = Icons.vpn_key_off_outlined;
        break;
      case EventType.alarmActivation:
        subject = 'Alarm';
        status = 'Activated';
        statusColor = ColorPalette.darkError;
        icon = Icons.warning_outlined;
        break;
      case EventType.alarmDeactivation:
        subject = 'Alarm';
        status = 'Deactivated';
        statusColor = ColorPalette.tertiary;
        icon = Icons.warning_outlined;
        break;
      case EventType.imageCapture:
        subject = 'Image';
        status = 'Captured';
        statusColor = ColorPalette.secondary;
        icon = Icons.photo_camera_outlined;
        break;
    }

    return LogDetailsTile(
        icon: icon,
        subject: subject,
        status: status,
        statusColor: statusColor,
        date: log.dateOccured);
  }
}
