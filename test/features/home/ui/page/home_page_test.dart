import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';
import 'package:tyba_universities/common/widgets/horizontal_item_card.dart';
import 'package:tyba_universities/features/home/domain/entities/university_entity.dart';
import 'package:tyba_universities/features/home/ui/page/home_page.dart';
import 'package:tyba_universities/features/home/ui/view_model/home_ui_state.dart';
import 'package:tyba_universities/features/home/ui/view_model/home_view_model.dart';

class HomeViewModelMock extends Mock implements HomeViewModel {}

void main() {
  late HomeViewModelMock viewModelMock;

  setUp(() {
    viewModelMock = HomeViewModelMock();
  });

  Widget buildPage() {
    return MaterialApp(
      home: ChangeNotifierProvider<HomeViewModel>(
        create: (context) => viewModelMock,
        child: HomePage(),
      ),
    );
  }

  group('HomePage Test', () {
    testWidgets(
      'Should display CircularProgressIndicator when viewModel state isLoading is true',
      (tester) async {
        // Arrange
        final state = HomeUiState(isLoading: true);

        when(
          () => viewModelMock.loadUniversities(),
        ).thenAnswer((_) => Future<void>.value());
        when(() => viewModelMock.uiState).thenReturn(state);

        // Act
        await tester.pumpWidget(buildPage());

        await tester.pump();

        // Assert
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      },
    );

    testWidgets(
      'Should display university list entry card when viewModel state universities is not null',
      (tester) async {
        // Arrange
        final state = HomeUiState(
          isLoading: false,
          universities: [
            UniversityEntity(
              name: 'Point Park University',
              alphaTwoCode: 'US',
              domains: ['pointpark.edu'],
              country: 'United States',
              stateProvince: 'Pennsylvania',
              webPages: ['https://pointpark.edu/'],
            ),
          ],
        );

        when(
          () => viewModelMock.loadUniversities(),
        ).thenAnswer((_) => Future<void>.value());
        when(() => viewModelMock.uiState).thenReturn(state);

        // Act
        await tester.pumpWidget(buildPage());
        await tester.pump();

        // Assert
        expect(find.byType(HorizontalItemCard), findsOneWidget);
        expect(find.text('Point Park University'), findsOneWidget);
      },
    );

    testWidgets(
      'Should display error message when viewModel state errorMessage is not null',
      (tester) async {
        // Arrange
        final state = HomeUiState(isLoading: false, error: 'Error');

        when(
          () => viewModelMock.loadUniversities(),
        ).thenAnswer((_) => Future<void>.value());
        when(() => viewModelMock.uiState).thenReturn(state);

        // Act
        await tester.pumpWidget(buildPage());

        await tester.pump();

        // Assert
        expect(find.text('Error'), findsOneWidget);
      },
    );

    testWidgets(
      'Should call loadNextUniversitiesPage method when scroll is near to edge of screen',
      (tester) async {
        // Arrange
        final state = HomeUiState(
          isLoading: false,
          universities: List.generate(
            20,
            (index) => UniversityEntity(
              name: 'University $index',
              alphaTwoCode: 'US',
              domains: ['pointpark.edu'],
              country: 'United States',
              stateProvince: 'Pennsylvania',
              webPages: ['https://pointpark.edu/'],
            ),
          ),
        );

        when(
          () => viewModelMock.loadUniversities(),
        ).thenAnswer((_) => Future<void>.value());

        when(
          () => viewModelMock.loadNextUniversitiesPage(),
        ).thenAnswer((_) => Future<void>.value());

        when(() => viewModelMock.uiState).thenReturn(state);

        // Act
        await tester.pumpWidget(buildPage());

        await tester.pumpAndSettle();

        await tester.scrollUntilVisible(
          find.text(state.universities.last.name),
          100,
          scrollable: find.byType(Scrollable).last,
        );

        await tester.pumpAndSettle();

        // Assert
        final callCount = verify(
          () => viewModelMock.loadNextUniversitiesPage(),
        ).callCount;

        expect(callCount, greaterThan(1));
      },
    );
  });
}
