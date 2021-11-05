// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DailyModelAdapter extends TypeAdapter<DailyModel> {
  @override
  final int typeId = 2;

  @override
  DailyModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DailyModel(
      dt: fields[0] as int,
      sunrise: fields[1] as double,
      sunset: fields[2] as double,
      moonrise: fields[3] as double,
      moonset: fields[4] as double,
      moonPhase: fields[5] as double,
      temp: fields[6] as Temp,
      feelsLike: fields[7] as FeelsLike,
      pressure: fields[8] as double,
      humidity: fields[9] as double,
      windSpeed: fields[10] as double,
      main: fields[11] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DailyModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.dt)
      ..writeByte(1)
      ..write(obj.sunrise)
      ..writeByte(2)
      ..write(obj.sunset)
      ..writeByte(3)
      ..write(obj.moonrise)
      ..writeByte(4)
      ..write(obj.moonset)
      ..writeByte(5)
      ..write(obj.moonPhase)
      ..writeByte(6)
      ..write(obj.temp)
      ..writeByte(7)
      ..write(obj.feelsLike)
      ..writeByte(8)
      ..write(obj.pressure)
      ..writeByte(9)
      ..write(obj.humidity)
      ..writeByte(10)
      ..write(obj.windSpeed)
      ..writeByte(11)
      ..write(obj.main);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DailyModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TempAdapter extends TypeAdapter<Temp> {
  @override
  final int typeId = 3;

  @override
  Temp read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Temp(
      day: fields[1] as double,
      min: fields[2] as double,
      max: fields[3] as double,
      night: fields[4] as double,
      eve: fields[5] as double,
      morn: fields[6] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Temp obj) {
    writer
      ..writeByte(6)
      ..writeByte(1)
      ..write(obj.day)
      ..writeByte(2)
      ..write(obj.min)
      ..writeByte(3)
      ..write(obj.max)
      ..writeByte(4)
      ..write(obj.night)
      ..writeByte(5)
      ..write(obj.eve)
      ..writeByte(6)
      ..write(obj.morn);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TempAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FeelsLikeAdapter extends TypeAdapter<FeelsLike> {
  @override
  final int typeId = 4;

  @override
  FeelsLike read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FeelsLike(
      day: fields[0] as double,
      night: fields[1] as double,
      eve: fields[2] as double,
      morn: fields[3] as double,
    );
  }

  @override
  void write(BinaryWriter writer, FeelsLike obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.day)
      ..writeByte(1)
      ..write(obj.night)
      ..writeByte(2)
      ..write(obj.eve)
      ..writeByte(3)
      ..write(obj.morn);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FeelsLikeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
