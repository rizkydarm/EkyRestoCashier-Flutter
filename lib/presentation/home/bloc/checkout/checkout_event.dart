part of 'checkout_bloc.dart';

@freezed
class CheckoutEvent with _$CheckoutEvent {
  const factory CheckoutEvent.started() = _Started;
  
  const factory CheckoutEvent.addToCart({
    required ProductModel product,
  }) = _AddToCart;

  const factory CheckoutEvent.removeFromCart({
    required ProductModel product,
  }) = _RemoveFromCart;

  const factory CheckoutEvent.incrementProduct({
    required ProductModel product,
  }) = _IncrementProduct;

  const factory CheckoutEvent.decrementProduct({
    required ProductModel product,
  }) = _DecrementProduct;
}
