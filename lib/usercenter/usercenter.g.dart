// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usercenter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserCenter _$UserCenterFromJson(Map<String, dynamic> json) => UserCenter(
      LoginUser.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserCenterToJson(UserCenter instance) =>
    <String, dynamic>{
      'user': instance.user,
    };

LoginUser _$LoginUserFromJson(Map<String, dynamic> json) => LoginUser(
      json['userId'] as String,
      json['name'] as String,
      json['mobile'] as String,
      json['idNumber'] as String,
      portrait: json['portrait'] as String?,
    )..position = $enumDecode(_$UserPositionEnumMap, json['position']);

Map<String, dynamic> _$LoginUserToJson(LoginUser instance) => <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'mobile': instance.mobile,
      'idNumber': instance.idNumber,
      'portrait': instance.portrait,
      'position': _$UserPositionEnumMap[instance.position]!,
    };

const _$UserPositionEnumMap = {
  UserPosition.noknown: 'noknown',
  UserPosition.headTeacher: 'headTeacher',
  UserPosition.teacher: 'teacher',
  UserPosition.parent: 'parent',
};
