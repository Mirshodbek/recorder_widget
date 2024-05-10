import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:collection/collection.dart';

import '../product.dart';

part 'state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductState());

  void setOrders(Product product, int id) {
    var data = state.orders;

    if ((state.orders?.isEmpty ?? true) ||
        data?.singleWhereOrNull((e) => e.id == id) == null) {
      emit(
        ProductState(
          orders: [...?data, product],
          receivedOrders: state.receivedOrders,
        ),
      );
    } else {
      data?.remove(data.singleWhere((e) => e.id == id));
      emit(
        ProductState(
          orders: [...?data, product],
          receivedOrders: state.receivedOrders,
        ),
      );
    }
  }

  void receiveOrders() {
    var data = state.orders;
    emit(ProductState(
      orders: [],
      receivedOrders: [...?state.receivedOrders, ...?data],
    ));
  }
}
