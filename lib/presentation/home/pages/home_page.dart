import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eky_pos/core/components/spaces.dart';
import 'package:eky_pos/core/constants/colors.dart';
import 'package:eky_pos/core/constants/variables.dart';
import 'package:eky_pos/core/extensions/build_context_ext.dart';
import 'package:eky_pos/core/extensions/int_ext.dart';
import 'package:eky_pos/core/extensions/string_ext.dart';
import 'package:eky_pos/core/utils/business_setting_mapper.dart';
import 'package:eky_pos/data/datasources/auth_local_datasource.dart';
import 'package:eky_pos/data/datasources/db_local_datasource.dart';
import 'package:eky_pos/data/models/requests/business_setting_request_model.dart';
import 'package:eky_pos/data/models/responses/me_response_model.dart';
import 'package:eky_pos/data/models/responses/product_response_model.dart';
import 'package:eky_pos/presentation/auth/bloc/account/account_bloc.dart';
import 'package:eky_pos/presentation/home/bloc/checkout/checkout_bloc.dart';
import 'package:eky_pos/presentation/home/bloc/online_checker/online_checker_bloc.dart';
import 'package:eky_pos/presentation/home/models/product_model.dart';
import 'package:eky_pos/presentation/home/pages/checkout_page.dart';
import 'package:eky_pos/presentation/home/widgets/drawer_widget.dart';
import 'package:eky_pos/presentation/items/bloc/category/category_bloc.dart';
import 'package:eky_pos/presentation/items/bloc/product/product_bloc.dart';
import 'package:eky_pos/presentation/items/pages/category_page.dart';
import 'package:eky_pos/presentation/scanner/blocs/get_qrcode/get_qrcode_bloc.dart';
import 'package:eky_pos/presentation/scanner/pages/scanner_page.dart';
import 'package:eky_pos/presentation/tax_discount/bloc/business_setting/business_setting_bloc.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';

import '../../tax_discount/bloc/business_setting_local/business_setting_local_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  OverlayEntry? _overlayEntry;

  final GlobalKey cartKey = GlobalKey();
  bool _isAnimating = false;

  double totalPayment = 0;

  List<ProductQtyModel> orders = [];

  bool _hasFetchedOnlineData = false;
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  void _addOrder(ProductModel product) {
    setState(() {
      final index =
          orders.indexWhere((element) => element.product.id == product.id);
      if (index >= 0) {
        orders[index].qty++;
      } else {
        orders.add(ProductQtyModel(product: product));
      }
      totalPayment += product.price;
    });
  }

  //category selected
  int? selectedCategory;

  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(ProductEvent.fetchLocal());
    context.read<CategoryBloc>().add(const CategoryEvent.fetchLocal());
    context.read<AccountBloc>().add(const AccountEvent.getAccount());
    // context
    //     .read<BusinessSettingBloc>()
    //     .add(const BusinessSettingEvent.getBusinessSetting());
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    AuthLocalDatasource().getPrinter().then((value) async {
      if (value != null) {
        await PrintBluetoothThermal.connect(
            macPrinterAddress: value.macAddress ?? "");
      }
    });

    Connectivity().checkConnectivity().then(_handleConnectivity);
    _connectivitySubscription =
        Connectivity().onConnectivityChanged.listen(_handleConnectivity);

    // StreamSubscription<List<ConnectivityResult>> subscription = Connectivity()
    //     .onConnectivityChanged
    //     .listen((List<ConnectivityResult> connectivityResult) {
    //   // Received changes in available connectivity types!
    //   if (connectivityResult.contains(ConnectivityResult.mobile)) {
    //     // Mobile network available.
    //     context
    //         .read<OnlineCheckerBloc>()
    //         .add(const OnlineCheckerEvent.check(true));
    //     _fetchOnlineProductOnce();
    //   } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
    //     // Wi-fi is available.
    //     context
    //         .read<OnlineCheckerBloc>()
    //         .add(const OnlineCheckerEvent.check(true));
    //     _fetchOnlineProductOnce();
    //     // Note for Android:
    //     // When both mobile and Wi-Fi are turned on system will return Wi-Fi only as active network type
    //   } else {
    //     // Neither mobile network nor Wi-fi available.
    //     context
    //         .read<OnlineCheckerBloc>()
    //         .add(const OnlineCheckerEvent.check(false));

    //   }
    // });
  }

  void _handleConnectivity(List<ConnectivityResult> list) {
    final isOnline = list.contains(ConnectivityResult.mobile) ||
        list.contains(ConnectivityResult.wifi);

    // update status ke OnlineCheckerBloc
    context.read<OnlineCheckerBloc>().add(OnlineCheckerEvent.check(isOnline));

    if (isOnline) {
      // fetch business setting dari server (akan tersimpan ke SQLite di bloc online)
      context
          .read<BusinessSettingBloc>()
          .add(const BusinessSettingEvent.getBusinessSetting());

      // hanya sinkron produk & kategori sekali
      if (!_hasFetchedOnlineData) _fetchOnlineProductOnce();
    } else {
      // ambil business setting dari SQLite
      context
          .read<BusinessSettingLocalBloc>()
          .add(const BusinessSettingLocalEvent.getBusinessSetting());
    }
  }

  void _fetchOnlineProductOnce() {
    _hasFetchedOnlineData = true;
    context.read<CategoryBloc>().add(const CategoryEvent.getCategories());
    context.read<ProductBloc>().add(ProductEvent.getProducts());
  }

  void _startAnimation(
      BuildContext context, GlobalKey buttonKey, Widget image) {
    if (_isAnimating) return;

    final RenderBox buttonBox =
        buttonKey.currentContext!.findRenderObject() as RenderBox;
    final RenderBox cartBox =
        cartKey.currentContext!.findRenderObject() as RenderBox;
    final Offset buttonPosition = buttonBox.localToGlobal(Offset.zero);
    final Offset cartPosition = cartBox.localToGlobal(Offset.zero);

    _animation = Tween<Offset>(
      begin: buttonPosition,
      end: cartPosition,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _overlayEntry = _createFloatingIcon(buttonPosition, image);
    Overlay.of(context).insert(_overlayEntry!);

    setState(() {
      _isAnimating = true;
    });

    _controller.forward().then((_) {
      _overlayEntry?.remove();
      setState(() {
        _isAnimating = false;
        _controller.reset();
      });
    });
  }

  OverlayEntry _createFloatingIcon(Offset startPosition, Widget image) {
    return OverlayEntry(
      builder: (context) => AnimatedBuilder(
        animation: _controller,
        builder: (_, child) {
          final offset = Offset(
            _animation.value.dx,
            _animation.value.dy,
          );
          return Positioned(
            top: offset.dy,
            left: offset.dx,
            child: image,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _connectivitySubscription.cancel();
    super.dispose();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Tambahkan key di sini
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: const Text(
          'Penjualan',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: AppColors.white,
          ),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        actions: [
          BlocBuilder<OnlineCheckerBloc, OnlineCheckerState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => Container(
                  width: 32,
                  height: 32,
                  // margin: const EdgeInsets.symmetric(horizontal: 16),
                  // padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: AppColors.red,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Icon(
                    Icons.signal_wifi_off,
                    color: AppColors.white,
                    size: 20,
                  ),
                ),
                online: () {
                  return MultiBlocListener(
                    listeners: [
                      BlocListener<ProductBloc, ProductState>(
                        listener: (context, state) {
                          state.maybeMap(
                            orElse: () {},
                            success: (_) async {
                              await DBLocalDatasource.instance
                                  .removeAllProduct();
                              await DBLocalDatasource.instance
                                  .insertAllProduct(_.data.toList());

                              // ScaffoldMessenger.of(context).showSnackBar(
                              //   const SnackBar(
                              //     content: Text('Sync Data Product Success'),
                              //     backgroundColor: AppColors.primary,
                              //   ),
                              // );
                            },
                            error: (_) {
                              if (mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(_.message),
                                    backgroundColor: AppColors.red,
                                  ),
                                );
                              }
                              debugPrint(_.message);
                            },
                          );
                        },
                      ),
                      BlocListener<CategoryBloc, CategoryState>(
                        listener: (context, state) {
                          state.maybeMap(
                            orElse: () {},
                            success: (_) async {
                              await DBLocalDatasource.instance
                                  .removeAllCategory();
                              await DBLocalDatasource.instance
                                  .insertAllCategory(_.data.toList());
                              // ScaffoldMessenger.of(context).showSnackBar(
                              //   const SnackBar(
                              //     content: Text('Sync Data Category Success'),
                              //     backgroundColor: AppColors.primary,
                              //   ),
                              // );
                            },
                            error: (_) {
                              if (mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(_.message),
                                    backgroundColor: AppColors.red,
                                  ),
                                );
                              }
                              debugPrint(_.message);
                            },
                          );
                        },
                      ),
                      BlocListener<BusinessSettingBloc, BusinessSettingState>(
                        listener: (context, state) {
                          state.maybeMap(
                            orElse: () {},
                            loaded: (_) async {
                              final listLocal =
                                  _.data.map((e) => e.toTaxDiscount()).toList();
                              await DBLocalDatasource.instance
                                  .removeAllTaxDiscount();
                              await DBLocalDatasource.instance
                                  .insertAllTaxDiscount(listLocal);
                            },
                            error: (_) {
                              if (mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(_.message),
                                    backgroundColor: AppColors.red,
                                  ),
                                );
                              }
                              debugPrint(_.message);
                            },
                          );
                        },
                      ),
                    ],
                    child: Container(
                      width: 32,
                      height: 32,
                      // margin: const EdgeInsets.symmetric(horizontal: 16),
                      // padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: AppColors.green,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: const Icon(
                        Icons.wifi,
                        color: AppColors.white,
                        size: 20,
                      ),
                    ),
                  );
                },
              );
            },
          ),
          SpaceWidth(16),
          BlocListener<GetQrcodeBloc, GetQrcodeState>(
            listener: (context, state) {
              state.maybeWhen(
                  orElse: () {},
                  success: (value) async {
                    context
                        .read<ProductBloc>()
                        .add(ProductEvent.getProductByBarcode(value));
                  });
            },
            child: GestureDetector(
              onTap: () {
                context
                    .read<GetQrcodeBloc>()
                    .add(const GetQrcodeEvent.started());
                context.push(const ScannerPage());
              },
              child: Image.asset(
                'assets/images/barcode.png',
                color: AppColors.white,
                height: 28,
              ),
            ),
          ),
          SpaceWidth(16),
        ],
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return CheckoutPage(
                    // orders: orders,
                    );
              }));
            },
            child: Container(
              height: 80,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    key: cartKey,
                    'BAYAR',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  BlocBuilder<CheckoutBloc, CheckoutState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '0',
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SpaceWidth(10),
                              Text(
                                '(0 item)',
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          );
                        },
                        success: (orders, promo, tax, subtotal, total, qty) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                total.currencyFormatRp,
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SpaceWidth(10),
                              Text(
                                '($qty item)',
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            margin: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade300),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/icons/search-status.png',
                      color: AppColors.primary,
                    ), // Ikon di kiri
                    SizedBox(width: 16),
                    //vertical divender
                    Container(
                      height: 28,
                      width: 1,
                      color: Colors.grey.shade300,
                    ),
                    SizedBox(width: 8),
                    BlocBuilder<CategoryBloc, CategoryState>(
                      builder: (context, state) {
                        return state.maybeWhen(orElse: () {
                          return Text(
                            'Semua Kategori',
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          );
                        }, success: (data) {
                          //drowdown
                          return SizedBox(
                            width: 240,
                            child: DropdownButton(
                              icon: const SizedBox.shrink(),
                              borderRadius: BorderRadius.circular(8),
                              value: selectedCategory,
                              items: data
                                  .map(
                                    (e) => DropdownMenuItem(
                                      value: e.id,
                                      child: Text(e.name ?? ""),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedCategory = value;
                                });
                                context.read<ProductBloc>().add(
                                    ProductEvent.getProductsByCategory(value!));
                              },
                              hint: Text(
                                'Semua Kategori',
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          );
                        });
                      },
                    ),
                  ],
                ),
                // Icon(Icons.keyboard_arrow_down,
                //     color: AppColors.primary), // Dropdown ikon
              ],
            ),
          ),
          SpaceHeight(8),
          Expanded(
            child: BlocBuilder<AccountBloc, AccountState>(
              builder: (context, state) {
                final outletData = state.maybeWhen(
                  orElse: () => null,
                  loaded: (data, outlet) => outlet,
                );
                return BlocBuilder<OnlineCheckerBloc, OnlineCheckerState>(
                  builder: (context, state) {
                    final bool isOnline = state.maybeWhen(
                        online: () => true, orElse: () => false);

                    return isOnline
                        ? BlocBuilder<BusinessSettingBloc,
                            BusinessSettingState>(
                            builder: (context, state) {
                              List<BusinessSettingRequestModel> taxs =
                                  state.maybeWhen(
                                orElse: () => <BusinessSettingRequestModel>[],
                                loaded: (data) => data.where((element) {
                                  return element.chargeType == 'tax';
                                }).toList(),
                              );
                              return productSection(outletData, taxs);
                            },
                          )
                        : BlocBuilder<BusinessSettingLocalBloc,
                            BusinessSettingLocalState>(
                            builder: (context, state) {
                              List<BusinessSettingRequestModel> taxs =
                                  state.maybeWhen(
                                orElse: () => <BusinessSettingRequestModel>[],
                                loaded: (data) => data
                                    .where((e) => e.chargeType == 'tax')
                                    .map((e) => e.toRequestModel())
                                    .toList(),
                              );
                              return productSection(outletData, taxs);
                            },
                          );
                  },
                );
              },
            ),
          )
        ],
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
    int getStock() {
      if (product.stocks == null || product.stocks!.isEmpty) {
        // fallback ke field `stock` jika ada, atau 0
        return product.stock ?? 0;
      }

      // cari stok untuk outlet tertentu; bila tidak ada pakai stok pertama
      final match = product.stocks!
          .firstWhere(
            (e) => e.outletId == outletData?.id,
            orElse: () => product.stocks!.first,
          )
          .quantity;

      return match ?? 0;
    }

    // Hanya hitung stok bila diperlukan
    final int stock = (validateStock || showStock) ? getStock() : 0;

    return InkWell(
      key: buttonKey,
      onTap: () async {
        if (validateStock && stock <= 0) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text("Stok Habis"),
              backgroundColor: AppColors.red,
            ),
          );
          return;
        }

        _startAnimation(
          context,
          buttonKey,
          product.image != null
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
        );

        await Future.delayed(const Duration(milliseconds: 700));
        context.read<CheckoutBloc>().add(
              CheckoutEvent.addToCart(
                product: product,
                businessSetting: taxs,
              ),
            );
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
              ? Text("Stock: $stock",
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
