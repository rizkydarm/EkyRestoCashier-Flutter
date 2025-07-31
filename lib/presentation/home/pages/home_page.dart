import 'package:dartz/dartz.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:eky_pos/data/models/responses/category_response_model.dart';
import 'package:eky_pos/data/models/responses/product_response_model.dart';
import 'package:eky_pos/presentation/home/bloc/checkout/checkout_bloc.dart';
import 'package:eky_pos/presentation/home/pages/sales_page.dart';
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

    final pageController = PageController();
    final sideMenuController = SideMenuController();

    sideMenuController.addListener((index) {
      pageController.jumpToPage(index);
    });


    final pages = [
      SalesAndCheckoutPages(),
      TransactionPage(),
      ItemPage(),
      PrinterPage(),
      TaxDiscountPage(),
    ];

    final sideMenuItems = [
      SideMenuItem(
        onTap: (index, controller) {
          controller.changePage(index);
        },
        title: 'Sales',
        icon: Icon(Icons.home),
      ),
      SideMenuItem(
        onTap: (index, controller) {
          controller.changePage(index);
        },
        title: 'Transactions',
        icon: Icon(Icons.home),
      ),
      SideMenuItem(
        onTap: (index, controller) {
          controller.changePage(index);
        },
        title: 'Items',
        icon: Icon(Icons.home),
      ),
      SideMenuItem(
        onTap: (index, controller) {
          controller.changePage(index);
        },
        title: 'Printer',
        icon: Icon(Icons.home),
      ),
      SideMenuItem(
        onTap: (index, controller) {
          controller.changePage(index);
        },
        title: 'Tax & Discount',
        icon: Icon(Icons.home),
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
                    SideMenu(
                      controller: sideMenuController,
                      items: sideMenuItems,
                      
                    ),
                    Expanded(
                      child: PageView.builder(
                        controller: pageController,
                        allowImplicitScrolling: false,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: pages.length,
                        itemBuilder: (context, index) {
                          return pages[index];
                        }
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

