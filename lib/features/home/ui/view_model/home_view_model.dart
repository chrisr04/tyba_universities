import 'package:tyba_universities/common/view_model/view_model.dart';
import 'package:tyba_universities/features/home/domain/uses_cases/get_universities_use_case.dart';
import 'package:tyba_universities/features/home/ui/view_model/home_ui_state.dart';

class HomeViewModel extends ViewModel<HomeUiState> {
  HomeViewModel(this._getUniversitiesUseCase) : super(HomeUiState());

  final GetUniversitiesUseCase _getUniversitiesUseCase;

  Future<void> loadUniversities() async {
    notifyUi(uiState.copyWith(isLoading: true));

    final result = await _getUniversitiesUseCase();

    if (result.isOk) {
      final universities = result.data;
      notifyUi(uiState.copyWith(isLoading: false, universities: universities));
      return;
    }

    notifyUi(
      uiState.copyWith(isLoading: false, error: result.error.toString()),
    );
  }
}
