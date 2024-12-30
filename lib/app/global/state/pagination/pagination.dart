import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination.freezed.dart';
part 'pagination.g.dart';

@freezed
class Pagination with _$Pagination {
  const factory Pagination({
    @Default(10) int limit,
    @Default(1) int currentPage,
  }) = _Pagination;

  factory Pagination.fromJson(Map<String, dynamic> json) => _$PaginationFromJson(json);

  const Pagination._();

  Pagination reset() => copyWith(currentPage: 1);

  Pagination init(int limit, int currentPage) => Pagination(
        limit: limit,
        currentPage: currentPage,
      );

  Pagination nextPage() => copyWith(currentPage: currentPage + 1);
}
