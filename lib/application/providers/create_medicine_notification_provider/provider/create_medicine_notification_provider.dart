import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:birmbhenawa/infastructure/core/constants/typedefs.dart';
import 'package:birmbhenawa/application/providers/create_medicine_notification_provider/notifier/create_medicine_notification_state_notifier.dart';

final createMedicineNotificationProvider = StateNotifierProvider.autoDispose<
    CreateMedicineNotificationStateNotifier, IsNotified>((_) {
  return CreateMedicineNotificationStateNotifier();
});
