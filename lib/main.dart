import 'package:eky_pos/presentation/home/pages/home_page.dart';
import 'package:eky_pos/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eky_pos/core/constants/colors.dart';
import 'package:eky_pos/presentation/table_management/bloc/table_manag_bloc.dart';
import 'package:eky_pos/presentation/home/bloc/checkout/checkout_bloc.dart';
import 'package:eky_pos/presentation/home/bloc/order/order_bloc.dart';
import 'package:eky_pos/presentation/home/bloc/transaction/transaction_bloc.dart';
import 'package:eky_pos/presentation/home/bloc/transaction_offline/transaction_offline_bloc.dart';
import 'package:eky_pos/presentation/items/bloc/category/category_bloc.dart';
import 'package:eky_pos/presentation/items/bloc/product/product_bloc.dart';
import 'package:eky_pos/presentation/printer/bloc/printer/printer_bloc.dart';
import 'package:eky_pos/presentation/scanner/blocs/get_qrcode/get_qrcode_bloc.dart';
import 'package:eky_pos/presentation/tax_discount/bloc/business_setting/business_setting_bloc.dart';
import 'package:provider/provider.dart';

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
    // BlocProvider(
    //   create: (context) => AccountBloc(AuthLocalDatasource()),
    // ),
    // BlocProvider(
    //   create: (context) => OutletBloc(OutletRemoteDatasource()),
    // ),
    // BlocProvider(
    //   create: (context) => StaffBloc(StaffRemoteDatasource()),
    // ),
    // BlocProvider(
    //   create: (context) => SalesReportBloc(SalesReportRemoteDatasource()),
    // ),
    BlocProvider(
      create: (context) => CategoryBloc()..add(CategoryEvent.getCategories()),
    ),
    BlocProvider(
      create: (context) => ProductBloc()..add(ProductEvent.getProducts()),
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
    BlocProvider(
      create: (context) => PrinterBloc(),
    ),
    BlocProvider(
      create: (context) => BusinessSettingBloc(),
    ),
    BlocProvider(
      create: (context) => GetQrcodeBloc(),
    ),
    BlocProvider(
      create: (context) => TransactionOfflineBloc(),
    ),
    BlocProvider(
      create: (context) => TableManagementBloc(),
    ),
    ChangeNotifierProvider(
      create: (context) => ToggleDrawerProvider(),
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

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Eky POS',
      routerConfig: router,
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
    );
  }
}

