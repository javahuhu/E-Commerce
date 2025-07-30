import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuantityProvider extends StateNotifier<Map<String, int>> {
  QuantityProvider() : super({});

    void add(String id) {
      final current = state[id] ?? 1;
      state = {...state, id: current + 1};
    }

    void minus(String id) {
      final current = state[id] ?? 1;
      if(current > 1) {
      state = {...state, id: current - 1};
      }
    }

    int quantity(String id) {
      return state[id] ?? 1;
    }
  
}

final quantityProvider =
    StateNotifierProvider<QuantityProvider, Map<String, int>>((ref) {
      return QuantityProvider();
    });
