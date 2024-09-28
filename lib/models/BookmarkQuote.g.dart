// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BookmarkQuote.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookmarkquoteAdapter extends TypeAdapter<Bookmarkquote> {
  @override
  final int typeId = 0;

  @override
  Bookmarkquote read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Bookmarkquote(
      quote: fields[0] as String,
      author: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Bookmarkquote obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.quote)
      ..writeByte(1)
      ..write(obj.author);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookmarkquoteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
