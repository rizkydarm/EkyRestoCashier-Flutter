import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:dartz/dartz.dart';
import 'package:eky_pos/data/models/responses/auth_response_model.dart';

part 'login_bloc.freezed.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(_Initial()) {
    on<_Login>((event, emit) async {
      // emit(LoginState.loading());
      // final result = await authRemoteDataSource.login(
      //   event.email,
      //   event.password,
      // );
      // result.fold(
      //   (l) => emit(_Error(l)),
      //   (r) => emit(_Success(r)),
      // );
    });
  }
}
