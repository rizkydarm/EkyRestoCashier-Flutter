import 'package:eky_pos/presentation/transaction/pages/transaction_page.dart';
import 'package:flutter/material.dart';
import 'package:eky_pos/core/components/spaces.dart';
import 'package:eky_pos/core/constants/colors.dart';
import 'package:eky_pos/presentation/home/pages/sales_page.dart';
import 'package:eky_pos/presentation/items/pages/item_page.dart';
import 'package:eky_pos/presentation/outlet/pages/outlet_page.dart';
import 'package:eky_pos/presentation/printer/pages/printer_page.dart';
import 'package:eky_pos/presentation/sales_report/pages/sales_report_page.dart';
import 'package:eky_pos/presentation/staff/pages/staff_page.dart';
import 'package:eky_pos/presentation/tax_discount/pages/tax_discount_page.dart';
import 'package:eky_pos/presentation/transaction/pages/history_transaction_page.dart';


class DrawerWidget extends StatelessWidget {

  final double? width;
  final bool _isCompact;
  final Function(int)? onPressed;

  const DrawerWidget({super.key, this.width}) : _isCompact = false, onPressed = null;

  factory DrawerWidget.compact({required Function(int) onPressed}) {
    return DrawerWidget._internal(width: 100, isCompact: true, onPressed: onPressed);
  }

  const DrawerWidget._internal({
    this.width,
    required bool isCompact,
    required this.onPressed,
  }) : _isCompact = isCompact;

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
            accountName: _isCompact ? null : Text('Pusat',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            accountEmail: _isCompact ? null : Text('rizky@gmail.com - Owner',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
            currentAccountPictureSize: _isCompact ? const Size.square(45) : const Size.square(72),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.store,
                size: _isCompact ? 32 : 44, color: AppColors.primary)
            ),
          ),
          DrawerMenuItem(
            title: 'Sales',
            icon: Icons.food_bank,
            isCompact: _isCompact,
            onPressed: () {
              if (!_isCompact) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const SalesPage()),
                  (route) => route.isFirst,
                );
              } else {
                onPressed?.call(0);
              }
            },
          ),
          DrawerMenuItem(
            title: 'Transaction',
            icon: Icons.receipt,
            isCompact: _isCompact,
            onPressed: () {
              if (!_isCompact) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const TransactionPage()),
                  (route) => route.isFirst,
                );
              } else {
                onPressed?.call(1);
              }
            },
          ),
          DrawerMenuItem(
            title: 'Product & Stock',
            icon: Icons.list,
            isCompact: _isCompact,
            onPressed: () {
              if (!_isCompact) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const ItemPage()),
                  (route) => route.isFirst,
                );
              } else {
                onPressed?.call(2);
              }
            },
          ),
          DrawerMenuItem(
            title: 'Printers',
            icon: Icons.print,
            isCompact: _isCompact,
            onPressed: () {
              if (!_isCompact) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const PrinterPage()),
                  (route) => route.isFirst,
                );
              } else {
                onPressed?.call(3);
              }
            },
          ),
          // Divider(),
          // ListTile(
          //   leading: Icon(Icons.people),
          //   title: Text('Staff Management'),
          //   onTap: () {
          //     Navigator.pushAndRemoveUntil(
          //       context,
          //       MaterialPageRoute(builder: (context) => const StaffPage()),
          //       (route) => route.isFirst,
          //     );
          //   },
          // ),
          DrawerMenuItem(
            title: 'Taxes & Discounts',
            icon: Icons.percent,
            isCompact: _isCompact,
            onPressed: () {
              if (!_isCompact) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const TaxDiscountPage()),
                  (route) => route.isFirst,
                );
              } else {
                onPressed?.call(4);
              }
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
  final bool isCompact;

  const DrawerMenuItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
    this.isCompact = false,
  });

  @override
  Widget build(BuildContext context) {
    return isCompact ? IconButton(
      style: IconButton.styleFrom(
        backgroundColor: null,
        fixedSize: const Size.fromHeight(54),
        shape: const LinearBorder(),
      ),
      onPressed: onPressed, 
      icon: Icon(icon)
    ) : ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onPressed,
    );
  }
}
