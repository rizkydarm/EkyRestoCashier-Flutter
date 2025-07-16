import 'package:cached_network_image/cached_network_image.dart';
import 'package:eky_pos/data/models/responses/me_response_model.dart';
import 'package:eky_pos/presentation/home/bloc/online_checker/online_checker_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eky_pos/core/components/spaces.dart';
import 'package:eky_pos/core/constants/colors.dart';
import 'package:eky_pos/core/constants/variables.dart';
import 'package:eky_pos/core/extensions/string_ext.dart';
import 'package:eky_pos/data/models/requests/business_setting_request_model.dart';
import 'package:eky_pos/data/models/responses/product_response_model.dart';
import 'package:eky_pos/presentation/home/pages/checkout_page.dart';
import 'package:eky_pos/presentation/home/widgets/drawer_widget.dart';
import 'package:eky_pos/presentation/items/bloc/product/product_bloc.dart';
import 'package:eky_pos/presentation/items/pages/category_page.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: const Text('Sales'),
        centerTitle: true,
        leading: IconButton(
          visualDensity: VisualDensity.comfortable,
          icon: const Icon(Icons.menu),
          onPressed: () => scaffoldKey.currentState?.openDrawer(),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: null,
        child: ElevatedButton.icon(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CheckoutPage())),
          icon: const Icon(Icons.payment),
          label: const Text('PAY'),
        ),
      ),
      body: Center(
        child: ElevatedButton.icon(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                return const CategoryPage();
              }));
            },
            icon: const Icon(Icons.add),
            label: const Text("Add Category"),
          ),
      ),
    );
  }

  BlocBuilder<ProductBloc, ProductState> productSection(
      Outlet? outletData, List<BusinessSettingRequestModel> taxs) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () {
            return Center(child: CircularProgressIndicator());
          },
          loading: () {
            return Center(child: CircularProgressIndicator());
          },
          success: (products) {
            if (products.isEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Text("No Items")),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      minimumSize: const Size(200, 50),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const CategoryPage();
                      }));
                    },
                    child: Text("Tambahkan Kategori",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                ],
              );
            }
            return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                GlobalKey buttonKey = GlobalKey();
                return BlocBuilder<OnlineCheckerBloc, OnlineCheckerState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () {
                        // not check stock
                        return _buildProductCard(products[index], buttonKey,
                            outletData, taxs, true, false);
                      },
                      offline: () {
                        // offline, not check stock
                        return _buildProductCard(products[index], buttonKey,
                            outletData, taxs, false, false);
                      },
                      online: () {
                        // online, check stock
                        return _buildProductCard(products[index], buttonKey,
                            outletData, taxs, true, true);
                      },
                    );
                  },
                );
              },
              itemCount: products.length,
              separatorBuilder: (context, index) {
                return const SpaceHeight(4);
              },
            );
          },
        );
      },
    );
  }

  Widget _buildProductCard(
      Product product,
      GlobalKey buttonKey,
      dynamic outletData,
      List<BusinessSettingRequestModel> taxs,
      bool validateStock,
      bool showStock) {
    return InkWell(
      key: buttonKey,
      onTap: () async {
        
      },
      child: Card(
        color: Colors.white,
        child: ListTile(
          leading: product.image != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: Variables.baseUrl + product.image!,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                )
              : Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: changeStringtoColor(product.color ?? ""),
                  ),
                ),
          title: Text(product.name ?? "",
              style: const TextStyle(
                color: AppColors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              )),
          subtitle: showStock
              ? Text("Stock: 100",
                  style: const TextStyle(
                    color: AppColors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ))
              : null,
          trailing: Text(product.price!.currencyFormatRpV3,
              style: const TextStyle(
                color: AppColors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              )),
        ),
      ),
    );
  }
}
