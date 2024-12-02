import 'package:bumitama_movie/blocs/dashboard/dashboard_event.dart';
import 'package:bumitama_movie/blocs/dashboard/dashboard_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitial()) {
    on<ChangePage>((event, emit) {
      emit(DashboardPageChanged(event.newIndex));
    });
  }
}
