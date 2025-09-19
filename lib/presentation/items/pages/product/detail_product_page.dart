import 'package:eky_pos/presentation/items/bloc/category/category_bloc.dart';
import 'package:eky_pos/presentation/items/bloc/product/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:eky_pos/core/constants/colors.dart';
import 'package:eky_pos/core/constants/variables.dart';
import 'package:eky_pos/core/extensions/string_ext.dart';

import 'package:eky_pos/data/models/responses/product_response_model.dart';
import 'package:eky_pos/presentation/items/pages/product/edit_product_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailProductPage extends StatelessWidget {
  
  final ProductModel product;
  
  const DetailProductPage({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Product'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: changeStringtoColor(product.color ?? Colors.white.toString()),
              ),
              child: Center(
                child: Text(product.image ?? '▪️',
                  style: const TextStyle(
                    fontSize: 32,
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            title: const Text('Nama Product'),
            subtitle: Text(product.name ?? ''),
          ),
          BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              final categories = state.maybeWhen(
                orElse: () => [],
                success: (data) => data,
              );
              final categoryName = categories.firstWhere((element) => element.id == product.categoryId)?.name ?? "-";
              return ListTile(
                title: const Text('Kategori Product'),
                subtitle: Text(categoryName),
              );
            }
          ),
          ListTile(
            title: const Text('Harga Jual Product'),
            subtitle: Text(product.price!.currencyFormatRpV3),
          ),

          ListTile(
            title: const Text('Harga Dasar Product'),
            subtitle: Text(product.cost!.currencyFormatRpV3),
          ),
          SizedBox(height: 16),
          //edit button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 16,
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditProductPage(data: product),
                      ),
                    );
                  },
                  child: const Text('Edit Product'),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.red,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    context.read<ProductBloc>().add(ProductEvent.deleteProduct(product.id!));
                    Navigator.pop(context);
                  },
                  child: const Text('Delete Product'),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
