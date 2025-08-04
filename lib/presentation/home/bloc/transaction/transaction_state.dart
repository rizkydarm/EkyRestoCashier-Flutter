part of 'transaction_bloc.dart';

@freezed
class TransactionState with _$TransactionState {
  const factory TransactionState.initial() = _Initial;
  const factory TransactionState.loading() = _Loading;
  const factory TransactionState.success(List<TransactionModel>? transactions, List<TransactionItemModel>? items, TransactionModel? transaction) = _Success;
  const factory TransactionState.error(String message) = _Error;
}
