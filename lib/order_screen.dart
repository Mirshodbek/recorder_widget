import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app_recorder/cubit/product.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final totalPrice = state.receivedOrders
                    ?.map((e) => e.price * e.count)
                    .toList()
                    .reduce((value, element) => value + element) ??
                0;

            final data = state.receivedOrders?[index];
            return ExpansionTile(
              tilePadding: const EdgeInsets.symmetric(horizontal: 20),
              childrenPadding: EdgeInsets.zero,
              title: Row(
                children: [
                  Expanded(
                    child: Text(
                      data?.title ?? '',
                    ),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      'Итого: $totalPrice',
                    ),
                  ),
                ],
              ),
              children: [
                Column(
                  children: [
                    Text('Цена: ${data?.price}'),
                    const SizedBox(height: 8),
                    Text('Штук: ${data?.count}'),
                  ],
                ),
              ],
            );
          },
          itemCount: state.receivedOrders?.length ?? 0,
        );
      },
    );
  }
}
