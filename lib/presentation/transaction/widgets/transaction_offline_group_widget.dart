import 'package:flutter/material.dart';
import 'package:eky_pos/core/extensions/date_time_ext.dart';
import 'package:eky_pos/core/extensions/string_ext.dart';
import 'package:eky_pos/data/models/responses/transaction_response_model.dart';
import 'package:eky_pos/presentation/home/models/product_model.dart';

import '../../../core/constants/colors.dart';
import '../pages/detail_transaction_offline_page.dart';

class TransactionOfflineGroupWidget extends StatelessWidget {
  final TransactionOfflineGroup group;

  const TransactionOfflineGroupWidget(this.group, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Text(
            group.date,
            style: TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        ...group.items
            .map((transaction) => TransactionItemOfflineWidget(transaction)),
        Divider(),
      ],
    );
  }
}

class TransactionItemOfflineWidget extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionItemOfflineWidget(this.transaction, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                DetailTransactionOfflinePage(transaction: transaction),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
                transaction.paymentMethod! == 'Tunai'
                    ? Icons.money
                    : Icons.credit_card,
                color: Colors.grey),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transaction.totalPrice!.currencyFormatRpV3,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  Text(
                    transaction.createdAt!.toLocal().toFormattedTimeOnly(),
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
            Text(
              transaction.orderNumber!,
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
