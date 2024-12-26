import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
  // this is the start point of your code, i.e. the main function
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  /*
     Everything in flutter is a widget, and your application is a
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
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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