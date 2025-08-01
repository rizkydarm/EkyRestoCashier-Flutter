import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eky_pos/core/constants/colors.dart';
import 'package:eky_pos/core/extensions/string_ext.dart';
import 'package:eky_pos/presentation/home/widgets/drawer_widget.dart';
import 'package:eky_pos/presentation/tax_discount/bloc/business_setting/business_setting_bloc.dart';
import 'package:eky_pos/presentation/tax_discount/pages/add_tax_page.dart';
import 'package:eky_pos/presentation/tax_discount/pages/detail_tax_page.dart';

class TaxDiscountPage extends StatelessWidget {
  final ValueNotifier<bool>? toggleSideMenuNotifier;
  
  const TaxDiscountPage({super.key, this.toggleSideMenuNotifier});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: const Text('Tax & Discount'),
        centerTitle: true,
        leading: toggleSideMenuNotifier != null ? IconButton(
          icon: const Icon(Icons.menu_open),
          onPressed: () => toggleSideMenuNotifier!.value = !toggleSideMenuNotifier!.value,
        ) : null,
      ),
      body: BlocBuilder<BusinessSettingBloc, BusinessSettingState>(
        builder: (context, state) {
          return state.maybeWhen(orElse: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }, loaded: (data) {
            if (data.isEmpty) {
              return const Center(
                child: Text('Data Kosong'),
              );
            }
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: AppColors.primary,
                        child: Icon(
                          data[index].chargeType == 'tax'
                              ? Icons.percent
                              : Icons.discount,
                          color: AppColors.white,
                        ),
                      ),
                      title: Text(
                        data[index].name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(data[index].type == 'percentage'
                          ? '${data[index].value}%'
                          : data[index].value.currencyFormatRp),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.black,
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return DetailTaxPage(
                            businessSetting: data[index],
                          );
                        }));
                      },
                    ),
                    const Divider(),
                  ],
                );
              },
            );
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddTaxPage();
          }));
        },
        child: Icon(Icons.add, color: AppColors.white),
      ),
    );
  }
}
