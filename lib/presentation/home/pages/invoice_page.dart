import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eky_pos/core/extensions/int_ext.dart';
import 'package:eky_pos/core/extensions/string_ext.dart';
import 'package:eky_pos/data/dataoutputs/cwb_print.dart';
import 'package:eky_pos/data/models/responses/transaction_response_model.dart';
import 'package:eky_pos/presentation/home/bloc/checkout/checkout_bloc.dart';

class InvoiceArgs {
  final double nominal;
  final double totalPrice;
  final TransactionModel transaction;

  InvoiceArgs({
    required this.nominal,
    required this.totalPrice,
    required this.transaction,
  });
}

class InvoicePage extends StatelessWidget {
  
  final InvoiceArgs invoice;

  const InvoicePage({
    super.key,
    required this.invoice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nota ${invoice.transaction.transactionId}'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              height: 80,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          invoice.totalPrice.currencyFormatRp,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'Payment Total',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  VerticalDivider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${invoice.nominal - invoice.totalPrice}'
                              .currencyFormatRpV3,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'Change',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(indent: 16, endIndent: 16),
          Expanded(
            child: BlocBuilder<CheckoutBloc, CheckoutState>(
              buildWhen: (previous, current) => previous != current,
              builder: (context, state) {
                return state.maybeWhen(orElse: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }, success: (orders, subtotal, total, qty) {
                  return ListView.builder(
                    itemCount: orders.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          orders[index].product.name ?? '',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        subtitle: Text(
                          '${orders[index].product.price!.currencyFormatRpV3} x ${orders[index].quantity}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        trailing: Text(
                          (orders[index].product.price!.toDouble * orders[index].quantity)
                          .currencyFormatRp,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      );
                    },
                  );
                });
                // return ListView.builder(
                //   // padding: const EdgeInsets.symmetric(horizontal: 16),
                //   itemCount: widget.orders.length,
                //   itemBuilder: (context, index) {
                //     return ListTile(
                //       title: Text(
                //         widget.orders[index].product.name,
                //         style: TextStyle(
                //           color: AppColors.black,
                //           fontSize: 16,
                //           fontWeight: FontWeight.w400,
                //         ),
                //       ),
                //       subtitle: Text(
                //         '${widget.orders[index].product.price} x ${widget.orders[index].qty}',
                //         style: TextStyle(
                //           color: AppColors.black,
                //           fontSize: 16,
                //           fontWeight: FontWeight.w400,
                //         ),
                //       ),
                //       trailing: Text(
                //         (widget.orders[index].product.price *
                //                 widget.orders[index].qty)
                //             .currencyFormatRp,
                //         style: TextStyle(
                //           color: AppColors.black,
                //           fontSize: 16,
                //           fontWeight: FontWeight.w400,
                //         ),
                //       ),
                //     );
                //   },
                // );
              },
            ),
          ),
          const Divider(),
          BlocBuilder<CheckoutBloc, CheckoutState>(
            buildWhen: (previous, current) => previous != current,
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                success: (cart, subtotal, total, totalItems) {
                  return Container(
                    height: 240,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade300,
                            foregroundColor: Colors.black,
                            minimumSize: const Size(double.infinity, 56),
                          ),
                          onPressed: () async {
                            // final printValue = await CwbPrint.instance
                            //   .printOrderV2(
                            //     cart,
                            //     totalItems,
                            //     total.toInt(),
                            //     'Tunai',
                            //     invoice.nominal.toInt(),
                            //     'Mawar',
                            //     'Customer',
                            //     10000, //tax
                            //     invoice.totalPrice,
                            //     'Nota: 101001', // No.nota
                            //     0, // discount
                            //     false
                            //   );
                            // await PrintBluetoothThermal.writeBytes(printValue);
                          },
                          icon: Icon(Icons.print),
                          label: Text('Print Invoice'),
                        ),
                        SizedBox(height: 16),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade300,
                            foregroundColor: Colors.black,
                            minimumSize: const Size(double.infinity, 56),
                          ),
                          onPressed: () {
                            // context.read<CheckoutBloc>().add(const CheckoutEvent.started());
                            // context.read<ProductBloc>().add(const ProductEvent.getProducts());
                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (context) {
                            //   return const HomePage();
                            // }));
                          },
                          icon: Icon(Icons.check_circle),
                          label: Text('Finish'),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
