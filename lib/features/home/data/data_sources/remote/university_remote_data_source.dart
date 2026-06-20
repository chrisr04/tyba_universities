import 'package:tyba_universities/core/network/http_client.dart';
import 'package:tyba_universities/features/home/data/models/university_model.dart';

class UniversityRemoteDataSource {
  const UniversityRemoteDataSource(this._client);

  final HttpClient _client;

  Future<List<UniversityModel>> getUniversities() async {
    final response = await _client.get('/FE-Engineer-test/universities.json');
    final responseList = List<Map<String, dynamic>>.from(response.data);
    return responseList.map(UniversityModel.fromJson).toList();
  }
}
