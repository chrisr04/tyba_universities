import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tyba_universities/core/errors/network_exception.dart';
import 'package:tyba_universities/core/errors/result.dart';
import 'package:tyba_universities/features/home/domain/entities/university_entity.dart';
import 'package:tyba_universities/features/home/domain/uses_cases/get_universities_use_case.dart';
import 'package:tyba_universities/features/home/ui/view_model/home_ui_state.dart';
import 'package:tyba_universities/features/home/ui/view_model/home_view_model.dart';

class GetUniversitiesUseCaseMock extends Mock
    implements GetUniversitiesUseCase {}

void main() {
  late HomeViewModel viewModel;
  late GetUniversitiesUseCaseMock getUniversitiesUseCaseMock;

  setUp(() {
    getUniversitiesUseCaseMock = GetUniversitiesUseCaseMock();
    viewModel = HomeViewModel(getUniversitiesUseCaseMock);
  });

  group('HomeViewModel Test', () {
    test(
      'loadUniversities shoud notify universities when getUniversitiesUseCase is success',
      () async {
        // Arrange
        final universities = [
          UniversityEntity(
            name: 'Point Park University',
            alphaTwoCode: 'US',
            domains: ['pointpark.edu'],
            country: 'United States',
            stateProvince: 'Pennsylvania',
            webPages: ['https://pointpark.edu/'],
          ),
        ];

        final statesEmitted = <HomeUiState>[];

        when(
          () => getUniversitiesUseCaseMock(
            viewModel.uiState.offset,
            viewModel.uiState.limit,
          ),
        ).thenAnswer((_) async => Result.ok(universities));

        void notifierListener() {
          statesEmitted.add(viewModel.uiState);
        }

        // Act
        viewModel.addListener(notifierListener);

        await viewModel.loadUniversities();

        viewModel.removeListener(notifierListener);

        // Assert
        expect(statesEmitted.first.isLoading, isTrue);
        expect(statesEmitted.first.universities, isEmpty);

        expect(statesEmitted.last.universities, equals(universities));
        expect(statesEmitted.last.isLoading, isFalse);
      },
    );

    test(
      'loadUniversities shoud notify error when getUniversitiesUseCase is failure',
      () async {
        // Arrange
        final statesEmitted = <HomeUiState>[];
        final error = NetworkException('Error');

        when(
          () => getUniversitiesUseCaseMock(
            viewModel.uiState.offset,
            viewModel.uiState.limit,
          ),
        ).thenAnswer((_) async => Result.failure(error));

        void notifierListener() {
          statesEmitted.add(viewModel.uiState);
        }

        // Act
        viewModel.addListener(notifierListener);

        await viewModel.loadUniversities();

        viewModel.removeListener(notifierListener);

        // Assert
        expect(statesEmitted.first.isLoading, isTrue);
        expect(statesEmitted.first.universities, isEmpty);

        expect(statesEmitted.last.error, equals('Error'));
        expect(statesEmitted.last.isLoading, isFalse);
      },
    );
  });
}
