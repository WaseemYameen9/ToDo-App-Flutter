import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var todoText = TextEditingController();
  var arr = [];


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(

          title: Center(child: Text("TODO",style: TextStyle(color: Colors.white)),),
        ),
        body: Column(
          children: [

            Container(
              height: 50,
              color: Colors.purple,
              child: Row(
                children: [
                  Container(
                    width: 250,
                    child: Text("What are you doing Today?",style: TextStyle(fontSize: 20,color: Colors.white)),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 70),
                    child: CircleAvatar(
                      backgroundImage: ExactAssetImage('assets/was.jpg'),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Center(child: Text('TODO List',style: TextStyle(fontSize: 20,color: Colors.white),)),
              height: 50,
              width: 130,
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.blue,
              ),

            ),

            Container(
              margin: EdgeInsets.only(top: 20),
              child: Card(
                child: ListTile(
                  leading: CircleAvatar(

                  ),
                  title: Text("Hardwork Pays off"),

                ),
              ),
            ),

            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 20),
                child: Card(
                  child: ListView.builder(
                    itemCount: arr.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(),
                        title: Text(arr[index]),
                      );
                    },
                  ),
                ),
              ),
            ),



            Container(
              margin: EdgeInsets.only(top: 30),
              child: Card(
                child: TextField(
                  controller: todoText,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Colors.blue,
                          )
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Colors.black,
                          )
                      )


                  ),
                ),
              ),
            ),
            Container(
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25)
              ),
              margin: EdgeInsets.only(left: 300),
              child: ElevatedButton(
                child: Text("+"),
                onPressed: (){
                  arr.add(todoText.text.toString());
                  todoText.clear();
                  setState(() {

                  });
                },
              ),

            )
          ],
        )
    );
  }
}