import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:birmbhenawa/application/providers/date_picker_timeline_provider/notifier/date_picker_timeline_state_notifier.dart';

final datePickerTimelineProvider = StateNotifierProvider.autoDispose<
    DatePickerTimelineStateNotifier, DateTime>(
  (_) => DatePickerTimelineStateNotifier(),
);
