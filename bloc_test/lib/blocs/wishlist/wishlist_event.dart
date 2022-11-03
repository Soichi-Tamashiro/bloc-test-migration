part of 'wishlist_bloc.dart';

abstract class WishlistEvent extends Equatable {
  const WishlistEvent();

  @override
  List<Object> get props => [];
}

class LoadWishlist extends WishlistEvent {}

class AddProductToWishlist extends WishlistEvent {
  final Product product;

  const AddProductToWishlist(this.product);

  @override
  List<Object> get props => [product];
}

class RemoveProductFromWishlist extends WishlistEvent {
  final Product product;

  const RemoveProductFromWishlist(this.product);

  @override
  List<Object> get props => [product];
}

// class StartWishlist extends WishlistEvent {}

// class AddWishlistProduct extends WishlistEvent {
//   final Product product;

//   const AddWishlistProduct(this.product);

//   @override
//   List<Object> get props => [product];
// }

// class RemoveWishlistProduct extends WishlistEvent {
//   final Product product;

//   const RemoveWishlistProduct(this.product);

//   @override
//   List<Object> get props => [product];
// }
