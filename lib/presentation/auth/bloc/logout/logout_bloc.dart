import 'package:bloc/bloc.dart';
import 'package:eky_pos/presentation/auth/repo/user_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// import 'package:eky_pos/data/datasources/auth_remote_datasource.dart';

part 'logout_bloc.freezed.dart';
part 'logout_event.dart';
part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final UserRepository userRepository;

  LogoutBloc({required this.userRepository}) : super(_Initial()) {
    on<_Logout>((event, emit) async{
      emit(LogoutState.loading());
      final result = await userRepository.logout();
      if (result) {
        emit(LogoutState.success());
      } else {
        emit(LogoutState.error('Failed to logout'));
      }
    });
  }
}
