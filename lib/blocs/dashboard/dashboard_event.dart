abstract class DashboardEvent {}

class ChangePage extends DashboardEvent {
  final int newIndex;

  ChangePage(this.newIndex);
}
