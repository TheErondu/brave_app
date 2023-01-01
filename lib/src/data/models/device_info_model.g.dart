// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_info_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DeviceInfoDataAdapter extends TypeAdapter<DeviceInfoData> {
  @override
  final int typeId = 1;

  @override
  DeviceInfoData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DeviceInfoData(
      deviceName: fields[0] as String,
      deviceModel: fields[1] as String,
      os: fields[2] as String,
      manufacturer: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DeviceInfoData obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.deviceName)
      ..writeByte(1)
      ..write(obj.deviceModel)
      ..writeByte(2)
      ..write(obj.os)
      ..writeByte(3)
      ..write(obj.manufacturer);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeviceInfoDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
