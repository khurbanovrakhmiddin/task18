import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import '../../data/model/sale_history_model.dart';
import 'package:pdf/widgets.dart' as pw;

class SalePdfSaver {
  static Future<File> savePdf(SaleHistoryEntity sale) async {
    final pdfBytes = await PdfGenerator.generate(sale);

    final directory = await getApplicationDocumentsDirectory();

    final date =
        "${sale.date.year}${sale.date.month}${sale.date.hour}${sale.date.minute}${sale.date.second}";
    final filePath = '${directory.path}/sale_$date.pdf';

    final file = File(filePath);
    await file.writeAsBytes(await pdfBytes as List<int>);

    return file;
  }
}

class PdfGenerator {
  static Future<Future> generate(SaleHistoryEntity sale) async {
    final pdf = pw.Document();

     final fontData = await rootBundle.load("assets/fonts/Roboto-Regular.ttf");
    final ttf = pw.Font.ttf(fontData);

    final boldData = await rootBundle.load("assets/fonts/Roboto-Bold.ttf");
    final boldTtf = pw.Font.ttf(boldData);

    pdf.addPage(
      pw.Page(
        build: (context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              'История продажи №${sale.id}',
              style: pw.TextStyle(font: boldTtf, fontSize: 18),
            ),
            pw.SizedBox(height: 10),
            pw.Text(
              'Дата: ${sale.date.toString()}',
              style: pw.TextStyle(font: ttf),
            ),
            pw.Text(
              'Сумма: ${sale.totalAmount} сум',
              style: pw.TextStyle(font: ttf),
            ),
            pw.SizedBox(height: 20),
            pw.Text('Состав:', style: pw.TextStyle(font: boldTtf)),
            pw.ListView.builder(
              itemCount: sale.items.length,
              itemBuilder: (ctx, i) {
                final item = sale.items[i];
                return pw.Text(
                  '${item.product.name} — ${item.cart.quantity} x ${item.product.amount}',
                  style: pw.TextStyle(font: ttf),
                );
              },
            ),
          ],
        ),
      ),
    );

    return pdf.save();
  }
}
