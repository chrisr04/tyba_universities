import 'package:tyba_universities/features/home/domain/entities/university_entity.dart';

class HomeUiState {
  HomeUiState({
    this.universities = const [],
    this.isLoading = false,
    this.error,
  });

  final List<UniversityEntity> universities;
  final bool isLoading;
  final String? error;

  HomeUiState copyWith({
    List<UniversityEntity>? universities,
    bool? isLoading,
    String? error,
  }) => HomeUiState(
    universities: universities ?? this.universities,
    isLoading: isLoading ?? this.isLoading,
    error: error ?? this.error,
  );
}
