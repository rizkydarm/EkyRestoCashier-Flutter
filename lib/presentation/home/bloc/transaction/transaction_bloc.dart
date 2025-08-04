import 'package:bloc/bloc.dart';
import 'package:eky_pos/data/datasources/db_local_datasource.dart';
import 'package:eky_pos/data/datasources/transaction_datasource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:eky_pos/data/models/responses/transaction_response_model.dart';

part 'transaction_bloc.freezed.dart';
part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  TransactionBloc() : super(_Initial()) {
    
    final dbTransaction = TransactionDataSource(dbLocal: DBLocalDatasource.instance);

    on<_GetAllOrder>((event, emit) async {
      emit(TransactionState.loading());
      final result = await dbTransaction.getAllTransaction();
      emit(TransactionState.success(result, null, null));
    });

    // on<_GetAllOrderItem>((event, emit) async {
    //   emit(TransactionState.loading());
    //   final result = await dbTransaction.getAllTransactionItem();
    //   emit(TransactionState.success(null, result, null));
    //   add(_GetAllOrder());
    // });

    on<_GetOrderByTransactionId>((event, emit) async {
      emit(TransactionState.loading());
      final result = await dbTransaction.getTransactionById(event.id);
      emit(TransactionState.success(null, null, result));
    });

    on<_GetItemsByTransactionId>((event, emit) async {
      emit(TransactionState.loading());
      final result = await dbTransaction.getTransactionById(event.id);
      emit(TransactionState.success(null, result?.items, null));
    });

  }
}
