import 'dart:async';

import 'package:eky_pos/core/components/spaces.dart';
import 'package:eky_pos/core/constants/colors.dart';
import 'package:eky_pos/data/models/responses/transaction_response_model.dart';
import 'package:eky_pos/presentation/home/pages/home_page.dart';
import 'package:eky_pos/presentation/home/pages/invoice_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eky_pos/core/extensions/int_ext.dart';
import 'package:eky_pos/core/extensions/string_ext.dart';
import 'package:eky_pos/presentation/home/bloc/checkout/checkout_bloc.dart';
import 'package:eky_pos/presentation/home/pages/payment_page.dart';
import 'package:qr/qr.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:uuid/uuid.dart';


class QRISPaymentPage extends StatelessWidget {

  const QRISPaymentPage({super.key, required this.totalPrice, required this.transaction});

  final double totalPrice;
  final TransactionModel transaction;

  @override
  Widget build(BuildContext context) {
    
    final totalSecondsNotifier = ValueNotifier(60);
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (totalSecondsNotifier.value > 0) {
        totalSecondsNotifier.value--;
      } else {
        timer.cancel();
        Future.delayed(const Duration(milliseconds: 500), () {
          if (context.mounted) {
            Navigator.pop(context);
          }
        });
      }
    });

    String formatTime(int seconds) {
      int minutes = seconds ~/ 60;
      int remainingSeconds = seconds % 60;
      return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
    }

    final qrData = Uuid().v4()*16;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('QRIS Payment'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.disabled,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 8,
                    children: [
                      Text('Scan this QRIS code to complete your payment before:',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 8,
                        children: [
                          Icon(Icons.timer_outlined, 
                            size: 32,
                            color: AppColors.black
                          ),
                          ValueListenableBuilder(
                            valueListenable: totalSecondsNotifier,
                            builder: (context, totalSeconds, child) {
                              return Text(formatTime(totalSeconds), 
                                style: const TextStyle(
                                  fontSize: 24, 
                                  fontWeight: FontWeight.bold
                                )
                              );
                            }
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SpaceHeight(32),
            Image.asset('assets/icons/qris_logo.png', width: 100),
            AspectRatio(
              aspectRatio: 1,
              child: QrImageView(
                data: qrData,
                version: QrVersions.auto,
                size: 300.0,
              ),
            ),
            Text(Uuid().v4(),
              style: const TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 12,
              ),
            ),
            SpaceHeight(16),
            Text('Total payment:'),
            Text(totalPrice.currencyFormatRp,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SpaceHeight(16),
            Text('Transaction ID:'),
            Text(transaction.orderNumber ?? '-'),
            Spacer(),
            Flexible(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.white,
                  minimumSize: const Size(double.infinity, 56),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InvoicePage(
                        nominal: totalPrice,
                        totalPrice: double.parse(transaction.totalPrice ?? '0'),
                        transaction: transaction,
                      )
                    ),
                    (route) => false,
                  );
                },
                child: const Text('Done'),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}