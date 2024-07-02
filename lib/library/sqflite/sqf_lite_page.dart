
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:libraries/library/sqflite/database/todo_db.dart';
import 'package:libraries/library/sqflite/model/todo_model.dart';
import 'package:libraries/library/sqflite/widgets/todo_widget.dart';

class SqfLitePage extends StatefulWidget {
  final String pageTitle;
  const SqfLitePage({super.key, required this.pageTitle});

  @override
  State<SqfLitePage> createState() => _SqfLitePageState();
}

class _SqfLitePageState extends State<SqfLitePage> {

  late Future<List<TodoModel>>? _futureTodos;
  final todoDB = TodoDB();

  void fetchTodos() {
    setState(() {
      _futureTodos = todoDB.fetchAll();
    });
  }

  @override
  void initState() {
    super.initState();
    fetchTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pageTitle),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) {
              return CreateTodoWidget(
                onSubmit: (title) async {
                  await todoDB.create(title: title);
                  if (!mounted) return;
                  fetchTodos();
                  Navigator.of(context).pop();
                },
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),

      body: FutureBuilder<List<TodoModel>>(
        future: _futureTodos,
        builder: (BuildContext context, AsyncSnapshot<List<TodoModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            final todos = snapshot.data!;

            return todos.isEmpty
              ? const Center(
                  child: Text('No Todos..'),
                )
              : ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(height: 12),
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    final todo = todos[index];
                    final subTitle = DateFormat('yyyy/MM/dd').format(
                      DateTime.parse(todo.updatedAt ?? todo.createdAt));

                    return ListTile(
                      title: Text(
                        todo.title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(subTitle),
                      trailing: IconButton(
                        onPressed: () async {
                          await todoDB.delete(todo.id);
                          fetchTodos();
                        },
                        icon: const Icon(Icons.delete_forever_outlined, color: Colors.red),
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return CreateTodoWidget(
                              todo: todo,
                              onSubmit: (title) async {
                                await todoDB.update(id: todo.id, title: title);
                                fetchTodos();
                                if (!mounted) return;
                                Navigator.of(context).pop();
                              },
                            );
                          },
                        );
                      },
                    );
                  },
            );

          }
          return const Center(child: CircularProgressIndicator.adaptive());
        },
        // builder: (context, snapshot) {
        //   if (snapshot.connectionState == ConnectionState.waiting) {
        //     return const Center(child: CircularProgressIndicator());
        //   } else {
        //     final todos = snapshot.data!;
        //     return todos.isEmpty
        //       ? const Center(
        //           child: Text('No Todos..'),
        //         )
        //       : ListView.separated(
        //           separatorBuilder: (context, index) => const SizedBox(height: 12),
        //           itemCount: todos.length,
        //           itemBuilder: (context, index) {
        //             final todo = todos[index];
        //             final subTitle = DateFormat('yyyy/MM/dd').format(
        //               DateTime.parse(todo.updatedAt ?? todo.createdAt));
        //
        //             return ListTile(
        //               title: Text(
        //                 todo.title,
        //                 style: const TextStyle(fontWeight: FontWeight.bold),
        //               ),
        //               subtitle: Text(subTitle),
        //               trailing: IconButton(
        //                 onPressed: () async {
        //                   await todoDB.delete(todo.id);
        //                   fetchTodos();
        //                 },
        //                 icon: const Icon(Icons.delete_forever_outlined, color: Colors.red),
        //               ),
        //               onTap: () {
        //                 showDialog(
        //                   context: context,
        //                   builder: (context) {
        //                     return CreateTodoWidget(
        //                       todo: todo,
        //                       onSubmit: (title) async {
        //                         await todoDB.update(id: todo.id, title: title);
        //                         fetchTodos();
        //                         if (!mounted) return;
        //                         Navigator.of(context).pop();
        //                       },
        //                     );
        //                   },
        //                 );
        //               },
        //             );
        //           },
        //     );
        //
        //   }
        //   //return const Center(child: CircularProgressIndicator.adaptive());
        // },
      ),
    );
  }
}


