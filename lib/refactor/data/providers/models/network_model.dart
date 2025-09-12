import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:squadra_pos/refactor/data/providers/models/network_parameter.dart';

part 'network_model.freezed.dart';

@freezed
class NetworkModel with _$NetworkModel {
  //:: post api call
  const factory NetworkModel.post({
    required NetworkParameter networkParameter
  }) = _NetworkModelPost;

  //:: get api call
  const factory NetworkModel.get({
    required NetworkParameter networkParameter
  }) = _NetworkModelGet;

  // :: put api call
  const factory NetworkModel.put({
    required NetworkParameter networkParameter
  }) = _NetworkModelPut;
}