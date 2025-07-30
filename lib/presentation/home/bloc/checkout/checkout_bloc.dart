import 'package:bloc/bloc.dart';
import 'package:eky_pos/core/extensions/string_ext.dart';
import 'package:eky_pos/data/models/requests/business_setting_request_model.dart';
import 'package:eky_pos/presentation/home/models/product_quantity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/models/responses/product_response_model.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';
part 'checkout_bloc.freezed.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc() : super(_Success([], 0, 0, 0)) {
    
    on<_AddToCart>((event, emit) {
      final product = event.product;
      final state = this.state as _Success;
      final cart = <ProductQuantity>[];
      cart.addAll(state.cart);
      final index = cart.indexWhere((element) => element.product.id == product.id);
      if (index == -1) {
        cart.add(ProductQuantity(product: product, quantity: 1));
      }
      final totalPrice = cart.fold(0, (previousValue, element) => previousValue + element.product.price!.toDouble.toInt() * element.quantity);
      final totalQuantity = cart.fold(0, (previousValue, element) => previousValue + element.quantity);

      emit(_Success(cart, 0, totalPrice.toDouble(), totalQuantity));
    });

    on<_RemoveFromCart>((event, emit) {
      final product = event.product;
      final state = this.state as _Success;
      final cart = <ProductQuantity>[];
      cart.addAll(state.cart);
      final index = cart.indexWhere((element) => element.product.id == product.id);
      if (index != -1) {
        cart.removeWhere((element) => element.product.id == product.id);
      }
      final totalPrice = cart.fold(0, (previousValue, element) => previousValue + element.product.price!.toDouble.toInt() * element.quantity);
      final totalQuantity = cart.fold(0, (previousValue, element) => previousValue + element.quantity);
      emit(_Success(cart, 0, totalPrice.toDouble(), totalQuantity));
    });

    on<_IncrementProduct>((event, emit) {
      final product = event.product;
      final state = this.state as _Success;
      final cart = <ProductQuantity>[];
      cart.addAll(state.cart);
      final index = cart.indexWhere((element) => element.product.id == product.id);
      if (index != -1) {
        cart[index].quantity++;
      }
      final totalPrice = cart.fold(0, (previousValue, element) => previousValue + element.product.price!.toDouble.toInt() * element.quantity);
      final totalQuantity = cart.fold(0, (previousValue, element) => previousValue + element.quantity);
      emit(_Success(cart, 0, totalPrice.toDouble(), totalQuantity));
    });

    on<_DecrementProduct>((event, emit) {
      final product = event.product;
      final state = this.state as _Success;
      final cart = <ProductQuantity>[];
      cart.addAll(state.cart);
      final index = cart.indexWhere((element) => element.product.id == product.id);
      if (index != -1) {
        if (cart[index].quantity > 1) {
          cart[index].quantity--;
        }
      }
      final totalPrice = cart.fold(0, (previousValue, element) => previousValue + element.product.price!.toDouble.toInt() * element.quantity);
      final totalQuantity = cart.fold(0, (previousValue, element) => previousValue + element.quantity);
      emit(_Success(cart, 0, totalPrice.toDouble(), totalQuantity));
    });

    on<_Started>((event, emit) {
      emit(_Success([], 0, 0, 0));
    });

    // on<_AddDiscount>((event, emit) {
    //   final state = this.state as _Success;
    //   final discount = event.discount;
    //   final total = state.cart.fold(
    //       0,
    //       (previousValue, element) =>
    //           previousValue +
    //           element.product.price!.toDouble.toInt() * element.quantity);
    //   final totalQuantity = state.cart.fold(
    //       0, (previousValue, element) => previousValue + element.quantity);
    //   final totalTax = state.tax;
    //   final totalPayment = total -
    //       (discount.type == 'fixed'
    //           ? discount.value.toDouble
    //           : total * (discount.value.toDouble / 100)) +
    //       totalTax;
    //   emit(_Loading());
    //   emit(_Success(
    //       state.cart,
    //       (discount.type == 'fixed'
    //           ? discount.value.toDouble
    //           : total * (discount.value.toDouble / 100)),
    //       totalTax,
    //       total.toDouble(),
    //       totalPayment,
    //       totalQuantity));
    // });

    // on<_RemoveDiscount>((event, emit) {
    //   final state = this.state as _Success;
    //   final total = state.cart.fold(
    //       0,
    //       (previousValue, element) =>
    //           previousValue +
    //           element.product.price!.toDouble.toInt() * element.quantity);
    //   final totalQuantity = state.cart.fold(
    //       0, (previousValue, element) => previousValue + element.quantity);
    //   final totalTax = state.tax;
    //   final totalPayment = total + 0 + totalTax;
    //   emit(_Loading());
    //   emit(_Success(state.cart, 0, totalTax, total.toDouble(), totalPayment,
    //       totalQuantity));
    // });
  }
}
