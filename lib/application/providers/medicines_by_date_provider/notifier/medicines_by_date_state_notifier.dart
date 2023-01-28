import 'package:fimber/fimber.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../domain/repositories/medicines_repository.dart';
import '../state/medicines_by_date_state.dart';

class MedicinesByDateStateNotifier extends StateNotifier<MedicinesByDateState> {
  final MedicinesRepository medicinesRepository;
  final DateTime date;

  MedicinesByDateStateNotifier({
    required this.medicinesRepository,
    required this.date,
  }) : super(const MedicinesByDateState.initial()) {
    getMedicines();
  }

  Future<void> getMedicines() async {
    state = const MedicinesByDateState.loading();

    final result = await medicinesRepository.getMedicinesByDate(date);

    result.when(error: (_) {
      state = const MedicinesByDateState.error();
      Fimber.e('هەڵە لە کاتی هێنانی دەرمان ڕوویدا');
    }, success: (medicines) {
      if (medicines!.isEmpty) {
        state = const MedicinesByDateState.empty();
        Fimber.d('هیچ دەرمانێک نیە');
      } else {
        state = MedicinesByDateState.loaded(medicines);
        Fimber.d('بە سەرکەوتوویی دەرمانی هێنا');
      }
    });
  }
}
