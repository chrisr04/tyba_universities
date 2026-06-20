import 'package:flutter/widgets.dart';

abstract class ViewModel<T> extends ChangeNotifier {
  ViewModel(T initialState) : _uiState = initialState;

  T _uiState;

  T get uiState => _uiState;

  void notifyUi(T newState) {
    _uiState = newState;
    notifyListeners();
  }
}
