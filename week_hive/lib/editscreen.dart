import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:week_hive/db/functions.dart';
import 'package:week_hive/model/Student.dart';

class editScreen extends StatefulWidget {
  String? name;
  String? age;
  String? clas;
  String? add;
  int id;
   editScreen({super.key,
   required this.add,
   required this.id,
   required this.age,
   required this.clas,
   required this.name
   
   });

  @override
  State<editScreen> createState() => _editScreenState();
}

class _editScreenState extends State<editScreen> {
  TextEditingController name=TextEditingController();
  TextEditingController clas=TextEditingController();
  TextEditingController addre=TextEditingController();
  TextEditingController age=TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name=TextEditingController(text: widget.name);
    clas=TextEditingController(text: widget.clas);
    age=TextEditingController(text: widget.age);
    addre=TextEditingController(text: widget.add);


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar( 
        title: const Text("Edit Screen",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w600)),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 157, 120, 180),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Center(
          child: 
           Container(
              height: 450,
              width: 350,
              decoration: BoxDecoration(color: const Color.fromARGB(255, 157, 120, 180),border: Border.all(color: Colors.grey),boxShadow:const [BoxShadow(color: Color.fromARGB(255, 72, 0, 0),blurRadius: 5,)],borderRadius: BorderRadius.circular(5)),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: CircleAvatar(
                         radius: 50,
                         backgroundImage: AssetImage("assets/hd.jpg"),
                       ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: SizedBox(
                      width: 290,
                      height: 50,
                      child: TextFormField(
                      controller: name,
                        decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),fillColor: Colors.white,filled: true,hintText: "Name:",),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: SizedBox(
                      width: 290,
                      height: 50,
                      child: TextFormField(
                        controller: age,
                        decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),fillColor: Colors.white,filled: true,hintText: "Age:"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: SizedBox(
                      width: 290,
                      height: 50,
                      child: TextFormField(controller: clas,
                        decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),fillColor: Colors.white,filled: true,hintText: "Class:"),
                      ),
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: SizedBox(
                      width: 290,
                      height: 50,
                      child: TextFormField(controller: addre,
                        decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),fillColor: Colors.white,filled: true,hintText: "Address:"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: 120,
                      child: FloatingActionButton(onPressed: (){

                 final save=      Student(name: name.text, age: age.text, classes: clas.text, address: addre.text);


                        edit(widget.id,save );
                        Navigator.pop(context);
                      },backgroundColor: Colors.white, child: const Text("Edited"),)),
                  )
                ],
              ),
            ),
         )
        ],
      ),
    ); 
  }
}
