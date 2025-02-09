// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppDataAdapter extends TypeAdapter<AppData> {
  @override
  final int typeId = 1;

  @override
  AppData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppData(
      totalCount: fields[1] as int?,
      incompleteResults: fields[2] as bool?,
      items: (fields[3] as List?)?.cast<Item>(),
    );
  }

  @override
  void write(BinaryWriter writer, AppData obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.totalCount)
      ..writeByte(2)
      ..write(obj.incompleteResults)
      ..writeByte(3)
      ..write(obj.items);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ItemAdapter extends TypeAdapter<Item> {
  @override
  final int typeId = 2;

  @override
  Item read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Item(
      id: fields[1] as int?,
      nodeId: fields[2] as String?,
      name: fields[3] as String?,
      fullName: fields[4] as String?,
      owner: fields[5] as Owner?,
      description: fields[6] as String?,
      createdAt: fields[7] as String?,
      updatedAt: fields[8] as String?,
      score: fields[9] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, Item obj) {
    writer
      ..writeByte(9)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.nodeId)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.fullName)
      ..writeByte(5)
      ..write(obj.owner)
      ..writeByte(6)
      ..write(obj.description)
      ..writeByte(7)
      ..write(obj.createdAt)
      ..writeByte(8)
      ..write(obj.updatedAt)
      ..writeByte(9)
      ..write(obj.score);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OwnerAdapter extends TypeAdapter<Owner> {
  @override
  final int typeId = 3;

  @override
  Owner read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Owner(
      login: fields[1] as String?,
      id: fields[2] as int?,
      nodeId: fields[3] as String?,
      avatarUrl: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Owner obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.login)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.nodeId)
      ..writeByte(4)
      ..write(obj.avatarUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OwnerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
