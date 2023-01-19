import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:move_ticketing/pages/home/home_page.dart';

part 'bottom_navigation_event.dart';
part 'bottom_navigation_state.dart';

class BottomNavigationBloc extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  int currentIndex = 0;

  BottomNavigationBloc() : super(PageLoading()) {
    on<BottomNavigationEvent>(_onEvent);
  }

  void _onEvent(BottomNavigationEvent event, Emitter<BottomNavigationState> emit) async {
    if (event is AppStarted) {
      this.add(PageTapped(index: this.currentIndex));
    }
    if (event is PageTapped) {
      this.currentIndex = event.index;
      emit(CurrentIndexChanged(currentIndex: this.currentIndex));
      PageLoading();

      if (this.currentIndex == 0) {
        emit(HomePageLoaded());
      }
      if (this.currentIndex == 1) {
        emit(FramePageLoaded());
      }
      if (this.currentIndex == 2) {
        emit(TicketPageLoaded());
      }
    }
  }
}
