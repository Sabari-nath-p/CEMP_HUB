// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gpmodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class grMessageAdapter extends TypeAdapter<grMessage> {
  @override
  final int typeId = 1;

  @override
  grMessage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return grMessage(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, grMessage obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.content)
      ..writeByte(2)
      ..write(obj.sex)
      ..writeByte(3)
      ..write(obj.uid)
      ..writeByte(4)
      ..write(obj.dt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is grMessageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
