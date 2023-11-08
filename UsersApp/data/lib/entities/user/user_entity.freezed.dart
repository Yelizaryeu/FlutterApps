// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) {
  return _UserEntity.fromJson(json);
}

/// @nodoc
mixin _$UserEntity {
  @HiveField(1)
  int get id => throw _privateConstructorUsedError;
  @HiveField(2)
  String get name => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get avatar => throw _privateConstructorUsedError;
  @HiveField(4)
  String get email => throw _privateConstructorUsedError;
  @HiveField(5)
  String get phone => throw _privateConstructorUsedError;
  @HiveField(6)
  Map<String, dynamic> get address => throw _privateConstructorUsedError;
  @HiveField(7)
  Map<String, dynamic> get company => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserEntityCopyWith<UserEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEntityCopyWith<$Res> {
  factory $UserEntityCopyWith(
          UserEntity value, $Res Function(UserEntity) then) =
      _$UserEntityCopyWithImpl<$Res, UserEntity>;
  @useResult
  $Res call(
      {@HiveField(1) int id,
      @HiveField(2) String name,
      @HiveField(3) String? avatar,
      @HiveField(4) String email,
      @HiveField(5) String phone,
      @HiveField(6) Map<String, dynamic> address,
      @HiveField(7) Map<String, dynamic> company});
}

/// @nodoc
class _$UserEntityCopyWithImpl<$Res, $Val extends UserEntity>
    implements $UserEntityCopyWith<$Res> {
  _$UserEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? avatar = freezed,
    Object? email = null,
    Object? phone = null,
    Object? address = null,
    Object? company = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserEntityImplCopyWith<$Res>
    implements $UserEntityCopyWith<$Res> {
  factory _$$UserEntityImplCopyWith(
          _$UserEntityImpl value, $Res Function(_$UserEntityImpl) then) =
      __$$UserEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(1) int id,
      @HiveField(2) String name,
      @HiveField(3) String? avatar,
      @HiveField(4) String email,
      @HiveField(5) String phone,
      @HiveField(6) Map<String, dynamic> address,
      @HiveField(7) Map<String, dynamic> company});
}

/// @nodoc
class __$$UserEntityImplCopyWithImpl<$Res>
    extends _$UserEntityCopyWithImpl<$Res, _$UserEntityImpl>
    implements _$$UserEntityImplCopyWith<$Res> {
  __$$UserEntityImplCopyWithImpl(
      _$UserEntityImpl _value, $Res Function(_$UserEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? avatar = freezed,
    Object? email = null,
    Object? phone = null,
    Object? address = null,
    Object? company = null,
  }) {
    return _then(_$UserEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value._address
          : address // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      company: null == company
          ? _value._company
          : company // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 5)
class _$UserEntityImpl extends _UserEntity {
  _$UserEntityImpl(
      {@HiveField(1) this.id = -1,
      @HiveField(2) this.name = '',
      @HiveField(3) this.avatar = '',
      @HiveField(4) this.email = '',
      @HiveField(5) this.phone = '',
      @HiveField(6) final Map<String, dynamic> address = const {},
      @HiveField(7) final Map<String, dynamic> company = const {}})
      : _address = address,
        _company = company,
        super._();

  factory _$UserEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserEntityImplFromJson(json);

  @override
  @JsonKey()
  @HiveField(1)
  final int id;
  @override
  @JsonKey()
  @HiveField(2)
  final String name;
  @override
  @JsonKey()
  @HiveField(3)
  final String? avatar;
  @override
  @JsonKey()
  @HiveField(4)
  final String email;
  @override
  @JsonKey()
  @HiveField(5)
  final String phone;
  final Map<String, dynamic> _address;
  @override
  @JsonKey()
  @HiveField(6)
  Map<String, dynamic> get address {
    if (_address is EqualUnmodifiableMapView) return _address;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_address);
  }

  final Map<String, dynamic> _company;
  @override
  @JsonKey()
  @HiveField(7)
  Map<String, dynamic> get company {
    if (_company is EqualUnmodifiableMapView) return _company;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_company);
  }

  @override
  String toString() {
    return 'UserEntity(id: $id, name: $name, avatar: $avatar, email: $email, phone: $phone, address: $address, company: $company)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            const DeepCollectionEquality().equals(other._address, _address) &&
            const DeepCollectionEquality().equals(other._company, _company));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      avatar,
      email,
      phone,
      const DeepCollectionEquality().hash(_address),
      const DeepCollectionEquality().hash(_company));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserEntityImplCopyWith<_$UserEntityImpl> get copyWith =>
      __$$UserEntityImplCopyWithImpl<_$UserEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserEntityImplToJson(
      this,
    );
  }
}

abstract class _UserEntity extends UserEntity {
  factory _UserEntity(
      {@HiveField(1) final int id,
      @HiveField(2) final String name,
      @HiveField(3) final String? avatar,
      @HiveField(4) final String email,
      @HiveField(5) final String phone,
      @HiveField(6) final Map<String, dynamic> address,
      @HiveField(7) final Map<String, dynamic> company}) = _$UserEntityImpl;
  _UserEntity._() : super._();

  factory _UserEntity.fromJson(Map<String, dynamic> json) =
      _$UserEntityImpl.fromJson;

  @override
  @HiveField(1)
  int get id;
  @override
  @HiveField(2)
  String get name;
  @override
  @HiveField(3)
  String? get avatar;
  @override
  @HiveField(4)
  String get email;
  @override
  @HiveField(5)
  String get phone;
  @override
  @HiveField(6)
  Map<String, dynamic> get address;
  @override
  @HiveField(7)
  Map<String, dynamic> get company;
  @override
  @JsonKey(ignore: true)
  _$$UserEntityImplCopyWith<_$UserEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
