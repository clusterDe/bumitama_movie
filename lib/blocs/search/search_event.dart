// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class SearchEvent {}

class SearchQuery extends SearchEvent {
  String? query;
  int? page;

  SearchQuery(
    this.query,
    this.page,
  );
}
