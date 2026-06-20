import 'package:tyba_universities/core/errors/network_exception.dart';
import 'package:tyba_universities/core/errors/result.dart';
import 'package:tyba_universities/features/home/data/data_sources/remote/university_remote_data_source.dart';
import 'package:tyba_universities/features/home/domain/entities/university_entity.dart';
import 'package:tyba_universities/features/home/domain/repositories/university_repository.dart';

class UniversityRespositoryImpl implements UniversityRepository {
  UniversityRespositoryImpl(this._remoteDataSource);

  final UniversityRemoteDataSource _remoteDataSource;

  @override
  Future<Result<List<UniversityEntity>>> getUniversities() async {
    try {
      final universities = await _remoteDataSource.getUniversities();

      return Result.ok(universities);
    } catch (error) {
      return Result.failure(
        NetworkException('Algo salió mal, intenta mas tarde'),
      );
    }
  }
}
