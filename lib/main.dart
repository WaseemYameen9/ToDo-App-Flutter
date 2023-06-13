import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/slashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: splashscreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var todoText = TextEditingController();
  List<String> arr = [];

  @override
  void initState() {
    super.initState();
    loadListFromSharedPreferences(); // Load the list from shared preferences when the widget initializes
  }

  // Function to load the list from shared preferences
  Future<void> loadListFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList('todo');
    if (list != null) {
      setState(() {
        arr = list;
      });
    }
  }

  // Function to save the list to shared preferences
  Future<void> saveListToSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('todo', arr);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        title: const Center(
            child: Text("TODO List", style: TextStyle(color: Colors.white))),
      ),
      body: Container(
        color: Colors.blue.shade50,
        child: Column(
          children: [
            const SizedBox(height: 30),
            Expanded(
              child: Container(
                color: Colors.blue.shade50,
                margin: const EdgeInsets.only(top: 20),
                child: Card(
                  elevation: 0,
                  color: Colors.blue.shade50,
                  child: ListView.builder(
                    itemCount: arr.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 2,
                        child: ListTile(
                          tileColor: Colors.indigo.shade200,
                          leading: const Icon(
                            Icons.forward,
                            color: Colors.blue,
                            size: 30,
                          ),
                          title: Text(arr[index]),
                          trailing: IconButton(
                              icon:Icon(Icons.delete), onPressed: () {
                                arr.removeAt(index);
                                setState(() {
                                  saveListToSharedPreferences();
                                });
                          },),

                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: Card(
                child: TextField(
                  controller: todoText,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 11),
            Container(
              margin: const EdgeInsets.only(left: 280),
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    arr.add(todoText.text.toString());
                    todoText.clear();
                    saveListToSharedPreferences(); // Save the list to shared preferences after adding an item
                  });
                },
                child: const Text('+'),
                backgroundColor: Colors.blue.shade300,
              ),
            )
          ],
        ),
      ),
    );
  }
}
