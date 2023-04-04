import 'dart:async';
import 'package:event_bus/event_bus.dart';
import 'event_object.dart';

class EventBusHandler {
  static EventBus eventBus = EventBus();

  static StreamSubscription<EventObject> listen(Function(EventObject event) onReceive) {
    return eventBus.on<EventObject>().listen((event) {
      onReceive(event);
    });
  }

  static post(EventObject data) {
    eventBus.fire(data);
  }
}
