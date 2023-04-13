// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_theme_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppThemeData _$$_AppThemeDataFromJson(Map<String, dynamic> json) =>
    _$_AppThemeData(
      name: json['name'] as String,
      backgroundColors: (json['backgroundColors'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
      primaryColor: json['primaryColor'] as int,
      secondaryColor: json['secondaryColor'] as int,
      cardColor: json['cardColor'] as int,
      statusBarColor: json['statusBarColor'] as int,
      navBarColor: json['navBarColor'] as int,
    );

Map<String, dynamic> _$$_AppThemeDataToJson(_$_AppThemeData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'backgroundColors': instance.backgroundColors,
      'primaryColor': instance.primaryColor,
      'secondaryColor': instance.secondaryColor,
      'cardColor': instance.cardColor,
      'statusBarColor': instance.statusBarColor,
      'navBarColor': instance.navBarColor,
    };
