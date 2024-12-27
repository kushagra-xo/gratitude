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
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Gratify'),
      debugShowCheckedModeBanner: false,
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
  List<String> _entries = []; // this is a list of entries
  void _showAddEntryDialog(){ // this function handles the clicking of FAB(floating action button)
    /*
    A text editing controller object is your way to interact with the user input.
    You can use this to access the text inserted by the user in the text field.
     */
    final TextEditingController controller = TextEditingController();
    showDialog(
      context: context, // context is morever like, where and with what tools am i supposed to build this widget
      builder: (BuildContext context){ // builder is like the recipe of construction
        return AlertDialog(
           title: Text("Add new entry"),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: "What are you grateful for?"),
          ),
          actions: [
            TextButton(onPressed: () {
              Navigator.of(context).pop();
            }, child: const Text("Cancel")
            ),
            TextButton(onPressed: (){
              setState(() {
                _entries.add(controller.text);
              });
              Navigator.of(context).pop();
            }, child: const Text("Add")
            )
          ],
        );
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold( // provides basic structure for the screen
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      floatingActionButton:FloatingActionButton(
        onPressed: _showAddEntryDialog,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: _entries.length,
        itemBuilder: (BuildContext context, int index){
          return ListTile(
          title: Text(_entries[index]),
          );
        }
      ),
    );
  }
}