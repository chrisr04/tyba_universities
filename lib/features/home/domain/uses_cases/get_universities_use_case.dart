import 'package:tyba_universities/core/errors/result.dart';
import 'package:tyba_universities/features/home/domain/entities/university_entity.dart';
import 'package:tyba_universities/features/home/domain/repositories/university_repository.dart';

class GetUniversitiesUseCase {
  const GetUniversitiesUseCase(this._repository);

  final UniversityRepository _repository;

  Future<Result<List<UniversityEntity>>> call() {
    return _repository.getUniversities();
  }
}
