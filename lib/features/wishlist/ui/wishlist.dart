import 'package:cart/features/wishlist/ui/wishlist_tile_widget.dart';
import 'package:cart/features/wishlist/wishlist_bloc/wishlist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  final WishlistBloc wishlistBloc = WishlistBloc();

  @override
  void initState() {
    wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist Items'),
        backgroundColor: Colors.teal,
      ),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishlistBloc,
        listenWhen: (previous, current) => current is WishlistActionState,
        buildWhen: ((previous, current) => current is! WishlistActionState),
        listener: (context, state) {
          if (state is WishlistRemoveActionState) {
            final itemRemoveName = state.itemName;
            final snackBarContent = 'Items removed: $itemRemoveName';
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(snackBarContent)));
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishlistSuccessState:
              final successState = state as WishlistSuccessState;
              return ListView.builder(
                itemCount: successState.wishlistItem.length,
                itemBuilder: (context, index) {
                  return WishlistTileWidget(
                    productDataModel: successState.wishlistItem[index],
                    wishlistBloc: wishlistBloc,
                  );
                },
              );

            default:
              return Container();
          }
        },
      ),
    );
  }
}
