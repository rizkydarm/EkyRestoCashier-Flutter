import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eky_pos/core/constants/colors.dart';
import 'package:eky_pos/core/constants/variables.dart';
import 'package:eky_pos/core/extensions/string_ext.dart';
import 'package:eky_pos/presentation/items/bloc/category/category_bloc.dart';
import 'package:eky_pos/presentation/items/pages/product/add_product_page.dart';
import 'package:eky_pos/presentation/items/pages/product/detail_product_page.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../bloc/product/product_bloc.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        centerTitle: true
      ),
      body: ProductBlocListView(),
      floatingActionButton: ProductFab(),
    );
  }
}

class ProductFab extends StatelessWidget {
  const ProductFab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        final categories = state.maybeWhen(
          orElse: () => [],
          success: (data) => data,
        );
        return FloatingActionButton(
          onPressed: () {
            if (categories.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Please add category first"),
              ));
              return;
            }
            Navigator.push(context, MaterialPageRoute(builder: (context) => AddProductPage()));
          },
          child: const Icon(Icons.add),
        );
      },
    );
  }
}

class ProductBlocListView extends StatelessWidget {
  const ProductBlocListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => Center(child: Text("No Items")),
          loading: () => Center(child: CircularProgressIndicator()),
          error: (message) => Center(child: Text(message)),
          success: (data) {
            if (data.isEmpty) {
              return Center(child: Text("No Items"));
            }
            return ListView.separated(
              itemCount: data.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final product = data[index];
                return ListTile(
                  leading: product.image != null ? Text(
                    product.image!,
                    style: TextStyle(
                      fontSize: 32
                    ),
                  ) : Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: changeStringtoColor(product.color ?? ""),
                    ),
                  ),
                  title: Text(product.name ?? "-"),
                  subtitle: BlocBuilder<CategoryBloc, CategoryState>(
                    builder: (context, state) {
                      final categories = state.maybeWhen(
                        orElse: () => [],
                        success: (data) => data,
                      );
                      final categoryName = categories.firstWhere((element) => element.id == product.categoryId)?.name ?? "-";
                      return Text("Category: $categoryName");
                    }
                  ),
                  trailing: Text(product.price!.currencyFormatRpV3, style: TextStyle(fontSize: 14)),
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DetailProductPage(data: product))),
                );
              },
            );
          },
        );
      },
    );
  }
}
