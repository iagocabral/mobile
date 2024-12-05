import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/task_viewmodel.dart';
import 'views/task_list_view.dart';
import 'views/add_task_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskViewModel(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.cyan, // Cor principal (AppBar, botões, etc.)
          colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.orange), // Cor de destaque
          textTheme: TextTheme(
            bodyLarge: TextStyle(fontSize: 18.0, color: Colors.black), // bodyText1 agora é bodyLarge
          ),
        ),
        darkTheme: ThemeData.dark(), // Tema escuro
        themeMode: ThemeMode.system,
        title: 'To-Do List',
        initialRoute: '/',
        routes: {
          '/': (context) => TaskListView(),
          '/add': (context) => AddTaskView(),
        },
      ),
    );
  }
}