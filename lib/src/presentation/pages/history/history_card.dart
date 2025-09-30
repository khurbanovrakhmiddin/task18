import 'package:flutter/material.dart';
import '../../../data/model/sale_history_model.dart';
import '../../../utils/helper/pdf_saver.dart';

class SaleHistoryCard extends StatelessWidget {
  final SaleHistoryEntity sale;

  const SaleHistoryCard({super.key, required this.sale});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 3,
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        title: Text(
          'Чек №${sale.id}',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text(
          'Сумма: ${sale.totalAmount.toStringAsFixed(0)} сум',
          style: const TextStyle(color: Colors.green, fontSize: 14),
        ),
        trailing: Text(
          _formatDate(sale.date),
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
        children: [
          ...sale.items.map(
                (item) => ListTile(
              dense: true,
              leading: const Icon(Icons.shopping_bag, size: 20),
              title: Text(item.product.name),
              subtitle: Text(
                '${item.cart.quantity} x ${item.product.amount.toStringAsFixed(0)} сум',
              ),
              trailing: Text(
                '${(item.cart.quantity * item.product.amount).toStringAsFixed(0)} сум',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          MaterialButton(onPressed: (){ 
             SalePdfSaver.savePdf(sale);
             
          },
          child: Text("Сохранит PDF"),
          )
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}.'
        '${date.month.toString().padLeft(2, '0')}.'
        '${date.year} ${date.hour.toString().padLeft(2, '0')}:'
        '${date.minute.toString().padLeft(2, '0')}';
  }
}
