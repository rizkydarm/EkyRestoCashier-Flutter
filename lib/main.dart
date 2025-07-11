import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eky_pos/core/constants/colors.dart';
import 'package:eky_pos/data/datasources/auth_local_datasource.dart';
import 'package:eky_pos/data/datasources/auth_remote_datasource.dart';
import 'package:eky_pos/data/datasources/business_setting_local_datasource.dart';
import 'package:eky_pos/data/datasources/business_setting_remote_datasource.dart';
import 'package:eky_pos/data/datasources/category_remote_datasource.dart';
import 'package:eky_pos/data/datasources/db_local_datasource.dart';
import 'package:eky_pos/data/datasources/order_remote_datasource.dart';
import 'package:eky_pos/data/datasources/outlet_remote_datasource.dart';
import 'package:eky_pos/data/datasources/printer_remote_datasource.dart';
import 'package:eky_pos/data/datasources/product_remote_datasource.dart';
import 'package:eky_pos/data/datasources/sales_report_remote_datasource.dart';
import 'package:eky_pos/data/datasources/staff_remote_datasource.dart';
import 'package:eky_pos/data/models/responses/auth_response_model.dart';
import 'package:eky_pos/presentation/auth/bloc/account/account_bloc.dart';
import 'package:eky_pos/presentation/auth/bloc/login/login_bloc.dart';
import 'package:eky_pos/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:eky_pos/presentation/auth/pages/splash_page.dart';
import 'package:eky_pos/presentation/home/bloc/checkout/checkout_bloc.dart';
import 'package:eky_pos/presentation/home/bloc/online_checker/online_checker_bloc.dart';
import 'package:eky_pos/presentation/home/bloc/order/order_bloc.dart';
import 'package:eky_pos/presentation/home/bloc/order_offline/order_offline_bloc.dart';
import 'package:eky_pos/presentation/home/bloc/transaction/transaction_bloc.dart';
import 'package:eky_pos/presentation/home/bloc/transaction_offline/transaction_offline_bloc.dart';
import 'package:eky_pos/presentation/home/pages/home_page.dart';
import 'package:eky_pos/presentation/items/bloc/category/category_bloc.dart';
import 'package:eky_pos/presentation/items/bloc/product/product_bloc.dart';
import 'package:eky_pos/presentation/outlet/bloc/outlet/outlet_bloc.dart';
import 'package:eky_pos/presentation/printer/bloc/printer/printer_bloc.dart';
import 'package:eky_pos/presentation/sales_report/bloc/sales_report/sales_report_bloc.dart';
import 'package:eky_pos/presentation/scanner/blocs/get_qrcode/get_qrcode_bloc.dart';
import 'package:eky_pos/presentation/staff/bloc/staff/staff_bloc.dart';
import 'package:eky_pos/presentation/tax_discount/bloc/business_setting/business_setting_bloc.dart';
import 'package:eky_pos/presentation/tax_discount/bloc/business_setting_local/business_setting_local_bloc.dart';
import 'package:eky_pos/presentation/transaction/blocs/sync_order/sync_order_bloc.dart';

import 'presentation/auth/bloc/register/register_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterBloc(AuthRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => LoginBloc(AuthRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(AuthRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => CategoryBloc(CategoryRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => ProductBloc(ProductRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => CheckoutBloc(),
        ),
        BlocProvider(
          create: (context) => OrderBloc(OrderRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => TransactionBloc(OrderRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => AccountBloc(AuthLocalDatasource()),
        ),
        BlocProvider(
          create: (context) => OutletBloc(OutletRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => StaffBloc(StaffRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => PrinterBloc(PrinterRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              BusinessSettingBloc(BusinessSettingRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => SalesReportBloc(SalesReportRemoteDatasource()),
        ),
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
        BlocProvider(
          create: (context) => SyncOrderBloc(
              DBLocalDatasource.instance, OrderRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              BusinessSettingLocalBloc(BusinessSettingLocalDatasource()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Jago POS',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          useMaterial3: true,
          // textTheme: GoogleFonts.quicksandTextTheme(
          //   Theme.of(context).textTheme,
          // ),
          appBarTheme: AppBarTheme(
            color: AppColors.primary,
            elevation: 0,
            // titleTextStyle: GoogleFonts.quicksand(
            //   color: AppColors.primary,
            //   fontSize: 16.0,
            //   fontWeight: FontWeight.w500,
            // ),
            iconTheme: const IconThemeData(
              color: AppColors.primary,
            ),
          ),
        ),
        home: FutureBuilder<AuthResponseModel?>(
            future: AuthLocalDatasource().getUserData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data != null &&
                    snapshot.data!.accessToken != null) {
                  return const HomePage();
                } else {
                  return const SplashPage();
                }
              } else {
                return const SplashPage();
              }
            }),
      ),
    );
  }
}
