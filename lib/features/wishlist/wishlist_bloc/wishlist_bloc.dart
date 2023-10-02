import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cart/data/wishlist_items.dart';
import 'package:cart/features/home/models/home_product_data.dart';
import 'package:flutter/material.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<WishlistRemoveFromEvent>(wishlistRemoveFromEvent);
  }

  FutureOr<void> wishlistInitialEvent(
      WishlistInitialEvent event, Emitter<WishlistState> emit) {
    emit(WishlistSuccessState(wishlistItem: wishlistItems));
  }

  FutureOr<void> wishlistRemoveFromEvent(
      WishlistRemoveFromEvent event, Emitter<WishlistState> emit) {
    wishlistItems.remove(event.productDataModel);
    emit(WishlistRemoveActionState(itemName: event.productDataModel.name));
    emit(WishlistSuccessState(wishlistItem: wishlistItems));
  }
}
