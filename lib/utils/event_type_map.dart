import 'event_type.dart';

EventType eventTypeMap(String eventTypeString) {
  switch (eventTypeString) {
    case 'doorEnable':
      return EventType.doorEnable;
    case 'doorDisable':
      return EventType.doorDisable;
    case 'doorKnock':
      return EventType.doorKnock;
    case 'doorLock':
      return EventType.doorLock;
    case 'doorUnlock':
      return EventType.doorUnlock;
    case 'alarmActivation':
      return EventType.alarmActivation;
    case 'alarmDeactivation':
      return EventType.alarmDeactivation;
    case 'imageCapture':
      return EventType.imageCapture;
    default:
      throw ArgumentError('Invalid eventTypeString: $eventTypeString');
  }
}
