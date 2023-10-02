// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cart/features/wishlist/wishlist_bloc/wishlist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:cart/features/home/models/home_product_data.dart';

class WishlistTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final WishlistBloc wishlistBloc;
  const WishlistTileWidget({
    Key? key,
    required this.productDataModel,
    required this.wishlistBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(productDataModel.imageUrl),
            )),
          ),
          const SizedBox(height: 10),
          Text(productDataModel.name),
          const SizedBox(height: 5),
          Text(productDataModel.description),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$. ${productDataModel.price}'),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      wishlistBloc.add(WishlistRemoveFromEvent(
                        productDataModel: productDataModel,
                      ));
                    },
                    icon: const Icon(Icons.favorite),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_bag_outlined),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
