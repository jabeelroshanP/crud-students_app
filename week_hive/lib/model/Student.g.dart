// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Student.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudentAdapter extends TypeAdapter<Student> {
  @override
  final int typeId = 0;

  @override
  Student read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Student(
      name: fields[0] as String?,
      age: fields[1] as String?,
      classes: fields[2] as String?,
      address: fields[3] as String?,
    )..images = fields[4] as String?;
  }

  @override
  void write(BinaryWriter writer, Student obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.age)
      ..writeByte(2)
      ..write(obj.classes)
      ..writeByte(3)
      ..write(obj.address)
      ..writeByte(4)
      ..write(obj.images);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
