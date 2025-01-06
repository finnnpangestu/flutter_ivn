class Pagination {
  final int currentPage;
  final int limit;

  Pagination({this.currentPage = 0, this.limit = 10});

  Pagination copyWith({int? currentPage, int? limit}) {
    return Pagination(
      currentPage: currentPage ?? this.currentPage,
      limit: limit ?? this.limit,
    );
  }

  Pagination nextPage() {
    return copyWith(currentPage: currentPage + limit);
  }

  Pagination reset() {
    return copyWith(currentPage: 0);
  }

  Pagination previousPage() {
    return copyWith(currentPage: (currentPage - limit).clamp(0, currentPage));
  }
}
