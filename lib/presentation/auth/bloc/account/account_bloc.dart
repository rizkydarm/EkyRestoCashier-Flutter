import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:eky_pos/data/models/responses/auth_response_model.dart';
import 'package:eky_pos/data/models/responses/me_response_model.dart';

part 'account_bloc.freezed.dart';
part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc() : super(_Initial()) {
    on<_GetAccount>((event, emit) async {
      // emit(_Loading());
      // try {
      //   final authData = await authLocalDatasource.getUserData();
      //   final outletData = await authLocalDatasource.getOutletData();
      //   emit(_Loaded(authData!, outletData));
      // } catch (e) {
      //   emit(_Error(e.toString()));
      // }
    });
  }
}
