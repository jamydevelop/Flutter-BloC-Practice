part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();
//HomeState for building the UI (const) - this is for a simple state
  @override
  List<Object> get props => [];
}

abstract class HomeActionState extends HomeState {}
//HomeActionState for (newly added) - this is newly created for "Action State"

final class HomeInitial extends HomeState {} //const

class HomeLoadingState extends HomeState {} // added

class HomeLoadedSuccessState extends HomeState {
  final List<HomeProductDataModel> products;

  const HomeLoadedSuccessState({required this.products});
} //added

class HomeErrorState extends HomeState {} //added

class HomeNavigateToWishlistPageActionState extends HomeActionState {}
//added  Action state

class HomeNavigateToCartPageActionState extends HomeActionState {}
//added Action state
