// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class UpcomingEvent {}

class FetchUpcoming extends UpcomingEvent {
  int? page;

  FetchUpcoming({this.page});
}
