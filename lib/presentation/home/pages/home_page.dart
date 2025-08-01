import 'package:dartz/dartz.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:eky_pos/data/models/responses/category_response_model.dart';
import 'package:eky_pos/data/models/responses/product_response_model.dart';
import 'package:eky_pos/presentation/home/bloc/checkout/checkout_bloc.dart';
import 'package:eky_pos/presentation/home/pages/sales_page.dart';
import 'package:eky_pos/presentation/home/widgets/fade_page_view.dart';
import 'package:eky_pos/presentation/items/bloc/category/category_bloc.dart';
import 'package:eky_pos/presentation/items/pages/item_page.dart';
import 'package:eky_pos/presentation/printer/pages/printer_page.dart';
import 'package:eky_pos/presentation/tax_discount/pages/tax_discount_page.dart';
import 'package:eky_pos/presentation/transaction/pages/transaction_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eky_pos/core/constants/colors.dart';
import 'package:eky_pos/core/extensions/string_ext.dart';
import 'package:eky_pos/presentation/home/pages/checkout_page.dart';
import 'package:eky_pos/presentation/home/widgets/drawer_widget.dart';
import 'package:eky_pos/presentation/items/bloc/product/product_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    
    context.read<ProductBloc>().add(ProductEvent.getProducts());
    context.read<CategoryBloc>().add(CategoryEvent.getCategories());

    final fadePageController = FadePageViewController();
    final sideMenuController = SideMenuController();

    sideMenuController.addListener((index) {
      fadePageController.changePage(index);
    });

    final toggleSideMenuNotifier = ValueNotifier<bool>(false);

    final pages = [
      SalesAndCheckoutPages(
        toggleSideMenuNotifier: toggleSideMenuNotifier
      ),
      TransactionPage(
        toggleSideMenuNotifier: toggleSideMenuNotifier,
      ),
      ItemPage(
        toggleSideMenuNotifier: toggleSideMenuNotifier,
      ),
      PrinterPage(
        toggleSideMenuNotifier: toggleSideMenuNotifier,
      ),
      TaxDiscountPage(
        toggleSideMenuNotifier: toggleSideMenuNotifier,
      ),
    ];

    final sideMenuItems = [
      SideMenuItem(
        onTap: (index, controller) {
          controller.changePage(index);
        },
        title: 'Sales',
        icon: Icon(Icons.food_bank),
      ),
      SideMenuItem(
        onTap: (index, controller) {
          controller.changePage(index);
        },
        title: 'Transactions',
        icon: Icon(Icons.receipt),
      ),
      SideMenuItem(
        onTap: (index, controller) {
          controller.changePage(index);
        },
        title: 'Items',
        icon: Icon(Icons.list),
      ),
      SideMenuItem(
        onTap: (index, controller) {
          controller.changePage(index);
        },
        title: 'Printer',
        icon: Icon(Icons.print),
      ),
      SideMenuItem(
        onTap: (index, controller) {
          controller.changePage(index);
        },
        title: 'Tax & Discount',
        icon: Icon(Icons.percent),
      ),
    ];

    return OrientationBuilder(
      builder: (context, orientation) {
        return ResponsiveBuilder(
          builder: (context, sizingInformation) {
            switch (sizingInformation.deviceScreenType) {
              case DeviceScreenType.desktop:
              case DeviceScreenType.tablet:
              if (orientation == Orientation.landscape) {
                return Row(
                  children: [ 
                    ValueListenableBuilder(
                      valueListenable: toggleSideMenuNotifier,
                      builder: (context, isResized, child) {
                        return isResized ? const SizedBox.shrink() : child ?? const SizedBox.shrink();
                      },
                      child: Material(
                        child: SideMenu(
                          controller: sideMenuController,
                          style: SideMenuStyle(
                            displayMode: SideMenuDisplayMode.auto,
                            openSideMenuWidth: 200,
                            compactSideMenuWidth: 70,
                            itemOuterPadding: EdgeInsets.zero,
                            itemBorderRadius: BorderRadius.zero,
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              ColoredBox(
                                color: AppColors.primary, 
                                child: SizedBox(
                                  height: kToolbarHeight,
                                ),
                              ),
                              SizedBox(
                                height: 100,
                                child: Center(
                                  child: Image.asset('assets/icons/ekycashier_outline.png', height: 50),
                                )
                              ),
                            ],
                          ),
                          items: sideMenuItems,
                        ),
                      ),
                    ),
                    Expanded(
                      child: FadePageView(
                        controller: fadePageController,
                        pages: pages,
                      ),
                    ),
                  ],
                );
              } else {
                return SalesPage();
              }
              case DeviceScreenType.mobile:
                return SalesPage();
              default:
                return const SizedBox();
            }
          },
        );
      }
    );
  }
}

class SalesAndCheckoutPages extends StatelessWidget {
  
  final ValueNotifier<bool>? toggleSideMenuNotifier;

  const SalesAndCheckoutPages({
    super.key,
    this.toggleSideMenuNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: SalesPage(toggleSideMenuNotifier: toggleSideMenuNotifier)
        ),
        Expanded(
          flex: 1,
          child: CheckoutPage()
        ),
      ],
    );
  }
}

