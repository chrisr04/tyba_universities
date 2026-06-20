import 'package:tyba_universities/core/errors/result.dart';
import 'package:tyba_universities/features/home/domain/entities/university_entity.dart';
import 'package:tyba_universities/features/home/domain/repositories/university_repository.dart';

class GetUniversitiesUseCase {
  GetUniversitiesUseCase(this._repository);

  final UniversityRepository _repository;

  final List<UniversityEntity> _universities = [];

  Future<Result<List<UniversityEntity>>> call(int offset, int limit) async {
    if (_universities.isEmpty) {
      final result = await _repository.getUniversities();

      if (result.isFailure) {
        return Result.failure(result.error!);
      }

      _universities.addAll(result.data);
    }

    final page = _universities.skip(offset).take(limit).toList();

    return Result.ok(page);
  }
}
