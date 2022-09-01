import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/home.dart';
import 'todoprovider.dart';
import 'home.dart';

void main() {
  runApp( MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => TodoProvider()),
      child: MaterialApp(
        title: 'Simple ToDo App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.lightBlue),
        ),
        home:  home(),
      ),
    );
  }
}