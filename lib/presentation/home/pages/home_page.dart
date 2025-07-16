import 'package:dartz/dartz.dart';
import 'package:eky_pos/data/models/responses/category_response_model.dart';
import 'package:eky_pos/data/models/responses/product_response_model.dart';
import 'package:eky_pos/presentation/home/bloc/checkout/checkout_bloc.dart';
import 'package:eky_pos/presentation/items/bloc/category/category_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eky_pos/core/constants/colors.dart';
import 'package:eky_pos/core/extensions/string_ext.dart';
import 'package:eky_pos/presentation/home/pages/checkout_page.dart';
import 'package:eky_pos/presentation/home/widgets/drawer_widget.dart';
import 'package:eky_pos/presentation/items/bloc/product/product_bloc.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    context.read<ProductBloc>().add(ProductEvent.getProducts());
    context.read<CategoryBloc>().add(CategoryEvent.getCategories());
    // final selectedProductsValue = ValueNotifier<IList<int>>(ilist([]));
    final searchValue = ValueNotifier<String?>(null);
    return Scaffold(
      key: scaffoldKey,
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: const Text('Sales'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => scaffoldKey.currentState?.openDrawer(),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: BlocBuilder<CheckoutBloc, CheckoutState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => const SizedBox(),
              loading: () => const Center(child: CircularProgressIndicator()),
              success: (cart, subtotal, total, qty) => ElevatedButton.icon(
                onPressed: cart.isEmpty ? null : () {
                  Navigator.push(
                    context, MaterialPageRoute(
                      builder: (context) => CheckoutPage()
                    )
                  );
                },
                icon: const Icon(Icons.payment),
                label: const Text('Checkout'),
              )
            );
          },
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
                              return Padding(
                                padding: const EdgeInsets.all(16),
                                child: SearchBar(
                                  leading: const Icon(Icons.search),
                                  hintText: 'Search product or category',
                                  elevation: WidgetStateProperty.all(1),
                                  shape: WidgetStateProperty.all(RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  )),
                                  onChanged: (value) => searchValue.value = value,
                                ),
                              );
                            }
                            final index = i-1;
                            return BlocBuilder<CheckoutBloc, CheckoutState>(
                              builder: (context, state) {
                                return state.maybeWhen(
                                  orElse: () => const SizedBox(),
                                  success: (cart, subtotal, total, qty) {
                                    final selectedProduct = cart.any((element) => element.product.id == filteredData[index].id);
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
                                          SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: DecoratedBox(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(12),
                                                color: changeStringtoColor(filteredData[index].color ?? "#000000"),
                                              ),
                                            ),
                                          ),
                                          if (selectedProduct)
                                            Icon(Icons.check_circle, size: 30, color: AppColors.white),
                                        ],
                                      ),
                                      onTap: () {
                                        if (selectedProduct) {
                                          context.read<CheckoutBloc>().add(CheckoutEvent.removeFromCart(product: filteredData[index]));
                                        } else {
                                          context.read<CheckoutBloc>().add(CheckoutEvent.addToCart(product: filteredData[index]));
                                        }
                                      },
                                    );
                                  },
                                );
                              },
                            );
                          },
                        );
                      },
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
}
