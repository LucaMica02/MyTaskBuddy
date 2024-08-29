// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic_obj.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TopicAdapter extends TypeAdapter<Topic> {
  @override
  final int typeId = 1;

  @override
  Topic read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Topic(
      fields[0] as String,
    )..todo = (fields[1] as List)
        .map((dynamic e) => (e as List).cast<dynamic>())
        .toList();
  }

  @override
  void write(BinaryWriter writer, Topic obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.topicName)
      ..writeByte(1)
      ..write(obj.todo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TopicAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
