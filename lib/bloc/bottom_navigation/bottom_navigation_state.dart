part of 'bottom_navigation_bloc.dart';

abstract class BottomNavigationState extends Equatable {
  const BottomNavigationState();

  @override
  List<Object> get props => [];
}

class CurrentIndexChanged extends BottomNavigationState {
  final int currentIndex;

  CurrentIndexChanged({required this.currentIndex});

  @override
  String toString() => 'CurrentIndexChanged to $currentIndex';
}

class PageLoading extends BottomNavigationState {
  @override
  String toString() => 'PageLoading';
}

class HomePageLoaded extends BottomNavigationState {
  HomePageLoaded();

  @override
  String toString() => 'HomePageLoaded';
}

class FramePageLoaded extends BottomNavigationState {
  FramePageLoaded();

  @override
  String toString() => 'FramePageLoaded';
}

class TicketPageLoaded extends BottomNavigationState {
  TicketPageLoaded();

  @override
  String toString() => 'TicketPageLoaded';
}
