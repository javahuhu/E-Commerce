import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchbarViewModel extends StateNotifier<List<String>> {
  SearchbarViewModel() : super([]);

  void addSearch(String text) {
    if (text.isNotEmpty && !state.contains(text)) {
      state = [...state, text];
    }
  }

  void removeSearch(String text) {
    state = state.where((item) => item != text).toList();
  }
}

final searchbarProvider =
    StateNotifierProvider<SearchbarViewModel, List<String>>((ref) {
      return SearchbarViewModel();
    });


/*========================================================================================================================= */

class SearchHisotryViewModel extends StateNotifier<List<String>> {
  SearchHisotryViewModel() : super([]);

  void addSearchHistory(String text) {
    if (text.isNotEmpty && !state.contains(text)) {
      state = [...state, text];
    }
  }

  void removeSearchHistory(String text) {
    state = state.where((item) => item != text).toList();
  }

  void clearHistory(){
    state = [];
  }
}

final searchHistoryProvider =
    StateNotifierProvider<SearchHisotryViewModel, List<String>>((ref) {
      return SearchHisotryViewModel();
    });
