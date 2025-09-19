import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


enum DrawerMenuItemType {
  sales,
  product,
  transaction,
  tableManagement,
  printer,
  staff,
  taxDiscount,
  salesReport,
  outletManagement,
  logout,
}

class MainDrawer extends StatelessWidget {

  final double? width;
  final Function(DrawerMenuItemType)? onTap;
  
  const MainDrawer({super.key, this.width, this.onTap});

  @override
  Widget build(BuildContext context) {
    final isLargeScreen = MediaQuery.of(context).size.width > 840;

    void navigateToPage(String path) {
      context.pop();
      Future.delayed(const Duration(milliseconds: 300), () {
        if (context.mounted) {
          context.go(path);
        }
      });
    }

    return Drawer(
      width: width,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          ColoredBox(
            color: Theme.of(context).primaryColor,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SafeArea(
                bottom: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 44,
                      backgroundColor: Colors.white,
                      child: Image.asset('assets/icons/ekycashier_outline.png', width: 44)
                    ),
                    const SizedBox(height: 16),
                    Text('Restaurant Seafood Enak',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text('Staff - Cahsier',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          DrawerMenuItem(
            title: 'Sales',
            icon: Icons.food_bank,
            onPressed: () {
              if (isLargeScreen) {
                onTap?.call(DrawerMenuItemType.sales);
              } else {
                navigateToPage('/sales');
              }
            },
          ),
          DrawerMenuItem(
            title: 'Product & Stock',
            icon: Icons.list,
            onPressed: () {
              if (isLargeScreen) {
                onTap?.call(DrawerMenuItemType.product);
              } else {
                navigateToPage('/category');
              }
            },
          ),
          DrawerMenuItem(
            title: 'Transaction',
            icon: Icons.receipt,
            onPressed: () {
              if (isLargeScreen) {
                onTap?.call(DrawerMenuItemType.transaction);
              } else {
                navigateToPage('/transaction');
              }
            },
          ),
          DrawerMenuItem(
            title: 'Table Management',
            icon: Icons.table_bar,
            onPressed: () {
              if (isLargeScreen) {
                onTap?.call(DrawerMenuItemType.tableManagement);
              } else {
                navigateToPage('/table_management');
              }
            },
          ),
          Divider(),
          DrawerMenuItem(
            title: 'Printers',
            icon: Icons.print,
            onPressed: () {
              if (isLargeScreen) {
                onTap?.call(DrawerMenuItemType.printer);
              } else {
                navigateToPage('/printer');
              }
            },
          ),
          DrawerMenuItem(
            title: 'Staff Management',
            icon: Icons.people,
            onPressed: () {
              if (isLargeScreen) {
                onTap?.call(DrawerMenuItemType.staff);
              } else {
                navigateToPage('/staff');
              }
            },
          ),
          DrawerMenuItem(
            title: 'Taxes & Discounts',
            icon: Icons.percent,
            onPressed: () {
              if (isLargeScreen) {
                onTap?.call(DrawerMenuItemType.taxDiscount);
              } else {
                navigateToPage('/tax_discount');
              }
            },
          ),
          DrawerMenuItem(
            title: 'Sales Report',
            icon: Icons.analytics,
            onPressed: () {
              if (isLargeScreen) {
                onTap?.call(DrawerMenuItemType.salesReport);
              } else {
                navigateToPage('/sales_report');
              }
            },
          ),
          DrawerMenuItem(
            title: 'Outlet Management',
            icon: Icons.store,
            onPressed: () {
              if (isLargeScreen) {
                onTap?.call(DrawerMenuItemType.outletManagement);
              } else {
                navigateToPage('/outlet_management');
              }
            },
          ),
          Divider(height: 20),
          DrawerMenuItem(
            title: 'Logout',
            icon: Icons.logout,
            onPressed: () {
              onTap?.call(DrawerMenuItemType.logout);
            },
          ),
          ListTile(
            title: Text('Version 1.0.1'),
          ),
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
