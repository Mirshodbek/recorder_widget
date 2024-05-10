part of 'product.dart';

class ProductState {
  final List<Product>? orders;
  final List<Product>? receivedOrders;

  ProductState({
    this.orders,
    this.receivedOrders,
  });
}
