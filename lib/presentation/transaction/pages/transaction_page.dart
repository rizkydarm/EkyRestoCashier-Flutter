import 'package:eky_pos/core/extensions/date_time_ext.dart';
import 'package:eky_pos/core/extensions/string_ext.dart';
import 'package:eky_pos/presentation/home/pages/home_page.dart';
import 'package:eky_pos/presentation/home/widgets/main_drawer.dart';
import 'package:eky_pos/presentation/transaction/pages/detail_transaction_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eky_pos/presentation/home/bloc/transaction/transaction_bloc.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

class TransactionPage extends StatelessWidget {
  final ValueNotifier<bool>? toggleSideMenuNotifier;
  
  const TransactionPage({
    super.key,
    this.toggleSideMenuNotifier,
  });

  @override
  Widget build(BuildContext context) {
    
    context.read<TransactionBloc>().add(const TransactionEvent.getAllOrder());
    
    final scaffoldKey = GlobalKey<ScaffoldState>();
    final isLargeScreen = MediaQuery.of(context).size.width > 840;

    print("build transaction page");
    
    return Scaffold(
      key: scaffoldKey,
      drawer: isLargeScreen ? null : MainDrawer(),
      appBar: AppBar(
        title: const Text('Transactions'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(isLargeScreen ? Icons.menu_open : Icons.menu),
          onPressed: () {
            if (isLargeScreen) {
              Provider.of<ToggleDrawerProvider>(context, listen: false).toggle();
            } else {
              scaffoldKey.currentState?.openDrawer();
            }
          }
        ),
      ),
      body: BlocBuilder<TransactionBloc, TransactionState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const Center(child: Text('No Transactions')),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (message) => Center(child: Text(message)),
            success: (transactions, items, transaction) {
            if (transactions?.isEmpty ?? true) {
              return const Center(
                child: Text('No Transactions'),
              );
            }
            
            return ListView.builder(
              itemCount: transactions?.length ?? 0,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap:  () {
                    if ((transactions[index].items?.length ?? -1) > 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailTransactionPage(
                            transaction: transactions[index],
                          ),
                        ),
                      );
                    }
                  },
                  leading: Text((transactions![index].items?.length ?? -1).toString()),
                  title: Text(transactions[index].totalPrice!.toString(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(transactions[index].createdAt!.toLocal().toFormattedDateOnly()),
                  trailing: Text(transactions[index].transactionId!,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                );
              },
            );
          });
        },
      ),
    );
  }
}
