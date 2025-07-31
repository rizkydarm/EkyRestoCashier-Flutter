import 'package:bloc/bloc.dart';
import 'package:eky_pos/presentation/auth/models/user_model.dart';
import 'package:eky_pos/presentation/auth/repo/user_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:dartz/dartz.dart';
import 'package:eky_pos/data/models/responses/auth_response_model.dart';

part 'login_bloc.freezed.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final UserRepository userRepository;

  LoginBloc({required this.userRepository}) : super(_Initial()) {
    on<_Login>((event, emit) async {
      emit(LoginState.loading());
      final user = await userRepository.getUser(event.email);
      emit(LoginState.success(user));
    });
  }
}
