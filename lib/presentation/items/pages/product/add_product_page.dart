import 'dart:io';

import 'package:eky_pos/core/utils/talker.dart';
import 'package:eky_pos/data/models/responses/product_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eky_pos/core/components/spaces.dart';
import 'package:eky_pos/core/constants/colors.dart';
import 'package:eky_pos/core/extensions/string_ext.dart';
// import 'package:eky_pos/data/datasources/auth_local_datasource.dart';
import 'package:eky_pos/data/models/responses/category_response_model.dart';
import 'package:eky_pos/presentation/items/bloc/category/category_bloc.dart';
import 'package:eky_pos/presentation/items/bloc/product/product_bloc.dart';
import 'package:eky_pos/presentation/items/models/product_model.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/components/custom_dropdown.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    final nameController = TextEditingController();
    final priceController = TextEditingController();
    final barcodeController = TextEditingController();
    final costController = TextEditingController();
    
    priceController.addListener(() {
      final nominal = priceController.text.replaceAll(RegExp(r'[^0-9]'), '');
      priceController.value = TextEditingValue(
        text: nominal.currencyFormatRp,
        selection:
            TextSelection.collapsed(offset: nominal.currencyFormatRp.length),
      );
    });

    costController.addListener(() {
      final nominal = costController.text.replaceAll(RegExp(r'[^0-9]'), '');
      costController.value = TextEditingValue(
        text: nominal.currencyFormatRp,
        selection:
            TextSelection.collapsed(offset: nominal.currencyFormatRp.length),
      );
    });

    CategoryModel? selectedCategoryData;

    bool isImage = false;
    final emojiController = TextEditingController();

    final List<Color> colors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.yellow,
      Colors.purple,
      Colors.orange,
      Colors.pink,
      Colors.teal
    ];

    Color selectedColor = Colors.white;

    final formKey = GlobalKey<FormState>();

    context.read<CategoryBloc>().add(CategoryEvent.getCategories());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tambah Produk',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Nama Produk',
              ),
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 16),
            BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                List<CategoryModel> categories = [];
                state.maybeWhen(
                  orElse: () {},
                  success: (data) => categories = data,
                );
                return StatefulBuilder(
                  builder: (context, setState) {
                    return CustomDropdown<CategoryModel>(
                      hint: 'Choose Category',
                      value: selectedCategoryData,
                      items: categories,
                      label: 'Category',
                      onChanged: (value) => setState(() => selectedCategoryData = value),
                    );
                  }
                );
              },
            ),
            const SizedBox(height: 16),

            TextFormField(
              controller: priceController,
              decoration: const InputDecoration(
                labelText: 'Harga Jual',
              ),
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: costController,
              decoration: const InputDecoration(
                labelText: 'Harga Dasar',
              ),
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: barcodeController,
              decoration: const InputDecoration(
                labelText: 'Barcode',
              ),
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 16),
            Text('Tampilan di POS'),
            const SizedBox(height: 16),
            StatefulBuilder(
              builder: (context, setState) {
                return Column(
                  children: [
                    RadioListTile<bool>(
                      value: false,
                      groupValue: isImage,
                      onChanged: (value) => setState(() => isImage = value!),
                      title: Text('Color')
                    ),
                    RadioListTile<bool>(
                      value: true,
                      groupValue: isImage,
                      onChanged: (value) => setState(() => isImage = value!),
                      title: Text('Emoji')
                    ),
                    const SizedBox(height: 16),
                    if (!isImage) Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: colors.map((color) => GestureDetector(
                        onTap: () => setState(() => selectedColor = color),
                        child: selectedColor == color ? SizedBox(
                          width: 50,
                          height: 50,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: color,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Colors.grey,
                                width: 4,
                              ),
                            ),
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                          ),
                        ) : SizedBox(
                          width: 50,
                          height: 50,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: color,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Colors.grey.shade300,
                              ),
                            ),
                          ),
                        ),
                      )).toList(),
                    ) else TextField(
                      controller: emojiController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        hintText: 'Choose 1 emoji in keyboard',
                        suffixIcon: Icon(Icons.emoji_emotions),
                        suffixIconColor: Colors.grey,
                      ),
                    )
                  ],
                );
              }
            ),
            const SizedBox(height: 24),
            BlocConsumer<ProductBloc, ProductState>(
              listener: (context, state) {
                state.maybeWhen(
                  orElse: () {},
                  success: (data) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Produk berhasil ditambahkan')),
                    );
                  },
                );
              },
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  orElse: () {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                      ),
                      onPressed: () async {
                        if ((formKey.currentState?.validate() ?? false) && selectedCategoryData != null) {
                          if (isImage) {
                            if (emojiController.text.isEmpty && emojiController.text.length > 1) {
                              if (!context.mounted) return;
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Emoji is required')),
                              );
                              return;
                            }
                          }
                          final data = ProductModel(
                            name: nameController.text,
                            categoryId: selectedCategoryData!.id!,
                            category: selectedCategoryData!,
                            price: priceController.text.toIntegerFromText.toDouble().toString(),
                            cost: costController.text.toIntegerFromText.toDouble().toString(),
                            stock: 1,
                            color: getColorString(selectedColor),
                            barcode: barcodeController.text,
                            description: nameController.text,
                            image: isImage ? emojiController.text : '▪️',
                          );
                          context.read<ProductBloc>().add(ProductEvent.addProduct(data));
                        }
                      },
                      child: const Text('Simpan')
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
