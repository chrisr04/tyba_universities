import 'package:tyba_universities/features/home/domain/entities/university_entity.dart';

class HomeUiState {
  HomeUiState({
    this.universities = const [],
    this.isLoading = false,
    this.isLoadingNext = false,
    this.error,
    this.offset = 0,
    this.limit = 20,
  });

  final List<UniversityEntity> universities;
  final bool isLoading;
  final bool isLoadingNext;
  final String? error;
  final int offset;
  final int limit;

  HomeUiState copyWith({
    List<UniversityEntity>? universities,
    bool? isLoading,
    bool? isLoadingNext,
    String? error,
    int? offset,
    int? limit,
  }) => HomeUiState(
    universities: universities ?? this.universities,
    isLoading: isLoading ?? this.isLoading,
    isLoadingNext: isLoadingNext ?? this.isLoadingNext,
    error: error ?? this.error,
    offset: offset ?? this.offset,
    limit: limit ?? this.limit,
  );
}
