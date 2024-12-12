import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:week_hive/model/Student.dart';

ValueNotifier<List<Student>> studentListNotifier=ValueNotifier([]);

Future<void>addStToList(Student value)async{
  final St=await Hive.openBox<Student>("my_box");
  St.add(value);
getAllStudent();
}

Future<void>getAllStudent()async{ 
  final St=await Hive.openBox<Student>("my_box");
  studentListNotifier.value.clear();
  studentListNotifier.value.addAll(St.values);
  studentListNotifier.notifyListeners();
} 

Future<void>delete(int index)async{
  final St= await Hive.openBox<Student>("my_box");
  St.deleteAt(index);
  getAllStudent();
}

Future<void>edit(index, Student value) async{
  final St=await Hive.openBox<Student>("my_box");
  St.putAt(index, value);
  getAllStudent();
}