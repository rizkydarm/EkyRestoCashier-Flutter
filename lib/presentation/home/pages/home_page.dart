import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dartz/dartz.dart';
import 'package:eky_pos/data/models/responses/category_response_model.dart';
import 'package:eky_pos/presentation/items/bloc/category/category_bloc.dart';
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
    context.read<ProductBloc>().add(ProductEvent.getProducts());
    context.read<CategoryBloc>().add(CategoryEvent.getCategories());
    final selectedProductsValue = ValueNotifier<IList<int>>(ilist([]));
    final searchValue = ValueNotifier<String?>(null);
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
        child: ValueListenableBuilder(
          valueListenable: selectedProductsValue,
          builder: (context, value, child) {
            return ElevatedButton.icon(
              onPressed: value.isEmpty ? null : () => Navigator.push(context, MaterialPageRoute(builder: (context) => CheckoutPage())),
              icon: const Icon(Icons.payment),
              label: child ?? SizedBox(),
            );
          },
          child: const Text('PAY'),
        ),
      ),
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, categoryState) {
          return categoryState.maybeWhen(
            orElse: () => Center(child: Text("No Items")),
            loading: () => Center(child: CircularProgressIndicator()),
            success: (categories) => BlocBuilder<ProductBloc, ProductState>(
              builder: (context, productState) {
                return productState.maybeWhen(
                  orElse: () => Center(child: Text("No Items")),
                  loading: () => Center(child: CircularProgressIndicator()),
                  success: (products) {
                    if (products.isEmpty) {
                      return Center(child: Text("No Items"));
                    }
                    return ValueListenableBuilder(
                      valueListenable: searchValue,
                      builder: (context, value, child) {
                        final filteredData = value == null ? products : products.where((product) {
                          final searchTerm = value.toLowerCase();
                          final isName = product.name!.toLowerCase().contains(searchTerm);
                          final productCategory = categories.firstWhere(
                            (cat) => cat.id == product.categoryId,
                            orElse: () => Category(id: -1, name: '-'),
                          );                    
                          final isCategory = productCategory.name!.toLowerCase().contains(searchTerm);
                          return isName || isCategory;
                        }).toList();
                        return ListView.builder(
                          itemCount: filteredData.length+1,
                          itemBuilder: (context, i) {
                            if (i == 0) {
                              return child ?? SizedBox();
                            }
                            final index = i-1;
                            return ValueListenableBuilder(
                              valueListenable: selectedProductsValue,
                              builder: (context, selectedProducts, child) {
                                final selectedProduct = selectedProducts.any((element) => element == filteredData[index].id);
                                final categoryName = categories.firstWhere((element) => element.id == filteredData[index].categoryId).name ?? '-';
                                return ListTile(
                                  selected: selectedProduct,
                                  selectedTileColor: AppColors.primary.withValues(alpha: 0.4),
                                  title: Text(filteredData[index].name ?? "-"),
                                  subtitle: Text(categoryName),
                                  trailing: Text(filteredData[index].price?.currencyFormatRpV3 ?? "-"),
                                  leading: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      child ?? SizedBox(),
                                      if (selectedProduct)
                                        Icon(Icons.check_circle, size: 30, color: AppColors.white),
                                    ],
                                  ),
                                  onTap: () {
                                    final temp = (selectedProductsValue.value).toList();
                                    if (temp.any((element) => element == filteredData[index].id)) {
                                      temp.remove(filteredData[index].id);
                                    } else {
                                      temp.add(filteredData[index].id!);
                                    }
                                    selectedProductsValue.value = ilist(temp);
                                  },
                                );
                              },
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: changeStringtoColor(filteredData[index].color ?? "#000000"),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: SearchBar(
                          hintText: 'Search product or category',
                          elevation: WidgetStateProperty.all(1),
                          shape: WidgetStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          )),
                          onChanged: (value) => searchValue.value = value,
                        ),
                      ),
                    );
                  },
                );
              },
            )
          );
        }
      ),
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
