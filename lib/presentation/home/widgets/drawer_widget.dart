import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eky_pos/core/components/spaces.dart';
import 'package:eky_pos/core/constants/colors.dart';
import 'package:eky_pos/data/datasources/auth_local_datasource.dart';
import 'package:eky_pos/presentation/auth/bloc/account/account_bloc.dart';
import 'package:eky_pos/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:eky_pos/presentation/auth/pages/splash_page.dart';
import 'package:eky_pos/presentation/home/pages/home_page.dart';
import 'package:eky_pos/presentation/items/pages/item_page.dart';
import 'package:eky_pos/presentation/outlet/pages/outlet_page.dart';
import 'package:eky_pos/presentation/printer/pages/printer_page.dart';
import 'package:eky_pos/presentation/sales_report/pages/sales_report_page.dart';
import 'package:eky_pos/presentation/staff/pages/staff_page.dart';
import 'package:eky_pos/presentation/tax_discount/pages/tax_discount_page.dart';
import 'package:eky_pos/presentation/transaction/pages/history_transaction_page.dart';


class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    //Header Drawer
    return Drawer(
      child: BlocBuilder<AccountBloc, AccountState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const SizedBox(),
            loaded: (authData, outlet) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    UserAccountsDrawerHeader(
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                      ),
                      accountName: Text(
                        outlet.name ?? 'Pusat',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      accountEmail: Text(
                        '${authData.data?.email} - ${authData.data?.roleId == 1 ? 'Owner' : authData.data?.roleId == 2 ? 'Manager' : 'Kasir'}',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      currentAccountPicture: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(Icons.store,
                                  size: 44, color: AppColors.primary))),
                    ),
                    ListTile(
                      leading: Icon(Icons.food_bank),
                      title: Text('Penjualan (POS)'),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const HomePage();
                        }));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.receipt),
                      title: Text('Transaksi'),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return HistoryTransactionPage();
                          // return TransactionPage();
                        }));
                      },
                    ),
                    //roleid 1 = owner and 2 = manager
                    if (authData.data?.roleId == 1 ||
                        authData.data?.roleId == 2)
                      ListTile(
                        leading: Icon(Icons.list),
                        title: Text('Product & Stock'),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const ItemPage();
                          }));
                        },
                      ),

                    ListTile(
                      leading: Icon(Icons.print),
                      title: Text('Printers'),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const PrinterPage();
                        }));
                      },
                    ),
                    //roleid 1 = owner and 2 = manager
                    if (authData.data?.roleId == 1 ||
                        authData.data?.roleId == 2)
                      Divider(),
                    //roleid 1 = owner and 2 = manager
                    if (authData.data?.roleId == 1 ||
                        authData.data?.roleId == 2)
                      ListTile(
                        leading: Icon(Icons.people),
                        title: Text('Staff Management'),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const StaffPage();
                          }));
                        },
                      ),
                    //roleid 1 = owner and 2 = manager
                    if (authData.data?.roleId == 1 ||
                        authData.data?.roleId == 2)
                      ListTile(
                        leading: Icon(Icons.percent),
                        title: Text('Taxes & Discounts'),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const TaxDiscountPage();
                          }));
                        },
                      ),
                    //roleid 1 = owner and 2 = manager
                    if (authData.data?.roleId == 1 ||
                        authData.data?.roleId == 2)
                      ListTile(
                        leading: Icon(Icons.analytics),
                        title: Text('Sales Report'),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const SalesReportPage();
                          }));
                        },
                      ),
                    //roleid 1 = owner
                    if (authData.data?.roleId == 1)
                      ListTile(
                        leading: Icon(Icons.store),
                        title: Text('Outlet Management'),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return OutletPage(
                              outletName: outlet.name ?? 'Pusat',
                            );
                          }));
                        },
                      ),
                    // Divider(),
                    // Spacer(),
                    // Divider(),
                    authData.data?.roleId != 1 ? SpaceHeight(60) : Container(),
                    ListTile(
                      leading: Icon(Icons.logout),
                      title: Text('Logout'),
                      onTap: () async {
                        context
                            .read<LogoutBloc>()
                            .add(const LogoutEvent.logout());
                        await AuthLocalDatasource().removeUserData();
                        await AuthLocalDatasource().removeOutletData();
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return const SplashPage();
                        }));
                      },
                    ),
                    Divider(),
                    //version 1.0.0
                    ListTile(
                      title: Text('Version 1.0.1'),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
