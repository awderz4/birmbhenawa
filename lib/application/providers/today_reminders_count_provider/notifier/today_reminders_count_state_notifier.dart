import 'package:fimber/fimber.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../domain/repositories/medicines_repository.dart';
import '../state/today_reminders_count_state.dart';

class TodayRemindersCountStateNotifier
    extends StateNotifier<TodayRemindersCountState> {
  final MedicinesRepository medicinesRepository;

  TodayRemindersCountStateNotifier({
    required this.medicinesRepository,
  }) : super(const TodayRemindersCountState.initial()) {
    getRemindersCount();
  }

  Future<void> getRemindersCount() async {
    state = const TodayRemindersCountState.loading();

    final result = await medicinesRepository.todayActiveMedicinesCount;

    result.when(error: (_) {
      state = const TodayRemindersCountState.error();
      Fimber.e('هەڵە ڕوویدا لەکاتی بەدەستهێنانی ئەمڕۆ دەرمانە چالاکەکان ژمارە');
    }, success: (count) {
      state = TodayRemindersCountState.loaded(count);
      Fimber.d('بە سەرکەوتوویی هێنرا ئەمڕۆ دەرمانی چالاک ژمارەیی');
    });
  }
}
