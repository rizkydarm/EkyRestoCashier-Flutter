import 'package:eky_pos/presentation/items/bloc/product/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:eky_pos/core/constants/colors.dart';
import 'package:eky_pos/core/constants/variables.dart';
import 'package:eky_pos/core/extensions/string_ext.dart';

import 'package:eky_pos/data/models/responses/product_response_model.dart';
import 'package:eky_pos/presentation/items/pages/product/edit_product_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailProductPage extends StatelessWidget {
  
  final ProductModel data;
  
  const DetailProductPage({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Product',
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700)),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          data.image != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    Variables.baseUrl + data.image!,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                )
              : Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: changeStringtoColor(data.color ?? ''),
                  ),
                ),
          ListTile(
            title: const Text('Nama Product'),
            subtitle: Text(data.name ?? ''),
          ),
          //category
          ListTile(
            title: const Text('Kategori Product'),
            subtitle: Text(data.category?.name ?? ''),
          ),
          ListTile(
            title: const Text('Harga Jual Product'),
            subtitle: Text(data.price!.currencyFormatRpV3),
          ),

          ListTile(
            title: const Text('Harga Dasar Product'),
            subtitle: Text(data.cost!.currencyFormatRpV3),
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
                        builder: (context) => EditProductPage(data: data),
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
                    context.read<ProductBloc>().add(ProductEvent.deleteProduct(data.id!));
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
