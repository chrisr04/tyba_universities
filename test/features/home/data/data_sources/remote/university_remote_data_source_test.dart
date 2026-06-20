import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tyba_universities/core/network/http_client.dart';
import 'package:tyba_universities/features/home/data/data_sources/remote/university_remote_data_source.dart';

class HttpClientMock extends Mock implements HttpClient {}

void main() {
  late final UniversityRemoteDataSource dataSource;
  late final HttpClientMock httpClientMock;

  setUpAll(() {
    httpClientMock = HttpClientMock();
    dataSource = UniversityRemoteDataSource(httpClientMock);
  });

  group('UniversityRemoteDataSource Test', () {
    test(
      'getUniversities shoud return UniversityModel list when http response is success',
      () async {
        // Arrange
        final response = Response(
          requestOptions: RequestOptions(),
          data: [
            {
              'alpha_two_code': 'US',
              'domains': ['pointpark.edu'],
              'country': 'United States',
              'state-province': 'Pennsylvania',
              'web_pages': ['https://pointpark.edu/'],
              'name': 'Point Park University',
            },
          ],
        );

        when(
          () => httpClientMock.get('/FE-Engineer-test/universities.json'),
        ).thenAnswer((_) async => response);

        // Act
        final result = await dataSource.getUniversities();

        // Assert
        expect(result.length, equals(1));
        expect(result.first.name, equals('Point Park University'));
      },
    );

    test(
      'getUniversities should return NetworkException when http response is not expected',
      () async {
        // Arrange
        when(
          () => httpClientMock.get('/FE-Engineer-test/universities.json'),
        ).thenThrow(Exception());

        // Assert
        expect(() => dataSource.getUniversities(), throwsA(isA<Exception>()));
      },
    );
  });
}
