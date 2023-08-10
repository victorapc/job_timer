import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:job_timer/app/modules/services/auth/auth_service.dart';

part 'login_state.dart';

class LoginController extends Cubit<LoginState> {
  final AuthService _authService;

  LoginController({required AuthService authService})
      : _authService = authService,
        super(const LoginState.initial());

  Future<void> singIn() async {
    emit(state.copyWith(status: LoginStatus.loading));
    Future.delayed(const Duration(seconds: 1), () {
      emit(state.copyWith(status: LoginStatus.initial));
    });
  }
}
