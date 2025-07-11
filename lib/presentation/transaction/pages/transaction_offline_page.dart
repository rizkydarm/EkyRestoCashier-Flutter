import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eky_pos/core/extensions/date_time_ext.dart';

import 'package:eky_pos/presentation/home/models/product_model.dart';

import '../../home/bloc/transaction_offline/transaction_offline_bloc.dart';
import '../widgets/transaction_offline_group_widget.dart';

class TransactionOfflinePage extends StatefulWidget {
  // final List<ProductQtyModel> orders;
  const TransactionOfflinePage({
    super.key,
    // required this.orders,
  });

  @override
  State<TransactionOfflinePage> createState() => _TransactionOfflinePageState();
}

class _TransactionOfflinePageState extends State<TransactionOfflinePage> {
  //global key
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    context
        .read<TransactionOfflineBloc>()
        .add(const TransactionOfflineEvent.fetchTransactionOff());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // drawer: DrawerWidget(),
      // appBar: AppBar(
      //   title: const Text(
      //     'Transaksi',
      //     style: TextStyle(
      //       color: AppColors.white,
      //       fontSize: 18,
      //       fontWeight: FontWeight.w700,
      //     ),
      //   ),
      //   centerTitle: true,
      //   leading: IconButton(
      //       onPressed: () {
      //         _scaffoldKey.currentState?.openDrawer();
      //       },
      //       icon: Icon(Icons.menu, color: AppColors.white)),
      // ),
      body: BlocBuilder<TransactionOfflineBloc, TransactionOfflineState>(
        builder: (context, state) {
          return state.maybeWhen(orElse: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }, loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }, error: (message) {
            return Center(
              child: Text(message),
            );
          }, success: (transactions) {
            if (transactions.isEmpty) {
              return const Center(
                child: Text('Tidak ada transaksi'),
              );
            }
            //transactions.data to list transactionGroup
            List<TransactionOfflineGroup> transactionGroups = [];
            for (var transaction in transactions) {
              //cek apakah transactionGroup sudah ada
              if (transactionGroups
                  .where((element) =>
                      element.date ==
                      transaction.createdAt!.toFormattedDateOnly())
                  .isEmpty) {
                //jika belum ada, maka buat transactionGroup baru
                transactionGroups.add(TransactionOfflineGroup(
                    date: transaction.createdAt!.toFormattedDateOnly(),
                    items: [transaction]));
              } else {
                //jika sudah ada, maka tambahkan transaction ke transactionGroup yang sudah ada
                transactionGroups
                    .where((element) =>
                        element.date ==
                        transaction.createdAt!.toFormattedDateOnly())
                    .first
                    .items
                    .add(transaction);
              }
            }
            return ListView.builder(
              itemCount: transactionGroups.length,
              itemBuilder: (context, index) {
                return TransactionOfflineGroupWidget(transactionGroups[index]);
              },
            );
          });
        },
      ),
    );
  }
}
