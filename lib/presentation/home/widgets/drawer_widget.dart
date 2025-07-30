import 'package:eky_pos/presentation/transaction/pages/transaction_page.dart';
import 'package:flutter/material.dart';
import 'package:eky_pos/core/components/spaces.dart';
import 'package:eky_pos/core/constants/colors.dart';
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
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.primary,
            ),
            accountName: Text('Pusat',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            accountEmail: Text('rizky@gmai.com - Owner',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.store,
                size: 44, color: AppColors.primary)
            ),
          ),
          ListTile(
            leading: Icon(Icons.food_bank),
            title: Text('Sales'),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
                (route) => route.isFirst,
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.receipt),
            title: Text('Transaction'),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const TransactionPage()),
                (route) => route.isFirst,
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text('Product & Stock'),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const ItemPage()),
                (route) => route.isFirst,
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.print),
            title: Text('Printers'),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const PrinterPage()),
                (route) => route.isFirst,
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Staff Management'),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const StaffPage()),
                (route) => route.isFirst,
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.percent),
            title: Text('Taxes & Discounts'),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const TaxDiscountPage()),
                (route) => route.isFirst,
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.analytics),
            title: Text('Sales Report'),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const SalesReportPage()),
                (route) => route.isFirst,
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.store),
            title: Text('Outlet Management'),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => OutletPage(
                  outletName: 'Pusat',
                )),
                (route) => route.isFirst,
              );
            },
          ),
          SpaceHeight(60),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () async {
            },
          ),
          Divider(),
          ListTile(
            title: Text('Version 1.0.1'),
          ),
        ],
      ),
    );  
  }
}
