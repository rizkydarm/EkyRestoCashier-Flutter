import 'package:eky_pos/presentation/home/pages/sales_page.dart';
import 'package:eky_pos/presentation/home/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:eky_pos/presentation/home/pages/checkout_page.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {

    final isLargeScreen = MediaQuery.of(context).size.width > 840;
    final toggleDrawerProvider = Provider.of<ToggleDrawerProvider>(context);

    return Row(
      children: [ 
        if (!toggleDrawerProvider.isExpanded)
          MainDrawer(
            width: isLargeScreen ? 240 : 0,
            onTap: (type) {
              switch (type) {
                case DrawerMenuItemType.sales:
                  navigationShell.goBranch(0, initialLocation: 0 == navigationShell.currentIndex);
                  break;
                case DrawerMenuItemType.product:
                  navigationShell.goBranch(1, initialLocation: 1 == navigationShell.currentIndex);
                  break;
                case DrawerMenuItemType.transaction:
                  navigationShell.goBranch(2, initialLocation: 2 == navigationShell.currentIndex);
                  break;
                case DrawerMenuItemType.tableManagement:
                  navigationShell.goBranch(3, initialLocation: 3 == navigationShell.currentIndex);
                  break;
                case DrawerMenuItemType.printer:
                  navigationShell.goBranch(4, initialLocation: 4 == navigationShell.currentIndex);
                  break;
                case DrawerMenuItemType.staff:
                  navigationShell.goBranch(5, initialLocation: 5 == navigationShell.currentIndex);
                  break;
                case DrawerMenuItemType.taxDiscount:
                  navigationShell.goBranch(6, initialLocation: 6 == navigationShell.currentIndex);
                  break;
                case DrawerMenuItemType.salesReport:
                  navigationShell.goBranch(7, initialLocation: 7 == navigationShell.currentIndex);
                  break;
                case DrawerMenuItemType.outletManagement:
                  navigationShell.goBranch(8, initialLocation: 7 == navigationShell.currentIndex);
                  break;
                case DrawerMenuItemType.logout:
                  break;
              }
            },
          ),
        Expanded(
          child: navigationShell,
        ),
      ],
    );
  }
}

class SalesAndCheckoutPages extends StatelessWidget {

  const SalesAndCheckoutPages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: SalesPage()
        ),
        Expanded(
          flex: 1,
          child: CheckoutPage()
        ),
      ],
    );
  }
}

class ToggleDrawerProvider extends ChangeNotifier {
  bool _isExpanded = false;

  bool get isExpanded => _isExpanded;

  void toggle() {
    _isExpanded = !_isExpanded;
    notifyListeners();
  }
}