import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task18_m24/src/presentation/bloc/main_bloc.dart';

import '../widget/product_card.dart';
import 'cart_page.dart';
import 'history/history_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: BlocBuilder<MainBloc, MainState>(
        buildWhen: (prev, cur) => prev.cart.length != cur.cart.length,
        builder: (context, state) {
          if (state.cart.isEmpty) return const SizedBox.shrink();

          return ElevatedButton.icon(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CartPage()),
              );
            },
            icon: Icon(Icons.shopping_cart, size: 32),
            label: Text(
              state.cart.length.toString(),
              style: TextStyle(fontSize: 22, color: Colors.white),
            ),
          );
        },
      ),
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (_)=>HistoryPage()));
        }, icon: Icon(Icons.history) ),
        title: Text("M-Bro POS"),
        actions: [
          BlocBuilder<MainBloc, MainState>(
            buildWhen: (prev, cur) => prev.cart.length != cur.cart.length,
            builder: (context, state) {
              if (state.cart.isEmpty) return const SizedBox.shrink();
              return Stack(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => CartPage()),
                      );
                    },
                    icon: Icon(Icons.shopping_cart),
                  ),
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.red,
                    ),
                    child: Text(
                      state.cart.length.toString(),
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              return ProductCard(product: state.products[index]);
            },
          );
        },
      ),
    );
  }
}
