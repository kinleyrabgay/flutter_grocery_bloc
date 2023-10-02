part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistEvent {}

class WishlistInitialEvent extends WishlistEvent {}

class WishlistRemoveFromEvent extends WishlistEvent {
  final ProductDataModel productDataModel;

  WishlistRemoveFromEvent({required this.productDataModel});
}
