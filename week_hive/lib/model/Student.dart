import 'package:hive/hive.dart';
    part 'Student.g.dart';
@HiveType(typeId: 0)
class Student {


  @HiveField(0)
  String?name;
  @HiveField(1)
  String?age;
  @HiveField(2)
  String?classes;
  @HiveField(3)
  String?address;
  @HiveField(4)
  String?images;


  Student(
    {required this.name,
    required this.age,
    required this.classes,
    required this.address,
    }
  );
}