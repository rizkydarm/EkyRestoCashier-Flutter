part of 'checkout_bloc.dart';

@freezed
class CheckoutEvent with _$CheckoutEvent {
  const factory CheckoutEvent.started() = _Started;
  
  const factory CheckoutEvent.addToCart({
    required Product product,
  }) = _AddToCart;

  const factory CheckoutEvent.removeFromCart({
    required Product product,
  }) = _RemoveFromCart;

  const factory CheckoutEvent.incrementProduct({
    required Product product,
  }) = _IncrementProduct;

  const factory CheckoutEvent.decrementProduct({
    required Product product,
  }) = _DecrementProduct;

  //addDiscount
  // const factory CheckoutEvent.addDiscount({
  //   required BusinessSettingRequestModel discount,
  // }) = _AddDiscount;

  //removeDiscount
  // const factory CheckoutEvent.removeDiscount({
  //   required BusinessSettingRequestModel discount,
  // }) = _RemoveDiscount;
}
