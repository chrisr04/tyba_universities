import 'package:tyba_universities/core/errors/result.dart';
import 'package:tyba_universities/features/home/domain/entities/university_entity.dart';

abstract class UniversityRepository {
  Future<Result<List<UniversityEntity>>> getUniversities();
}
