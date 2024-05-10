import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TableScreen extends StatelessWidget {
  const TableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                GoRouter.of(context).pushNamed('menu', extra: 'Первый стол');
              },
              child: Container(
                color: Colors.lightBlue,
                height: 100,
                padding: const EdgeInsets.all(8),
                alignment: Alignment.center,
                child: const Text('Первый стол'),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: InkWell(
              onTap: () {
                GoRouter.of(context).pushNamed('menu', extra: 'Второй стол');
              },
              child: Container(
                color: Colors.lightBlue,
                height: 100,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8),
                child: const Text('Второй стол'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
