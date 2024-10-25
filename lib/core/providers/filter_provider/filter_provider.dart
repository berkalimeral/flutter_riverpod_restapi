import 'package:flutter_riverpod/flutter_riverpod.dart';

final filterProvider =
    StateNotifierProvider<FilterNotifier, FilterState>((ref) {
  return FilterNotifier();
});

class FilterState {
  final String? selectedStatus;
  final String? selectedGender;

  FilterState({this.selectedStatus, this.selectedGender});

  FilterState copyWith({String? selectedStatus, String? selectedGender}) {
    return FilterState(
      selectedStatus: selectedStatus ?? this.selectedStatus,
      selectedGender: selectedGender ?? this.selectedGender,
    );
  }
}

class FilterNotifier extends StateNotifier<FilterState> {
  FilterNotifier() : super(FilterState());

  void setStatus(String? status) {
    state = state.copyWith(selectedStatus: status);
  }

  void setGender(String? gender) {
    state = state.copyWith(selectedGender: gender);
  }
}
