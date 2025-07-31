part of 'register_bloc.dart';

@freezed
class RegisterEvent with _$RegisterEvent {
  const factory RegisterEvent.started() = _Started;
  //register
  const factory RegisterEvent.register({
    required String email,
    required String password,
    required String name,
    required String phone,
    required String role,
  }) = _Register;
}