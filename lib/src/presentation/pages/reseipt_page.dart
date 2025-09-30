import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task18_m24/src/domain/usecase/sale_history_usecase.dart';
import 'package:task18_m24/src/presentation/bloc/main_bloc.dart';

import '../../data/model/cart_item_with_product.dart';
import '../../di.dart';
import '../cubit/sale_cubit.dart';

class CheckoutButton extends StatelessWidget {
  final List<CartItemWithProduct> cartItems;

  const CheckoutButton({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SaleCubit(saleUseCase: sl<SaleUseCase>()),
      child: Builder(
        builder: (context) {
          return BlocConsumer<SaleCubit, SaleState>(
            listener: (context, state) async {
              if (state.errorMsg != null) {
                print(state.errorMsg);
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.errorMsg!)));
              }

              if (state.lastSale != null) {
                final res = await showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text('Чек №${state.lastSale!.id}'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...state.lastSale!.items.map(
                          (e) => Text(
                            '${e.product.name} x ${e.cart.quantity} = ${e.product.amount * e.cart.quantity}',
                          ),
                        ),
                        Divider(),
                        Text('Итого: ${state.lastSale!.totalAmount}'),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Закрыть'),
                      ),
                    ],
                  ),
                );

                if (context.mounted) {
                  context.read<MainBloc>().add(MainCartCleanEvent());
                  Navigator.pop(context);
                }
              }
            },
            builder: (context, state) {
              return ElevatedButton(
                onPressed: state.isLoading
                    ? null
                    : () => context.read<SaleCubit>().checkoutCart(cartItems),
                child: state.isLoading
                    ? const CircularProgressIndicator()
                    : const Text('Оплатить'),
              );
            },
          );
        },
      ),
    );
  }
}
