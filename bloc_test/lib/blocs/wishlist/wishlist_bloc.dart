// import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:bloc_test/models/models.dart';
import 'package:equatable/equatable.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading()) {
    on<LoadWishlist>(_onLoadWishlist);
    on<AddProductToWishlist>(_onAddProductToWishist);
    on<RemoveProductFromWishlist>(_onRemoveProductFromWishlist);
  }

  void _onLoadWishlist(event, Emitter<WishlistState> emit) async {
    emit(WishlistLoading());
    try {
      await Future<void>.delayed(Duration(seconds: 1));
      emit(const WishlistLoaded());
    } on Exception {
      emit(WishlistError());
    }
  }

  void _onAddProductToWishist(event, Emitter<WishlistState> emit) {
    final state = this.state;
    if (state is WishlistLoaded) {
      try {
        emit(
          WishlistLoaded(
            wishlist: Wishlist(
              products: List.from(state.wishlist.products)..add(event.product),
            ),
          ),
        );
      } on Exception {
        emit(WishlistError());
      }
    }
  }

  void _onRemoveProductFromWishlist(event, Emitter<WishlistState> emit) {
    final state = this.state;
    if (state is WishlistLoaded) {
      try {
        emit(
          WishlistLoaded(
            wishlist: Wishlist(
              products: List.from(state.wishlist.products)
                ..remove(event.product),
            ),
          ),
        );
      } on Exception {
        emit(WishlistError());
      }
    }
  }
}
