import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app_recorder/cubit/product.dart';
import 'package:test_app_recorder/product.dart';
import 'package:collection/collection.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          final totalPrice = (state.orders?.isNotEmpty ?? false)
              ? state.orders
                      ?.map((e) => e.price * e.count)
                      .toList()
                      .reduce((value, element) => value + element) ??
                  0
              : 0;
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    final product = productList[index];

                    final data = state.orders?.firstWhereOrNull(
                        (element) => element.id == product.id);
                    return Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Цена: ${product.price}',
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Expanded(
                                    child: IconButton(
                                      onPressed: () {
                                        if (data != null && data.count > 0) {
                                          context
                                              .read<ProductCubit>()
                                              .setOrders(
                                                Product(
                                                  name: product.name,
                                                  price: product.price,
                                                  id: product.id,
                                                  title: title,
                                                  count: data.count - 1,
                                                ),
                                                product.id,
                                              );
                                        }
                                      },
                                      icon: const Icon(Icons.remove),
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    '${data?.count ?? 0}',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  const SizedBox(width: 4),
                                  Expanded(
                                    child: IconButton(
                                      onPressed: () {
                                        context.read<ProductCubit>().setOrders(
                                              Product(
                                                name: product.name,
                                                price: product.price,
                                                id: product.id,
                                                title: title,
                                                count: data == null
                                                    ? 1
                                                    : data.count + 1,
                                              ),
                                              product.id,
                                            );
                                      },
                                      icon: const Icon(Icons.add),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        if (data != null && data.count > 0)
                          Text(
                            '+${data.count * product.price}',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.green,
                            ),
                          ),
                      ],
                    );
                  },
                  itemCount: productList.length,
                ),
              ),
              if (totalPrice > 0)
                Column(
                  children: [
                    Text(
                      'Итого: $totalPrice',
                      style: const TextStyle(fontSize: 24, color: Colors.green),
                    ),
                    const SizedBox(height: 8),
                    TextButton(
                      onPressed: () {
                        context.read<ProductCubit>().receiveOrders();
                      },
                      child: const Text(
                        'Принять заказ',
                        style: TextStyle(fontSize: 24, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
            ],
          );
        },
      ),
    );
  }
}
