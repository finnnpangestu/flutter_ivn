import 'package:freezed_annotation/freezed_annotation.dart';

part 'status.freezed.dart';

@freezed
class Status with _$Status {
  const factory Status.initial() = Initial;
  const factory Status.loading({String? message, Exception? exception}) = Loading;
  const factory Status.loadingMore({String? message, Exception? exception}) = LoadingMore;
  const factory Status.success({String? message, Exception? exception}) = Success;
  const factory Status.error({required String message, required Exception exception}) = Error;
  const factory Status.empty({String? message, Exception? exception}) = Empty;
}
