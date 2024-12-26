import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
  // this is the start point of your code, i.e. the main function
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  /*
     everything in flutter is a widget, and your application is a
     tree of these widgets, and MyApp in this case acts as the root
     of this widget tree.
   */

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gratitude App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Your Gratitude'),
    );
  }
  // mostly has meta-data such as the title, type of theme and so on
}

class MyHomePage extends StatefulWidget {

  /*
  this right here is a stateful widget, i.e. a dynamic widget
  which basically means it has the ability to change itself given certain
  changes in state.

  in more easy terms, it can look out for change, and change itself accordingly.
   */

  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
   /*
   every stateful widget has two parts,
   1. an immutable widget, the widget itself
   2. a mutable state widget, to hold changing data
    */
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( // provides basic structure for the screen
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView(
        children: const [
          ListTile(
            title: Text("I'm grateful for my family."),
          ),
          ListTile(
            title: Text("I'm grateful for my health."),
          ),
          ListTile(
            title: Text("I'm grateful for the opportunity to learn Flutter."),
          ),
        ],
      ),
    );
  }
}