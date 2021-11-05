// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hourly_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HourlyModelAdapter extends TypeAdapter<HourlyModel> {
  @override
  final int typeId = 1;

  @override
  HourlyModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HourlyModel(
      dt: fields[0] as int,
      temp: fields[1] as double,
      feelsLike: fields[2] as double,
      pressure: fields[3] as int,
      humidity: fields[4] as int,
      windSpeed: fields[5] as double,
      main: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HourlyModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.dt)
      ..writeByte(1)
      ..write(obj.temp)
      ..writeByte(2)
      ..write(obj.feelsLike)
      ..writeByte(3)
      ..write(obj.pressure)
      ..writeByte(4)
      ..write(obj.humidity)
      ..writeByte(5)
      ..write(obj.windSpeed)
      ..writeByte(6)
      ..write(obj.main);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HourlyModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
