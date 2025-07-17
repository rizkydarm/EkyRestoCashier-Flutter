import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eky_pos/core/constants/colors.dart';
import 'package:eky_pos/presentation/home/bloc/online_checker/online_checker_bloc.dart';
import 'package:eky_pos/presentation/home/widgets/drawer_widget.dart';
import 'package:eky_pos/presentation/transaction/pages/transaction_offline_page.dart';
import 'package:eky_pos/presentation/transaction/pages/transaction_page.dart';

// import '../blocs/sync_order/sync_order_bloc.dart';

class HistoryTransactionPage extends StatelessWidget {
  const HistoryTransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: scaffoldKey,
        drawer: const DrawerWidget(),
        appBar: AppBar(
          title: const Text('Transaksi',
              style: TextStyle(
                  color: AppColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700)),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.menu, color: AppColors.white),
            onPressed: () => scaffoldKey.currentState?.openDrawer(),
          ),
          bottom: TabBar(
            labelColor: Colors.white,
            indicatorColor: Colors.white,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            tabs: const [
              Tab(text: 'Offline'),
              Tab(text: 'Online'),
            ],
          ),
        ),
        body: TabBarView(
          children: const [
            TransactionOfflinePage(), // is_sync == 0
            TransactionPage(), // transaksi server
          ],
        ),
      
        /* 3. Floating progress saat sinkronisasi                     */
        // floatingActionButton: BlocBuilder<SyncOrderBloc, SyncOrderState>(
        //   buildWhen: (p, c) => c.maybeWhen(
        //     loading: () => true,
        //     progress: (synced, total) => true,
        //     success: () => true,
        //     orElse: () => false,
        //   ),
        //   builder: (context, state) => state.maybeWhen(
        //     loading: () => const _SyncIndicator(text: 'Mempersiapkan…'),
        //     progress: (synced, total) =>
        //         _SyncIndicator(text: 'Sinkron $synced / $total'),
        //     orElse: () => const SizedBox.shrink(),
        //   ),
        // ),
      ),
    );
  }
}

/* Widget indikator proses sinkron */
class _SyncIndicator extends StatelessWidget {
  final String text;
  const _SyncIndicator({required this.text});

  @override
  Widget build(BuildContext context) => FloatingActionButton.extended(
        heroTag: 'syncIndicator',
        onPressed: null,
        backgroundColor: AppColors.primary,
        elevation: 0,
        label: Row(
          children: [
            const SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
            const SizedBox(width: 8),
            Text(text, style: const TextStyle(color: Colors.white)),
          ],
        ),
      );
}
