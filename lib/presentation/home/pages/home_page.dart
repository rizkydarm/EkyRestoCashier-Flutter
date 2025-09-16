import 'package:eky_pos/presentation/home/pages/sales_page.dart';
import 'package:eky_pos/presentation/home/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:eky_pos/presentation/home/pages/checkout_page.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
                  widget.navigationShell.goBranch(0, initialLocation: 0 == widget.navigationShell.currentIndex);
                  break;
                case DrawerMenuItemType.product:
                  widget.navigationShell.goBranch(1, initialLocation: 1 == widget.navigationShell.currentIndex);
                  break;
                case DrawerMenuItemType.transaction:
                  widget.navigationShell.goBranch(2, initialLocation: 2 == widget.navigationShell.currentIndex);
                  break;
                case DrawerMenuItemType.tableManagement:
                  widget.navigationShell.goBranch(3, initialLocation: 3 == widget.navigationShell.currentIndex);
                  break;
                case DrawerMenuItemType.printer:
                  widget.navigationShell.goBranch(4, initialLocation: 4 == widget.navigationShell.currentIndex);
                  break;
                case DrawerMenuItemType.staff:
                  widget.navigationShell.goBranch(5, initialLocation: 5 == widget.navigationShell.currentIndex);
                  break;
                case DrawerMenuItemType.taxDiscount:
                  widget.navigationShell.goBranch(6, initialLocation: 6 == widget.navigationShell.currentIndex);
                  break;
                case DrawerMenuItemType.salesReport:
                  widget.navigationShell.goBranch(7, initialLocation: 7 == widget.navigationShell.currentIndex);
                  break;
                case DrawerMenuItemType.outletManagement:
                  widget.navigationShell.goBranch(8, initialLocation: 7 == widget.navigationShell.currentIndex);
                  break;
                case DrawerMenuItemType.logout:
                  break;
              }
            },
          ),
        Expanded(
          child: widget.navigationShell,
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