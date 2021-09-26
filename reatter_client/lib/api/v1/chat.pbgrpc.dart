///
//  Generated code. Do not modify.
//  source: chat.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'chat.pb.dart' as $0;
import 'google/protobuf/empty.pb.dart' as $1;
import 'google/protobuf/wrappers.pb.dart' as $2;
export 'chat.pb.dart';

class ChatServiceClient extends $grpc.Client {
  static final _$send = $grpc.ClientMethod<$0.Message, $1.Empty>(
      '/v1.ChatService/Send',
      ($0.Message value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$subscribe = $grpc.ClientMethod<$2.StringValue, $0.Message>(
      '/v1.ChatService/Subscribe',
      ($2.StringValue value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Message.fromBuffer(value));

  ChatServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.Empty> send($0.Message request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$send, request, options: options);
  }

  $grpc.ResponseStream<$0.Message> subscribe($2.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$subscribe, $async.Stream.fromIterable([request]),
        options: options);
  }
}

abstract class ChatServiceBase extends $grpc.Service {
  $core.String get $name => 'v1.ChatService';

  ChatServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Message, $1.Empty>(
        'Send',
        send_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Message.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.StringValue, $0.Message>(
        'Subscribe',
        subscribe_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $2.StringValue.fromBuffer(value),
        ($0.Message value) => value.writeToBuffer()));
  }

  $async.Future<$1.Empty> send_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Message> request) async {
    return send(call, await request);
  }

  $async.Stream<$0.Message> subscribe_Pre(
      $grpc.ServiceCall call, $async.Future<$2.StringValue> request) async* {
    yield* subscribe(call, await request);
  }

  $async.Future<$1.Empty> send($grpc.ServiceCall call, $0.Message request);
  $async.Stream<$0.Message> subscribe(
      $grpc.ServiceCall call, $2.StringValue request);
}
