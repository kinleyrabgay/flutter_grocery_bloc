import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cart/data/cart_items.dart';
import 'package:cart/features/home/models/home_product_data.dart';
import 'package:flutter/material.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveFromCartEvent>(cartRemoveFromCartEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems: cartItems));
  }

  FutureOr<void> cartRemoveFromCartEvent(
      CartRemoveFromCartEvent event, Emitter<CartState> emit) {
    // get cartItems
    // check is your product model there in your cartItes
    // run a function to remove that product
    cartItems.remove(event.productDataModel);
    emit(CartRemoveActionState(itemName: event.productDataModel.name));
    emit(CartSuccessState(cartItems: cartItems));

    // emit cartItemRemoveState
  }
}
