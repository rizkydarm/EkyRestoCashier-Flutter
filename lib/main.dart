import 'package:eky_pos/core/utils/talker.dart';
import 'package:eky_pos/presentation/home/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eky_pos/core/constants/colors.dart';
import 'package:eky_pos/data/datasources/db_local_datasource.dart';
import 'package:eky_pos/presentation/home/bloc/checkout/checkout_bloc.dart';
import 'package:eky_pos/presentation/home/bloc/online_checker/online_checker_bloc.dart';
import 'package:eky_pos/presentation/home/bloc/order/order_bloc.dart';
import 'package:eky_pos/presentation/home/bloc/order_offline/order_offline_bloc.dart';
import 'package:eky_pos/presentation/home/bloc/transaction/transaction_bloc.dart';
import 'package:eky_pos/presentation/home/bloc/transaction_offline/transaction_offline_bloc.dart';
import 'package:eky_pos/presentation/home/pages/sales_page.dart';
import 'package:eky_pos/presentation/items/bloc/category/category_bloc.dart';
import 'package:eky_pos/presentation/items/bloc/product/product_bloc.dart';
import 'package:eky_pos/presentation/outlet/bloc/outlet/outlet_bloc.dart';
import 'package:eky_pos/presentation/printer/bloc/printer/printer_bloc.dart';
import 'package:eky_pos/presentation/sales_report/bloc/sales_report/sales_report_bloc.dart';
import 'package:eky_pos/presentation/scanner/blocs/get_qrcode/get_qrcode_bloc.dart';
import 'package:eky_pos/presentation/staff/bloc/staff/staff_bloc.dart';
import 'package:eky_pos/presentation/tax_discount/bloc/business_setting/business_setting_bloc.dart';

import 'presentation/auth/bloc/register/register_bloc.dart';

void main() {
  final providers = [
    // BlocProvider(
    //   create: (context) => RegisterBloc(AuthRemoteDataSource()),
    // ),
    // BlocProvider(
    //   create: (context) => LoginBloc(AuthRemoteDataSource()),
    // ),
    // BlocProvider(
    //   create: (context) => LogoutBloc(AuthRemoteDataSource()),
    // ),
    BlocProvider(
      create: (context) => CategoryBloc(),
    ),
    BlocProvider(
      create: (context) => ProductBloc(),
    ),
    BlocProvider(
      create: (context) => CheckoutBloc(),
    ),
    BlocProvider(
      create: (context) => OrderBloc(),
    ),
    BlocProvider(
      create: (context) => TransactionBloc(),
    ),
    // BlocProvider(
    //   create: (context) => AccountBloc(AuthLocalDatasource()),
    // ),
    // BlocProvider(
    //   create: (context) => OutletBloc(OutletRemoteDatasource()),
    // ),
    // BlocProvider(
    //   create: (context) => StaffBloc(StaffRemoteDatasource()),
    // ),
    BlocProvider(
      create: (context) => PrinterBloc(),
    ),
    BlocProvider(
      create: (context) => BusinessSettingBloc(),
    ),
    // BlocProvider(
    //   create: (context) => SalesReportBloc(SalesReportRemoteDatasource()),
    // ),
    BlocProvider(
      create: (context) => GetQrcodeBloc(),
    ),
    BlocProvider(
      create: (context) => OnlineCheckerBloc(),
    ),
    BlocProvider(
      create: (context) => OrderOfflineBloc(),
    ),
    BlocProvider(
      create: (context) => TransactionOfflineBloc(),
    ),
  ];
  runApp(MultiBlocProvider(
    providers: providers,
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Eky POS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          elevation: 0,
          titleTextStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            textStyle: WidgetStatePropertyAll(TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            )),
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}
