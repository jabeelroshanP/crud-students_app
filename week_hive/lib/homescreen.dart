import 'package:flutter/material.dart';
import 'package:week_hive/addscreen.dart';
import 'package:week_hive/db/functions.dart';
import 'package:week_hive/details.dart';
import 'package:week_hive/editscreen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    getAllStudent();
    return  Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FloatingActionButton(
          
          onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const add(),));
               },backgroundColor: const Color.fromARGB(255, 157, 120, 180),child: const Icon(Icons.add,color: Colors.white,),),
      ),
      backgroundColor:const Color.fromARGB(255, 251, 251, 251) ,
      appBar: AppBar(
        title: const Text("Home screen",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w600)),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 157, 120, 180),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 40.0),
          child: Container(
            height: 400,
            width: 350,
            decoration: BoxDecoration(color: const Color.fromARGB(255, 157, 120, 180),border: Border.all(color: Colors.grey),boxShadow:const [BoxShadow(color: Color.fromARGB(255, 72, 0, 0),blurRadius: 5,)],borderRadius: BorderRadius.circular(5)),
            child: Expanded(
              child: ValueListenableBuilder(valueListenable: studentListNotifier, builder: (context, value, child) {
                return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                  final data = value[index];
                  return SizedBox(
                    height: 55,
                    child: GestureDetector(
                      onDoubleTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (ctx)=>DetailsPage(name: data.name, clas: data.classes, age: data.age, addd: data.address)));
                      },
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (ctx)=>editScreen(id: index,add: data.address, age: data.age, clas: data.classes, name: data.name)));
                      },
                      child: Card(
                        child: ListTile(
                          
                          
                          trailing: IconButton(onPressed: () {
                            delete(index);
                          },icon: const Icon (Icons.delete_outline,color: Color.fromARGB(255, 0, 0, 0),size: 22,)),
                          title: Text(data.name!,style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0),fontSize: 19,fontWeight: FontWeight.w500),),),
                      ),
                    ),
                  );
                },);
              },),
            ),
          ),
        ),
            
      ),
      
    );
  }
  
}