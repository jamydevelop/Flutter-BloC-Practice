import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_practice_01/data/grocery_data.dart';
import 'package:bloc_practice_01/features/home/models/home_product_data_model.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent); //HomeInitialEvent
    on<HomeProductWishlistButtonClickedEvent>(
        homeProductWishlistButtonClickedEvent); //Product Wishlist
    on<HomeProductCartButtonClickedEvent>(
        homeProductCartButtonClickedEvent); //Product Cart
    on<HomeWishlistButtonNavigationEvent>(
        homeWishlistButtonNavigationEvent); // Wishlist Event Nav
    on<HomeCartButtonNavigationEvent>(
        homeCartButtonNavigationEvent); //Cart Event Nav
  }
  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(HomeLoadedSuccessState(
        products: GroceryData.groceryProducts
            .map((e) => HomeProductDataModel(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                price: e['price'],
                imageUrl: e['imageUrl']))
            .toList()));
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    print('Wishlist Product clicked!');
  } //For wishlist

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print('Cart Product Cliked!');
  } //For Cart

  FutureOr<void> homeWishlistButtonNavigationEvent(
      HomeWishlistButtonNavigationEvent event, Emitter<HomeState> emit) {
    print('Wishlist Navigate clicked!');
    emit(HomeNavigateToWishlistPageActionState());
  } //Wishlist Navigation

  FutureOr<void> homeCartButtonNavigationEvent(
      HomeCartButtonNavigationEvent event, Emitter<HomeState> emit) {
    print('Cart Navigate clicked!');
    emit(HomeNavigateToCartPageActionState());
  } //Cart Navigation
}
