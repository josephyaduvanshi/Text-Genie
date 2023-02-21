// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_to_user_history_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EmailToUserHistoryModelAdapter
    extends TypeAdapter<EmailToUserHistoryModel> {
  @override
  final int typeId = 0;

  @override
  EmailToUserHistoryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EmailToUserHistoryModel(
      type: fields[0] as String,
      fileName: fields[1] as String,
      fileSize: fields[2] as String,
      numberOfLines: fields[3] as String,
      date: fields[4] as DateTime,
      fileContent: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, EmailToUserHistoryModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.fileName)
      ..writeByte(2)
      ..write(obj.fileSize)
      ..writeByte(3)
      ..write(obj.numberOfLines)
      ..writeByte(4)
      ..write(obj.date)
      ..writeByte(5)
      ..write(obj.fileContent);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmailToUserHistoryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
