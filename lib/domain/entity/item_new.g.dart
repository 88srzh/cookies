// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_new.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemNewAdapter extends TypeAdapter<ItemNew> {
  @override
  final int typeId = 1;

  @override
  ItemNew read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ItemNew(
      titleNew: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ItemNew obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.titleNew);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemNewAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
