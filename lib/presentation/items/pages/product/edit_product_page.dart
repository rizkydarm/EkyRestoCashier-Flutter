import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eky_pos/core/components/custom_dropdown.dart';
import 'package:eky_pos/core/components/spaces.dart';
import 'package:eky_pos/core/constants/colors.dart';
import 'package:eky_pos/core/constants/variables.dart';
import 'package:eky_pos/core/extensions/build_context_ext.dart';
import 'package:eky_pos/core/extensions/string_ext.dart';
// import 'package:eky_pos/data/datasources/auth_local_datasource.dart';
import 'package:eky_pos/data/models/responses/category_response_model.dart';

import 'package:eky_pos/data/models/responses/product_response_model.dart';
import 'package:eky_pos/presentation/items/bloc/category/category_bloc.dart';
import 'package:eky_pos/presentation/items/bloc/product/product_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/product_model.dart';

class EditProductPage extends StatefulWidget {
  final ProductModel data;
  const EditProductPage({
    super.key,
    required this.data,
  });

  @override
  State<EditProductPage> createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _stockController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _barcodeController = TextEditingController();
  final _costController = TextEditingController();

  // String _selectedCategory = 'Pilih Kategori';

  CategoryModel? _selectedCategoryData;

  //8 list colors
  final List<Color> _colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
    Colors.pink,
    Colors.teal
  ];

  Color _selectedColor = Colors.red;

  final _formKey = GlobalKey<FormState>();

  XFile? _image;

  void _getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = image;
      });
    }
  }

  void _takePicture() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _image = image;
      });
    }
  }

  void changeColor(Color color) {
    setState(() {
      _selectedColor = color;
    });
  }

  //radio button
  bool _isImage = false;

  @override
  void initState() {
    _nameController.text = widget.data.name ?? '';
    _priceController.text = widget.data.price!.currencyFormatRpV3;
    _stockController.text = widget.data.stock.toString();
    _descriptionController.text = widget.data.description ?? '';
    _barcodeController.text = widget.data.barcode ?? '';
    _costController.text = widget.data.cost!.currencyFormatRpV3;
    _selectedCategoryData = widget.data.category;
    _selectedColor = changeStringtoColor(widget.data.color ?? '');
    if (widget.data.image != null) {
      _isImage = true;
    }
    context.read<CategoryBloc>().add(CategoryEvent.getCategories());
    _priceController.addListener(() {
      final nominal = _priceController.text.replaceAll(RegExp(r'[^0-9]'), '');
      _priceController.value = TextEditingValue(
        text: nominal.currencyFormatRp,
        selection:
            TextSelection.collapsed(offset: nominal.currencyFormatRp.length),
      );
    });

    _costController.addListener(() {
      final nominal = _costController.text.replaceAll(RegExp(r'[^0-9]'), '');
      _costController.value = TextEditingValue(
        text: nominal.currencyFormatRp,
        selection:
            TextSelection.collapsed(offset: nominal.currencyFormatRp.length),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Product',
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
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nama Produk',
              ),
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 16),
            BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                List<CategoryModel> categories = [
                  CategoryModel(id: 0, name: 'Pilih Kategori')
                ];
                state.maybeWhen(
                  orElse: () {
                    _selectedCategoryData = categories.first;
                  },
                  success: (categories) {
                    if (_selectedCategoryData != null) {
                      _selectedCategoryData = categories.first;
                    }
                  },
                );
                return CustomDropdown<CategoryModel>(
                  value: _selectedCategoryData,
                  items: categories,
                  label: 'Kategori',
                  hint: 'Pilih Kategori',
                  onChanged: (value) {
                    setState(() {
                      _selectedCategoryData = value;
                    });
                  },
                );
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _priceController,
              decoration: const InputDecoration(
                labelText: 'Harga Jual',
              ),
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _costController,
              decoration: const InputDecoration(
                labelText: 'Harga Modal',
              ),
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _barcodeController,
              decoration: const InputDecoration(
                labelText: 'Barcode',
              ),
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 16),
            Text('Tampilan di POS'),
            const SizedBox(height: 16),
            RadioListTile<bool>(
                value: false,
                groupValue: _isImage,
                onChanged: (value) {
                  setState(() {
                    _isImage = value!;
                  });
                },
                title: Text('Warna')),
            RadioListTile(
                value: true,
                groupValue: _isImage,
                onChanged: (value) {
                  setState(() {
                    _isImage = value!;
                  });
                },
                title: Text('Gambar')),
            const SizedBox(height: 16),
            if (!_isImage)
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _colors
                    .map((color) => GestureDetector(
                          onTap: () {
                            changeColor(color);
                          },
                          child: _selectedColor == color
                              ? Container(
                                  width: 50,
                                  height: 50,
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
                                )
                              : Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: color,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: Colors.grey.shade300,
                                    ),
                                  ),
                                ),
                        ))
                    .toList(),
              ),
            // const SizedBox(height: 16),
            if (_isImage)
              //upload image or pick image from gallery
              Row(
                children: [
                  //Container for image preview
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: _image != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(
                              File(_image!.path),
                              fit: BoxFit.cover,
                            ))
                        : widget.data.image != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  '${Variables.baseUrl}${widget.data.image!}',
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Icon(
                                Icons.image,
                                color: Colors.white,
                                size: 50,
                              ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          minimumSize: Size(200, 40),
                        ),
                        onPressed: () {
                          _getImage();
                        },
                        child: Row(
                          children: [
                            Icon(Icons.folder),
                            SpaceWidth(8),
                            const Text('Pilih Gambar'),
                          ],
                        ),
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          minimumSize: Size(200, 40),
                        ),
                        onPressed: () {
                          _takePicture();
                        },
                        child: Row(
                          children: [
                            Icon(Icons.camera_alt),
                            SpaceWidth(8),
                            const Text('Ambil Foto'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 40),
                backgroundColor: AppColors.primary,
              ),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  final data = ProductModel(
                    id: widget.data.id,
                    name: _nameController.text,
                    categoryId: 0,
                    price: _priceController.text.toIntegerFromText.toDouble().toString(),
                    cost: _costController.text.toIntegerFromText.toDouble().toString(),
                    stock: 0,
                    color: getColorString(_selectedColor),
                    barcode: _barcodeController.text,
                    description: _nameController.text,
                  );

                  if (_isImage) {
                    if (_isImage) {
                      // context.read<ProductBloc>().add(
                      //     ProductEvent.editProductWithImage(
                      //         data, _image!, widget.data.id!));
                    } else {
                      context
                          .read<ProductBloc>()
                          .add(ProductEvent.editProduct(data, widget.data.id!));
                    }
                  } else {
                    context
                        .read<ProductBloc>()
                        .add(ProductEvent.editProduct(data, widget.data.id!));
                  }
                  context.pop();
                  context.pop();
                  context.showSnackBar(
                      'Produk berhasil diubah', AppColors.primary);
                }
              },
              child: const Text('Simpan Perubahan',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
