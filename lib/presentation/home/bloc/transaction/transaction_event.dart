part of 'transaction_bloc.dart';

@freezed
class TransactionEvent with _$TransactionEvent {
  const factory TransactionEvent.started() = _Started;
  const factory TransactionEvent.getAllOrder() = _GetAllOrder;
  const factory TransactionEvent.getAllOrderItem() = _GetAllOrderItem;
  const factory TransactionEvent.getOrderByTransactionId(int id) = _GetOrderByTransactionId;
  const factory TransactionEvent.getItemsByTransactionId(int id) = _GetItemsByTransactionId;
}