import 'package:freezed_annotation/freezed_annotation.dart';

part 'status.freezed.dart';

@freezed
class Status<T> with _$Status<T> {
  const factory Status.initial() = Initial<T>;
  const factory Status.loading() = Loading<T>;
  const factory Status.loaded({required T data}) = Loaded<T>;
  const factory Status.error({required String message}) = Error<T>;
}
