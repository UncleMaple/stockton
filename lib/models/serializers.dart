library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:stockton/models/member.dart';

part 'serializers.g.dart';

/// 添加要序列化的model
@SerializersFor([
  Member,
])

final Serializers serializers = _$serializers;

///// Can add additional plugins that will serialize types like [DateTime]
/////   - It is also possible to write your own Serializer plugins for type that
/////     are not supported by default.
/////   - For Example: https://github.com/google/built_value.dart/issues/543
/////     implements [SerializerPlugin] and writes a serializer for Firebase
/////     Datetime that converts TimeStamp or DateTime to integers.
//final Serializers serializers = (_$serializers.toBuilder()
//  ..addPlugin(StandardJsonPlugin())
//  ..add(Iso8601DateTimeSerializer()))
//    .build();
