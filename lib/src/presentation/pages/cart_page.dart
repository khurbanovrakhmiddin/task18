import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task18_m24/src/presentation/pages/reseipt_page.dart';
import 'package:task18_m24/src/utils/parser/amount_parser.dart';

import '../bloc/main_bloc.dart';
import '../widget/cart_card.dart';
import '../widget/product_card.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          return CheckoutButton(
            cartItems: context.read<MainBloc>().cartItemsWithProduct,
          );
        },
      ),
      appBar: AppBar(title: Text("Cart Page")),
      body: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          final cartItems = context.read<MainBloc>().cartItemsWithProduct;

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    return CartCard(cart: cartItems[index]);
                  },
                ),
              ),

              Container(
                padding: const EdgeInsets.all(16),
                color: Colors.grey[200],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Общая сумма:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${AmountParser.total(cartItems)} сум',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 100),
            ],
          );
        },
      ),
    );
  }
}
