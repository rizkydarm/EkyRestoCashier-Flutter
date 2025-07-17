import 'package:bloc/bloc.dart';
import 'package:eky_pos/data/datasources/db_local_datasource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:eky_pos/data/models/responses/transaction_response_model.dart';

part 'transaction_bloc.freezed.dart';
part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  TransactionBloc() : super(_Initial()) {
    final dbLocalDatasource = DBLocalDatasource.instance;

    on<_GetAllOrder>((event, emit) async {
      emit(TransactionState.loading());
      final result = await dbLocalDatasource.getAllOrder();
      emit(TransactionState.success(result, null, null));
    });

    on<_GetAllOrderItem>((event, emit) async {
      emit(TransactionState.loading());
      final result = await dbLocalDatasource.getAllOrderItem();
      emit(TransactionState.success(null, result, null));
      add(_GetAllOrder());
    });

    on<_GetOrderByTransactionId>((event, emit) async {
      emit(TransactionState.loading());
      final result = await dbLocalDatasource.getOrderByTransactionId(event.transactionId);
      emit(TransactionState.success(null, null, result));
    });

    on<_GetItemsByTransactionId>((event, emit) async {
      emit(TransactionState.loading());
      final result = await dbLocalDatasource.getItemsByTransactionId(event.transactionId);
      emit(TransactionState.success(null, result, null));
    });

  }
}
