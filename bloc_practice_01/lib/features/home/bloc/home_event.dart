part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeInitialEvent extends HomeEvent {} // newly added

class HomeProductWishlistButtonClickedEvent extends HomeEvent {}
//1st event added

class HomeProductCartButtonClickedEvent extends HomeEvent {} //2nd event added

class HomeWishlistButtonNavigationEvent extends HomeEvent {} //3rd event added

class HomeCartButtonNavigationEvent extends HomeEvent {} //4th event added
