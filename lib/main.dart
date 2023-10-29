import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod/TodoCard.dart';
import 'package:todo_riverpod/TodoNotifier.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    )
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  void openDialog(BuildContext context, WidgetRef ref) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descController = TextEditingController();

    showDialog(context: context, builder: (context) {
      return Dialog(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoProvider);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Todo List"),
      ),
      body: ListView.builder(
        itemCount: todos.length, itemBuilder: (context, index) {
        return TodoCard(ref: ref, todo: todos[index], onPress: (uuid) {
          if (uuid != null) {
            ref.read(todoProvider.notifier).removeTodo(uuid);
          } else {
            return;
          }
        });
      },),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            openDialog(context, ref);
          },
          tooltip: 'Create New Todo',
          child: const Icon(Icons.add)
      ),
    );
  }
}


