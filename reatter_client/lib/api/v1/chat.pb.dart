///
//  Generated code. Do not modify.
//  source: chat.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Message extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Message', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomName', protoName: 'roomName')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'text')
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'size', $pb.PbFieldType.OD)
    ..a<$core.double>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'speed', $pb.PbFieldType.OD)
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'colorR', $pb.PbFieldType.O3, protoName: 'colorR')
    ..a<$core.int>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'colorG', $pb.PbFieldType.O3, protoName: 'colorG')
    ..a<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'colorB', $pb.PbFieldType.O3, protoName: 'colorB')
    ..a<$core.double>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'top', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  Message._() : super();
  factory Message({
    $core.String? roomName,
    $core.String? text,
    $core.double? size,
    $core.double? speed,
    $core.int? colorR,
    $core.int? colorG,
    $core.int? colorB,
    $core.double? top,
  }) {
    final _result = create();
    if (roomName != null) {
      _result.roomName = roomName;
    }
    if (text != null) {
      _result.text = text;
    }
    if (size != null) {
      _result.size = size;
    }
    if (speed != null) {
      _result.speed = speed;
    }
    if (colorR != null) {
      _result.colorR = colorR;
    }
    if (colorG != null) {
      _result.colorG = colorG;
    }
    if (colorB != null) {
      _result.colorB = colorB;
    }
    if (top != null) {
      _result.top = top;
    }
    return _result;
  }
  factory Message.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Message.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Message clone() => Message()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Message copyWith(void Function(Message) updates) => super.copyWith((message) => updates(message as Message)) as Message; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Message create() => Message._();
  Message createEmptyInstance() => create();
  static $pb.PbList<Message> createRepeated() => $pb.PbList<Message>();
  @$core.pragma('dart2js:noInline')
  static Message getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Message>(create);
  static Message? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roomName => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomName() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get text => $_getSZ(1);
  @$pb.TagNumber(2)
  set text($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasText() => $_has(1);
  @$pb.TagNumber(2)
  void clearText() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get size => $_getN(2);
  @$pb.TagNumber(3)
  set size($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSize() => $_has(2);
  @$pb.TagNumber(3)
  void clearSize() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get speed => $_getN(3);
  @$pb.TagNumber(4)
  set speed($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSpeed() => $_has(3);
  @$pb.TagNumber(4)
  void clearSpeed() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get colorR => $_getIZ(4);
  @$pb.TagNumber(5)
  set colorR($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasColorR() => $_has(4);
  @$pb.TagNumber(5)
  void clearColorR() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get colorG => $_getIZ(5);
  @$pb.TagNumber(6)
  set colorG($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasColorG() => $_has(5);
  @$pb.TagNumber(6)
  void clearColorG() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get colorB => $_getIZ(6);
  @$pb.TagNumber(7)
  set colorB($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasColorB() => $_has(6);
  @$pb.TagNumber(7)
  void clearColorB() => clearField(7);

  @$pb.TagNumber(8)
  $core.double get top => $_getN(7);
  @$pb.TagNumber(8)
  set top($core.double v) { $_setDouble(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasTop() => $_has(7);
  @$pb.TagNumber(8)
  void clearTop() => clearField(8);
}

