import 'package:flutter/material.dart';
import 'package:eky_pos/core/constants/colors.dart';
import 'package:eky_pos/core/extensions/date_time_ext.dart';
import 'package:eky_pos/core/extensions/string_ext.dart';

import 'package:eky_pos/data/models/responses/transaction_response_model.dart';
import 'package:eky_pos/presentation/home/models/product_quantity.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';

import '../../../data/dataoutputs/cwb_print.dart';

class DetailTransactionPage extends StatefulWidget {
  final TransactionModel transaction;
  const DetailTransactionPage({
    super.key,
    required this.transaction,
  });

  @override
  State<DetailTransactionPage> createState() => _DetailTransactionPageState();
}

class _DetailTransactionPageState extends State<DetailTransactionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Transaksi'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.card,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('ID Transaksi'),
                      Text('${widget.transaction.transactionId}'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Tanggal'),
                        Text(widget.transaction.createdAt!
                            .toLocal()
                            .toFormattedDateTime()),
                      ]),
                  const SizedBox(height: 8),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total'),
                        Text(widget.transaction.totalPrice!.toString()),
                      ]),
                  const SizedBox(height: 8),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Status'),
                        Text(widget.transaction.status!.toUpperCase()),
                      ]),
                  const SizedBox(height: 8),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Metode Pembayaran'),
                        Text(widget.transaction.paymentMethod!),
                      ]),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Detail Pesanan',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
            const SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.transaction.items!.length,
              itemBuilder: (context, index) {
                final item = widget.transaction.items![index];
                return Card(
                  child: ListTile(
                    title: Text(item.product!.name!,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16)),
                    subtitle: Text(
                        '${item.quantity} x ${item.product!.price!.toString()}'),
                    trailing: Text(item.product!.price!.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16)),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      //bottomnavbar untuk menampilkan tombol cetak
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              minimumSize: const Size(double.infinity, 50),
            ),
            onPressed: () async {
              // final printValue = await CwbPrint.instance.printOrderV2(
              //     widget.transaction.items!
              //         .map((e) => ProductQuantity(
              //             product: e.product!, quantity: e.quantity!))
              //         .toList(),
              //     widget.transaction.totalItems!,
              //     widget.transaction.totalPrice!.toDouble.toInt(),
              //     widget.transaction.paymentMethod!,
              //     widget.transaction.totalPrice!.toDouble.toInt(),
              //     'Kasir 1',
              //     'Customer',
              //     widget.transaction.tax!.toDouble,
              //     widget.transaction.subTotal!.toDouble,
              //     widget.transaction.transactionId ?? '',
              //     widget.transaction.discount!.toDouble,
              //     true);
              // await PrintBluetoothThermal.writeBytes(printValue);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.print, color: Colors.white),
                const SizedBox(width: 8),
                const Text('Cetak Ulang',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
