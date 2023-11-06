// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserEntityImplAdapter extends TypeAdapter<_$UserEntityImpl> {
  @override
  final int typeId = 5;

  @override
  _$UserEntityImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$UserEntityImpl(
      id: fields[1] as int,
      name: fields[2] as String,
      avatar: fields[3] as String?,
      email: fields[4] as String,
      phone: fields[5] as String,
      address: (fields[6] as Map).cast<String, dynamic>(),
      company: (fields[7] as Map).cast<String, dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$UserEntityImpl obj) {
    writer
      ..writeByte(7)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.avatar)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(5)
      ..write(obj.phone)
      ..writeByte(6)
      ..write(obj.address)
      ..writeByte(7)
      ..write(obj.company);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserEntityImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserEntityImpl _$$UserEntityImplFromJson(Map<String, dynamic> json) =>
    _$UserEntityImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      avatar: json['avatar'] as String?,
      email: json['email'] as String,
      phone: json['phone'] as String,
      address: json['address'] as Map<String, dynamic>,
      company: json['company'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$UserEntityImplToJson(_$UserEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatar': instance.avatar,
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
      'company': instance.company,
    };
