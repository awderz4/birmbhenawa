import 'package:fimber/fimber.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:birmbhenawa/infastructure/core/constants/typedefs.dart';
import '../../../../domain/repositories/medicines_repository.dart';

enum DeleteMedicineState { initial, loading, loaded, error }

class DeleteMedicineStateNotifier extends StateNotifier<DeleteMedicineState> {
  final MedicinesRepository medicinesRepository;

  DeleteMedicineStateNotifier({
    required this.medicinesRepository,
  }) : super(DeleteMedicineState.initial);

  Future<void> deleteMedicine(int? id, IsNotified? isnotified) async {
    state = DeleteMedicineState.loading;

    final result = await medicinesRepository.deleteMedicine(
      id,
      isnotified,
    );

    if (result.isSuccess()) {
      state = DeleteMedicineState.loaded;
      Fimber.d('دەرمانەکە بە سەرکەوتوویی سڕاوە');
    } else {
      state = DeleteMedicineState.error;
      Fimber.e('کێشەیەک هەبوو لە کاتی سڕینەوەی دەرمانەکە');
    }
  }
}
