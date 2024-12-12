import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  String? name;
  String? clas;
  String? addd;
  String? age;

   DetailsPage({super.key,
   required this.name,
   required this.clas,
   required this.age,
   required this.addd,
   
   });

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Text("Student Details",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w600)),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 157, 120, 180),
      ),
      body: Center(
        child: Container(
         height: 400,
            width: 350,
            decoration: BoxDecoration(color: const Color.fromARGB(255, 157, 120, 180),border: Border.all(color: Colors.grey),boxShadow:const [BoxShadow(color: Color.fromARGB(255, 72, 0, 0),blurRadius: 5,)],borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0,top: 40),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 20.0),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage("assets/hd.jpg"), 
                          ),
                        ),
                        SizedBox(width: 330,height: 50,child: Card(child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(widget.name.toString(),style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0),fontSize: 20),),
                        )),),
                        SizedBox(width: 330,height: 50,child: Card(child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(widget.age.toString(),style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0),fontSize: 20),),
                        )),),
                           SizedBox(width: 330,height: 50,child: Card(child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(widget.addd.toString(),style: const TextStyle(color: Color.fromARGB(255, 1, 1, 1),fontSize: 20),),
                        )),),
                           SizedBox(width: 330,height: 50,child: Card(child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(widget.clas.toString(),style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0),fontSize: 20),),
                        )),),
                      ],
                    ),
                  ],
                ),
              ),
            ),
        ),
      ),
    );
  }
}