import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:week_hive/db/functions.dart';
import 'package:week_hive/model/Student.dart';

class add extends StatefulWidget {


   const add({super.key});

  @override
  State<add> createState() => _addState();
}
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController classesController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController idController= TextEditingController();
  File ?  imagesController ;

class _addState extends State<add> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        title: const Text("Add Screen",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w600)),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 157, 120, 180),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Center(
          child: 
           Container(
              height: 550,
              width: 350,
              decoration: BoxDecoration(color: const Color.fromARGB(255, 157, 120, 180),border: Border.all(color: Colors.grey),boxShadow:const [BoxShadow(color: Color.fromARGB(255, 72, 0, 0),blurRadius: 5,)],borderRadius: BorderRadius.circular(5)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: GestureDetector(
                      onTap: (){
                        pickImageGallery();
                      },
                      child: CircleAvatar(
                           radius: 50,
                           backgroundImage: imagesController != null
                                    ? FileImage(imagesController!)
                                    : const AssetImage('assets/hd.jpg') as ImageProvider,
                         ),
                    ),
                  ),
                ElevatedButton(onPressed: (){
                  pickImageGallery();

                }, child: const Text("Gallery")),

                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: SizedBox(
                      width: 290,
                      height: 50,
                      child: TextFormField(
                        controller: nameController,
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
                        controller: ageController,
                        decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),fillColor: Colors.white,filled: true,hintText: "Age:"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: SizedBox(
                      width: 290,
                      height: 50,
                      child: TextFormField(
                        controller: classesController,
                        decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),fillColor: Colors.white,filled: true,hintText: "Class:"),
                      ),
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: SizedBox(
                      width: 290,
                      height: 50,
                      child: TextFormField(
                        controller: addressController,
                        decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),fillColor: Colors.white,filled: true,hintText: "Address:"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: 120,
                      child: FloatingActionButton(onPressed: (){
                        final name = nameController.text;
                        final age= ageController.text;
                        final classes=classesController.text;
                        final address=addressController.text;
                        if(name.isEmpty||age.isEmpty||classes.isEmpty||address.isEmpty){
                          return;
                        }
                        final data = Student(name: name, age: age, classes: classes, address: address);
                        addStToList(data);
                        nameController.clear();
                        ageController.clear();
                        classesController.clear();
                        addressController.clear();

                        Navigator.pop(context);
                      },backgroundColor: Colors.white, child: const Text("Save"),)),
                  )
                ],
              ),
            ),
         )
        ],
      ),
    ); 
  
  }
 Future pickImageGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile == null) {
      return;
    } else {
      setState(() {
        imagesController = File(pickedFile.path);
      });
    }}
}