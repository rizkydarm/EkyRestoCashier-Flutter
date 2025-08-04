import 'package:eky_pos/presentation/items/bloc/category/category_bloc.dart';
import 'package:eky_pos/presentation/items/bloc/product/product_bloc.dart';
import 'package:eky_pos/presentation/items/pages/product/add_product_page.dart';
import 'package:flutter/material.dart';
import 'package:eky_pos/presentation/home/widgets/drawer_widget.dart';
import 'package:eky_pos/presentation/items/pages/category/category_page.dart';
import 'package:eky_pos/presentation/items/pages/product/product_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ItemPage extends StatelessWidget {
  final ValueNotifier<bool>? toggleSideMenuNotifier;
  
  const ItemPage({super.key, this.toggleSideMenuNotifier});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    context.read<ProductBloc>().add(ProductEvent.getProducts());
    context.read<CategoryBloc>().add(CategoryEvent.getCategories());
    final deviceType = getDeviceType(MediaQuery.of(context).size);
    var tabIndex = 0;
    return Scaffold(
      key: scaffoldKey,
      drawer: deviceType == DeviceScreenType.mobile ? DrawerWidget() : null,
      appBar: AppBar(
        title: const Text(
          'Items',
        ),
        centerTitle: true,
        leading: toggleSideMenuNotifier != null ? IconButton(
          icon: const Icon(Icons.menu_open),
          onPressed: () => toggleSideMenuNotifier!.value = !toggleSideMenuNotifier!.value,
        ) : null,
      ),
      body: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          switch (sizingInformation.deviceScreenType) {
            case DeviceScreenType.desktop:
            case DeviceScreenType.tablet:
              return DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    TabBar(
                      onTap: (index) {
                        tabIndex = index;
                      },
                      tabs: const [
                        Tab(text: "Products"),
                        Tab(text: "Categories"),
                      ],
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          TabBarView(
                            children: [
                              ProductBlocListView(),
                              CategoryBlocListView(),
                            ],
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 16.0, bottom: 16.0),
                              child: FloatingActionButton(
                                onPressed: () {
                                  if (tabIndex == 0) {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return AddProductPage();
                                    }));
                                  } else {
                                    CategoryPage.showAddCategoryBottomSheet(context);
                                  }
                                },
                                child: const Icon(Icons.add),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            default:
              return ItemListViewMobile();
          }
        }
      ),
    );
  }
}

class ItemListViewMobile extends StatelessWidget {
  const ItemListViewMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Icon(Icons.list),
          title: Text("Products"),
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ProductPage();
          })),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.category),
          title: Text("Categories"),
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) {
            return CategoryPage();
          })),
        ),
        Divider(),
        // ListTile(
        //   leading: Icon(Icons.inventory),
        //   title: Text("Stocks"),
        //   onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) {
        //     return StockPage();
        //   })),
        // ),
        // Divider(),
      ],
    );
  }
}
