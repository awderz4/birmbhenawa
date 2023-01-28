import 'package:fimber/fimber.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:birmbhenawa/application/providers/latest_medicine_provider/state/latest_medicine_state.dart';
import '../../../../domain/repositories/medicines_repository.dart';

class LatestMedicineStateNotifier extends StateNotifier<LatestMedicineState> {
  final MedicinesRepository medicinesRepository;

  LatestMedicineStateNotifier({
    required this.medicinesRepository,
  }) : super(const LatestMedicineState.initial()) {
    getLatestMedicine();
  }

  Future<void> getLatestMedicine() async {
    state = const LatestMedicineState.loading();

    final result = await medicinesRepository.todayLatestMedicine;

    result.when(error: (_) {
      state = const LatestMedicineState.error();
      Fimber.e('هەڵە لە کاتی هێنانی نوێترین دەرمان ڕوویدا');
    }, success: (medicine) {
      if (medicine == null) {
        state = const LatestMedicineState.empty();
        Fimber.d('هیچ دەرمانێکی نوێ نیە');
      } else {
        state = LatestMedicineState.loaded(medicine);
        Fimber.d('بە سەرکەوتوویی نوێترین دەرمانی هێنرا');
      }
    });
  }
}
