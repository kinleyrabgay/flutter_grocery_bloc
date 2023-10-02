part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistState {}

abstract class WishlistActionState extends WishlistState {}

class WishlistInitial extends WishlistState {}

class WishlistSuccessState extends WishlistState {
  final List<ProductDataModel> wishlistItem;

  WishlistSuccessState({required this.wishlistItem});
}

class WishlistRemoveActionState extends WishlistActionState {
  final String itemName;

  WishlistRemoveActionState({required this.itemName});
}
