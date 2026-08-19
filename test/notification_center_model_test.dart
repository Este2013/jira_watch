import 'package:flutter_test/flutter_test.dart';
import 'package:jira_watcher/models/notification_center_model.dart';

void main() {
  // The model is a singleton, so each test clears it first rather than
  // relying on execution order to start from empty.
  setUp(() => NotificationCenterModel().clear());

  test('empty until something is added', () {
    expect(NotificationCenterModel().isEmpty, isTrue);
    expect(NotificationCenterModel().unreadCount, 0);
  });

  test('add makes it non-empty and unread', () {
    NotificationCenterModel().add(AppNotification(id: 'a', title: 'Hello'));
    expect(NotificationCenterModel().isEmpty, isFalse);
    expect(NotificationCenterModel().unreadCount, 1);
    expect(NotificationCenterModel().byId('a')?.title, 'Hello');
  });

  test('items are newest first', () {
    NotificationCenterModel().add(AppNotification(id: 'a', title: 'First'));
    NotificationCenterModel().add(AppNotification(id: 'b', title: 'Second'));
    expect(NotificationCenterModel().items.map((n) => n.id), ['b', 'a']);
  });

  test('adding the same id again replaces rather than duplicates', () {
    // What a download's progress notification and the daily update check both
    // rely on: re-posting "the same" notification updates it in place.
    NotificationCenterModel().add(AppNotification(id: 'a', title: 'v1'));
    NotificationCenterModel().add(AppNotification(id: 'a', title: 'v2'));
    expect(NotificationCenterModel().items.length, 1);
    expect(NotificationCenterModel().items.single.title, 'v2');
  });

  test('editing a field notifies the model, not just the item', () {
    final notification = AppNotification(id: 'a', title: 'Downloading…');
    NotificationCenterModel().add(notification);

    var modelNotified = false;
    NotificationCenterModel().addListener(() => modelNotified = true);

    notification.subtitle = '50%';

    expect(modelNotified, isTrue);
    expect(NotificationCenterModel().byId('a')?.subtitle, '50%');
  });

  test('markAllRead clears every unread flag', () {
    NotificationCenterModel().add(AppNotification(id: 'a', title: 'A'));
    NotificationCenterModel().add(AppNotification(id: 'b', title: 'B'));
    NotificationCenterModel().markAllRead();
    expect(NotificationCenterModel().unreadCount, 0);
  });

  test('remove drops the notification and detaches its listener', () {
    final notification = AppNotification(id: 'a', title: 'A');
    NotificationCenterModel().add(notification);
    NotificationCenterModel().remove('a');

    expect(NotificationCenterModel().isEmpty, isTrue);

    var modelNotifiedAfterRemoval = false;
    NotificationCenterModel().addListener(() => modelNotifiedAfterRemoval = true);
    notification.title = 'Still around?';
    expect(modelNotifiedAfterRemoval, isFalse);
  });

  test('add bumps arrivalTick once per genuinely new notification', () {
    final before = NotificationCenterModel().arrivalTick.value;
    NotificationCenterModel().add(AppNotification(id: 'a', title: 'A'));
    expect(NotificationCenterModel().arrivalTick.value, before + 1);
  });

  test('a loud notification is reported through loudArrival', () {
    NotificationCenterModel().add(AppNotification(id: 'a', title: 'A', loud: true));
    expect(NotificationCenterModel().loudArrival.value?.id, 'a');
  });

  test('a silent notification does not touch loudArrival', () {
    NotificationCenterModel().loudArrival.value = null;
    NotificationCenterModel().add(AppNotification(id: 'a', title: 'A', loud: false));
    expect(NotificationCenterModel().loudArrival.value, isNull);
  });
}
