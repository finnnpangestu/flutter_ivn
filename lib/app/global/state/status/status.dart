import 'package:freezed_annotation/freezed_annotation.dart';

part 'status.freezed.dart';

@freezed
class Status with _$Status {
  const factory Status.initial() = Initial;
  const factory Status.loading() = Loading;
  const factory Status.success() = Success;
  const factory Status.error({required String message}) = Error;
  const factory Status.empty() = Empty;
}
