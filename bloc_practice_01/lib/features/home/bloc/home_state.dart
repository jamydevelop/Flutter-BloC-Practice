part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();
//HomeState for building the UI (const) - this is for a simple state
  @override
  List<Object> get props => [];
}

abstract class HomeActionState extends HomeState {}
//HomeActionState for (newly added) - this is newly created for "Action State"

final class HomeInitial extends HomeState {} // (***const***)

class HomeLoadingState extends HomeState {}
//for loading state (Circular Bar - to load data)

class HomeLoadedSuccessState extends HomeState {
  //1st simple state added - this is for the fetched data to show on screen
  final List<HomeProductDataModel> products;

  const HomeLoadedSuccessState({required this.products});
}

class HomeErrorState extends HomeState {}
// Error state should be simple state since it's for building the UI only
// or showing  a message on the screen

class HomeNavigateToWishlistPageActionState extends HomeActionState {}
//HomeNavigateToWishlistPageActionState should extends HomeActionState.
//Since it will be "routed" to other screen/page

class HomeNavigateToCartPageActionState extends HomeActionState {}
//HomeNavigateToCartPageActionState should extends HomeActionState.
//Since it will be "routed" to other screen/page
