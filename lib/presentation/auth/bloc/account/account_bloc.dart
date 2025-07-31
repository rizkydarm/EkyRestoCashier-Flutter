import 'package:bloc/bloc.dart';
import 'package:eky_pos/data/models/responses/user_model.dart';
import 'package:eky_pos/presentation/auth/models/user_model.dart';
import 'package:eky_pos/presentation/auth/repo/user_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:eky_pos/data/models/responses/auth_response_model.dart';
import 'package:eky_pos/data/models/responses/me_response_model.dart';
import 'package:eky_pos/data/datasources/auth_remote_datasource.dart';

part 'account_bloc.freezed.dart';
part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {

  final UserRepository userRepository;

  AccountBloc({required this.userRepository}) : super(_Initial()) {
    on<_GetAccount>((event, emit) async {
      emit(_Loading());
      try {
        final authData = await userRepository.getUser(event.email);
        
        emit(_Loaded(authData));
      } catch (e) {
        emit(_Error(e.toString()));
      }
    });
  }
}
