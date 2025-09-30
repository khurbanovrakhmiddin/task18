import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task18_m24/src/presentation/pages/history/cubit/history_cubit.dart';

import 'history_card.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HistoryCubit()..init(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(),
            body: BlocBuilder<HistoryCubit, HistoryState>(
              builder: (context, state) {
                if (state.isLoading) return CircularProgressIndicator();
                return ListView.builder(
                  itemCount: state.history.length,
                  itemBuilder: (context, index) {
                    final sale = state.history[index];
                    return SaleHistoryCard(sale: sale,);
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
