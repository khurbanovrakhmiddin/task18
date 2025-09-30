import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task18_m24/src/domain/entity/prodcut_entity.dart';

import '../../utils/parser/amount_parser.dart';
import '../bloc/main_bloc.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(child: ListTile(
      subtitle: Text("${AmountParser.parser(product.amount)} -- ${product.stock}"),
      leading: Image.network(
        width: 50,
        height: 50,
        fit: BoxFit.fill,
        'https://picsum.photos/200/300?random=1',
      ),
      trailing: IconButton(onPressed: ()=>context.read<MainBloc>().add(MainAddCartEvent(product)), icon: Icon(Icons.add)),
      title: Text(product.name),
      contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 4),
    ),);
  }
}
