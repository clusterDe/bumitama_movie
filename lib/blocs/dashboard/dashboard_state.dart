abstract class DashboardState {
  final int selectedIndex;

  const DashboardState(this.selectedIndex);
}

class DashboardInitial extends DashboardState {
  DashboardInitial() : super(0);
}

class DashboardPageChanged extends DashboardState {
  const DashboardPageChanged(super.selectedIndex);
}
