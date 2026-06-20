import 'package:provider/provider.dart';
import 'package:tyba_universities/core/network/http_client.dart';
import 'package:tyba_universities/features/home/data/data_sources/remote/university_remote_data_source.dart';
import 'package:tyba_universities/features/home/data/repositories/university_respository_impl.dart';
import 'package:tyba_universities/features/home/domain/repositories/university_repository.dart';
import 'package:tyba_universities/features/home/domain/uses_cases/get_universities_use_case.dart';
import 'package:tyba_universities/features/home/ui/view_model/home_view_model.dart';

class HomeDependencies {
  HomeDependencies._();

  static final providers = [
    Provider<UniversityRemoteDataSource>(
      create: (context) =>
          UniversityRemoteDataSource(context.read<HttpClient>()),
    ),
    Provider<UniversityRepository>(
      create: (context) =>
          UniversityRespositoryImpl(context.read<UniversityRemoteDataSource>()),
    ),
    Provider<GetUniversitiesUseCase>(
      create: (context) =>
          GetUniversitiesUseCase(context.read<UniversityRepository>()),
    ),
    ChangeNotifierProvider(
      create: (context) =>
          HomeViewModel(context.read<GetUniversitiesUseCase>()),
    ),
  ];
}
