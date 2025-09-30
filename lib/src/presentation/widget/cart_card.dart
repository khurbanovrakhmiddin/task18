import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task18_m24/src/data/model/cart_item_with_product.dart';
import 'package:task18_m24/src/domain/entity/cart_entity.dart';
import 'package:task18_m24/src/domain/entity/prodcut_entity.dart';

import '../../utils/parser/amount_parser.dart';
import '../bloc/main_bloc.dart';

class CartCard extends StatelessWidget {
  final CartItemWithProduct cart;

  const CartCard({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    final product = cart.product;
    final tl = cart.cart;
    return Card(
      child: ListTile(
        subtitle: Text(AmountParser.parser(product.amount)),

        leading: IconButton(       onPressed: () =>
            context.read<MainBloc>().add(MainDeleteCartEvent(product)), icon: Icon(Icons.delete)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              color: Colors.red,

              onPressed: () =>
                  context.read<MainBloc>().add(MainRemoveCartEvent(product)),
              icon: Icon(Icons.exposure_minus_1),
            ),
            Text(
              tl.quantity.toString(),
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),

            IconButton(
              color: Colors.green,
              onPressed: () =>
                  context.read<MainBloc>().add(MainAddCartEvent(product)),
              icon: Icon(Icons.exposure_plus_1),
            ),
          ],
        ),
        title: Text(product.name),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      ),
    );
  }
}
