import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'Todo.dart';

class TodoCard extends StatelessWidget {
  final WidgetRef ref;
  final Todo todo;
  final Function(String? uuid) onPress;

  const TodoCard(
      {super.key,
      required this.ref,
      required this.todo,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "uuid : ${todo.uuid}",
                  style: const TextStyle(overflow: TextOverflow.ellipsis),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      onPress(todo.uuid);
                    },
                    icon: const Icon(Icons.delete))
              ],
            ),
            Text(todo.title ?? ""),
            Text(todo.desc ?? ""),
            Text(todo.createdAt ?? ""),
          ],
        ),
      ),
    );
  }
}
