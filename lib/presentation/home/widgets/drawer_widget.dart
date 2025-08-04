import 'package:eky_pos/presentation/home/pages/home_page.dart';
import 'package:eky_pos/presentation/staff/pages/staff_page.dart';
import 'package:eky_pos/presentation/transaction/pages/transaction_page.dart';
import 'package:flutter/material.dart';
import 'package:eky_pos/core/constants/colors.dart';
import 'package:eky_pos/presentation/home/pages/sales_page.dart';
import 'package:eky_pos/presentation/items/pages/item_page.dart';
import 'package:eky_pos/presentation/printer/pages/printer_page.dart';
import 'package:eky_pos/presentation/tax_discount/pages/tax_discount_page.dart';

class DrawerWidget extends StatelessWidget {

  final double? width;
  
  const DrawerWidget({super.key, this.width});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: width,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero
      ),
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
            accountEmail: Text('rizky@gmail.com - Owner',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset('assets/icons/ekycashier_outline.png', width: 44)
            ),
          ),
          DrawerMenuItem(
            title: 'Sales',
            icon: Icons.food_bank,
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
                (route) => false,
              );
            },
          ),
          DrawerMenuItem(
            title: 'Product & Stock',
            icon: Icons.list,
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const ItemPage()),
                (route) => false,
              );
            },
          ),
          DrawerMenuItem(
            title: 'Transaction',
            icon: Icons.receipt,
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const TransactionPage()),
                (route) => false,
              );
            },
          ),
          DrawerMenuItem(
            title: 'Printers',
            icon: Icons.print,
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const PrinterPage()),
                (route) => false,
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
                (route) => false,
              );
            },
          ),
          DrawerMenuItem(
            title: 'Taxes & Discounts',
            icon: Icons.percent,
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const TaxDiscountPage()),
                (route) => false,
              );
            },
          ),
          // ListTile(
          //   leading: Icon(Icons.analytics),
          //   title: Text('Sales Report'),
          //   onTap: () {
          //     Navigator.pushAndRemoveUntil(
          //       context,
          //       MaterialPageRoute(builder: (context) => const SalesReportPage()),
          //       (route) => route.isFirst,
          //     );
          //   },
          // ),
          // ListTile(
          //   leading: Icon(Icons.store),
          //   title: Text('Outlet Management'),
          //   onTap: () {
          //     Navigator.pushAndRemoveUntil(
          //       context,
          //       MaterialPageRoute(builder: (context) => OutletPage(
          //         outletName: 'Pusat',
          //       )),
          //       (route) => route.isFirst,
          //     );
          //   },
          // ),
          // SpaceHeight(60),
          // DrawerMenuItem(
          //   title: 'Logout',
          //   icon: Icons.logout,
          //   isCompact: _isCompact,
          //   onPressed: () => onPressed?.call(5),
          // ),
          // Divider(),
          // ListTile(
          //   title: Text('Version 1.0.1'),
          // ),
        ],
      ),
    );  
  }
}

class DrawerMenuItem extends StatelessWidget {

  final String title;
  final IconData icon;
  final Function() onPressed;

  const DrawerMenuItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onPressed,
    );
  }
}
