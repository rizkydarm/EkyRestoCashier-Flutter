import 'package:eky_pos/data/models/responses/category_response_model.dart';
import 'package:eky_pos/data/models/responses/product_response_model.dart';
import 'package:eky_pos/presentation/home/pages/home_page.dart';
import 'package:eky_pos/presentation/home/pages/sales_page.dart';
// import 'package:eky_pos/presentation/home/pages/sales_page.dart';
import 'package:eky_pos/presentation/items/pages/category/category_page.dart';
import 'package:eky_pos/presentation/items/pages/product/add_product_page.dart';
import 'package:eky_pos/presentation/items/pages/product/detail_product_page.dart';
import 'package:eky_pos/presentation/items/pages/product/product_page.dart';
import 'package:eky_pos/presentation/printer/pages/printer_page.dart';
import 'package:eky_pos/presentation/staff/pages/staff_page.dart';
import 'package:eky_pos/presentation/table_management/pages/table_management_page.dart';
import 'package:eky_pos/presentation/tax_discount/pages/tax_discount_page.dart';
import 'package:eky_pos/presentation/transaction/pages/transaction_page.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey, 
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return HomePage(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorKey,
          routes: [
            GoRoute(
              path: '/sales',
              builder: (context, state) {
                print("go to sales page");
                final isLargeScreen = MediaQuery.of(context).size.width > 840;
                return isLargeScreen ? const SalesAndCheckoutPages() : const SalesPage();
              },
              routes: [
                // GoRoute(
                //   path: 'detail/:id',
                //   builder: (context, state) => DetailPage(
                //     id: state.pathParameters['id'] ?? '',
                //     title: 'Home Detail',
                //   ),
                // ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/category',
              name: 'category',
              builder: (context, state) {
                print("go to category page");
                return const CategoryPage();
              },
              routes: [
                GoRoute(
                  path: 'product',
                  name: 'product',
                  builder: (context, state) => ProductPage(
                    category: state.extra as CategoryModel,
                  ),
                ),
                GoRoute(
                  path: 'add_product',
                  name: 'add_product',
                  builder: (context, state) => AddProductPage(category: state.extra as CategoryModel),
                ),
                GoRoute(
                  path: 'detail_product',
                  name: 'detail_product',
                  builder: (context, state) => DetailProductPage(product: state.extra as ProductModel),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/transaction',
              builder: (context, state) {
                print("go to transaction page");
                return const TransactionPage();
              },
              routes: [
                // GoRoute(
                //   path: 'detail/:id',
                //   builder: (context, state) => DetailPage(
                //     id: state.pathParameters['id'] ?? '',
                //     title: 'Library Detail',
                //   ),
                // ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/table_management',
              builder: (context, state) {
                print("go to table management page");
                return const TableManagementPage();
              },
              routes: [],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/printer',
              builder: (context, state) => const PrinterPage(),
              routes: [],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/staff',
              builder: (context, state) => const StaffPage(),
              routes: [],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/tax_discount',
              builder: (context, state) => const TaxDiscountPage(),
              routes: [],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/sales_report',
              builder: (context, state) => const TaxDiscountPage(),
              routes: [],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/outlet_management',
              builder: (context, state) => const TaxDiscountPage(),
              routes: [],
            ),
          ],
        ),
      ],
    ),
  ],
  initialLocation: '/sales',
);