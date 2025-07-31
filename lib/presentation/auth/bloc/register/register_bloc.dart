import 'package:bloc/bloc.dart';
import 'package:eky_pos/presentation/auth/models/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:eky_pos/presentation/auth/repo/user_repo.dart';
import 'package:uuid/uuid.dart';

part 'register_bloc.freezed.dart';
part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserRepository userRepository;
  RegisterBloc({required this.userRepository}) : super(_Initial()) {
    on<_Register>((event, emit) async{
      emit(RegisterState.loading());
      final user = await userRepository.addUser(
        UserModel(
          userId: Uuid().v4(),
          email: event.email,
          password: event.password,
          name: event.name,
          phone: event.phone,
          role: event.role,
        ),
      );
      emit(RegisterState.success(user));
    });
  }
}
