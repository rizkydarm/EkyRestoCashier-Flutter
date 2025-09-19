import 'package:eky_pos/data/models/responses/transaction_response_model.dart';
import 'package:eky_pos/presentation/home/pages/qris_payment_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eky_pos/core/extensions/int_ext.dart';
import 'package:eky_pos/core/extensions/string_ext.dart';
// import 'package:eky_pos/data/datasources/auth_local_datasource.dart';
import 'package:eky_pos/data/models/requests/order_request_model.dart';
import 'package:eky_pos/presentation/home/bloc/checkout/checkout_bloc.dart';
import 'package:eky_pos/presentation/home/bloc/order/order_bloc.dart';

import 'package:eky_pos/presentation/home/models/product_quantity.dart';
import 'package:eky_pos/presentation/home/pages/invoice_page.dart';
import 'package:eky_pos/presentation/home/pages/invoice_page.dart';
import 'package:go_router/go_router.dart';

import '../../../core/components/spaces.dart';
import '../../../core/constants/colors.dart';
// import '../bloc/online_checker/online_checker_bloc.dart';
import '../bloc/order_offline/order_offline_bloc.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final nominalController = TextEditingController(text: 'Rp 0');
    nominalController.addListener(() {
      final nominal = nominalController.text.replaceAll(RegExp(r'[^0-9]'), '');
      nominalController.value = TextEditingValue(
        text: nominal.currencyFormatRp,
        selection: TextSelection.collapsed(offset: nominal.currencyFormatRp.length),
      );
    });
    bool isCash = true;
    bool exactNominal = false;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: 80,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BlocBuilder<CheckoutBloc, CheckoutState>(
                      buildWhen: (previous, current) => previous != current,
                      builder: (context, state) {
                        print("build CheckoutBloc in PaymentPage.Text");
                        return Text(
                          state.maybeWhen(
                            orElse: () => 0,
                            success: (orders, subtotal, totalPayment, qty) {
                              return totalPayment;
                            },
                          ).toDouble().currencyFormatRp,
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        );
                      }
                    ),
                    const SpaceHeight(8.0),
                    Text(
                      'Total Payment',
                      style: TextStyle(
                        color: AppColors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Text(
                  'Payment Method',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SpaceHeight(16.0),
            StatefulBuilder(
              builder: (context, setState) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Card(
                          color: isCash ? AppColors.primary : AppColors.white,
                          clipBehavior: Clip.antiAlias,
                          child: InkWell(
                          onTap: () => setState(() => isCash = true),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: isCash ? AppColors.white : AppColors.primary,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(Icons.money,
                                        color: isCash ? AppColors.primary : AppColors.white,
                                      ),
                                    ),
                                  ),
                                  const SpaceWidth(16),
                                  Text('Cash',
                                    style: TextStyle(
                                      color: isCash ? AppColors.white : AppColors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    )
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SpaceWidth(16),
                        Card(
                          color: !isCash ? AppColors.primary : AppColors.white,
                          clipBehavior: Clip.antiAlias,
                          child: InkWell(
                          onTap: () {
                            setState(() => isCash = false);
                          },
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: !isCash ? AppColors.white : AppColors.primary,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(Icons.qr_code,
                                        color: !isCash ? AppColors.primary : AppColors.white,
                                      ),
                                    ),
                                  ),
                                  const SpaceWidth(16),
                                  Text('QRIS',
                                    style: TextStyle(
                                      color: !isCash ? AppColors.white : AppColors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    )
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (isCash) Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SpaceHeight(16.0),
                        Text(
                          'Nominal Payment',
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SpaceHeight(16.0),
                        TextField(
                          enabled: isCash ? !exactNominal : false,
                          controller: nominalController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Rp',
                            hintStyle: TextStyle(
                              color: AppColors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: AppColors.grey,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        ),
                        const SpaceHeight(8.0),
                        Row(
                          children: [
                            BlocBuilder<CheckoutBloc, CheckoutState>(
                              buildWhen: (previous, current) => previous != current,
                              builder: (context, state) {
                                print("build CheckoutBloc in PaymentPage.Switch");
                                return Switch(
                                  value: exactNominal,
                                  onChanged: isCash ? (value) => setState(() {
                                    exactNominal = !exactNominal;
                                    if (exactNominal) {
                                      nominalController.text = state.maybeWhen(
                                        orElse: () => '',
                                        success: (orders, subtotal, totalPayment, qty) {
                                          return totalPayment.currencyFormatRp;
                                        },
                                      );
                                    } else {
                                      nominalController.text = '';
                                    }
                                  }) : null,
                                );
                              }
                            ),
                            const SpaceWidth(8.0),
                            const Text('Exact Nominal'),
                          ],
                        ),
                      ],
                    ),
                  ],
                );
              }
            ),
            const SpaceHeight(16),
            ElevatedButton(
              onPressed: () {
                final transaction = TransactionModel();
                if (isCash) {
                  context.go('invoice', extra: InvoiceArgs(
                    nominal: 0,
                    totalPrice: 0,
                    transaction: transaction,
                  ));
                } else {
                  context.go('qris_payment', extra: QRISPaymentPageArgs(
                    totalPrice: 0,
                    transaction: transaction,
                  ));
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.white,
                minimumSize: const Size(double.infinity, 56),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Confirm'),
            ),
            // BlocBuilder<CheckoutBloc, CheckoutState>(
            //   builder: (context, state) {
            //     double subtotal = state.maybeWhen(
            //       orElse: () => 0,
            //       success: (orders, subtotal, totalPayment, qty) {
            //         return subtotal;
            //       },
            //     );
            //     double totalPrice = state.maybeWhen(
            //       orElse: () => 0,
            //       success: (orders, subtotal, totalPayment, qty) {
            //         return totalPayment;
            //       },
            //     );
            //     int totalItems = state.maybeWhen(
            //       orElse: () => 0,
            //       success: (orders, subtotal, totalPayment, qty) {
            //         return qty;
            //       },
            //     );                    
            //     double discount = state.maybeWhen(
            //       orElse: () => 0,
            //       success: (orders, subtotal, totalPayment, qty) {
            //         return 0;
            //       },
            //     );
            //     List<ProductQuantity> items = state.maybeWhen(
            //       orElse: () => [],
            //       success: (orders, subtotal, totalPayment, qty) {
            //         return orders;
            //       },
            //     );
            //     return BlocListener<OrderOfflineBloc, OrderOfflineState>(
            //       listener: (context, state) {
            //         state.maybeWhen(
            //           orElse: () {},
            //           success: (trx) {
            //             if (isCash) {
            //               Navigator.pushAndRemoveUntil(
            //                 context,
            //                 MaterialPageRoute(
            //                   builder: (context) => InvoicePage(
            //                     nominal: totalPaymentNotifier.value,
            //                     totalPrice: double.parse(trx.totalPrice ?? '0'),
            //                     transaction: trx,
            //                   )
            //                 ),
            //                 (route) => false,
            //               );
            //             } else {
            //               Navigator.push(context, 
            //                 MaterialPageRoute(
            //                   builder: (context) => QRISPaymentPage(
            //                     totalPrice: double.parse(trx.totalPrice ?? '0'),
            //                     transaction: trx,
            //                   ),
            //                 ),
            //               );  
            //             }
            //           },
            //           error: (msg) => ScaffoldMessenger.of(context).showSnackBar(
            //             SnackBar(
            //               content: Text(msg),
            //               backgroundColor: AppColors.error,
            //             ),
            //           ),
            //         );
            //       },
            //       child: ElevatedButton(
            //         onPressed: () {
            //           final request = OrderRequestModel(
            //             outletId: 0,
            //             subtotal: subtotal,
            //             totalPrice: totalPrice,
            //             totalItems: totalItems,
            //             discount: discount,
            //             paymentMethod: isCash ? 'Cash' : 'QRIS',
            //             items: items,
            //           );
            //           context.read<OrderOfflineBloc>().add(
            //             OrderOfflineEvent.createOfflineOrder(
            //               orderRequestModel: request,
            //             ),
            //           );
            //         },
            //         style: ElevatedButton.styleFrom(
            //           backgroundColor: AppColors.primary,
            //           foregroundColor: AppColors.white,
            //           minimumSize: const Size(double.infinity, 56),
            //           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            //           padding: const EdgeInsets.symmetric(vertical: 16),
            //         ),
            //         child: const Text('Bayar'),
            //       ),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
