import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:herewego/domain/entity/user_profile.dart';
import 'package:herewego/domain/usecase/auth/dto/register_dto.dart';
import 'package:herewego/domain/usecase/auth/register_usecase.dart';
import 'package:herewego/injector.dart';
import 'package:herewego/page/register/provider/register_validator_provider.dart';

import '../../../domain/usecase/auth/dto/login_dto.dart';
import '../../widget/email_input.dart';
import '../../widget/password_input.dart';

// 제출 부분
class RegisterNotifier extends StateNotifier<RegisterState> {
  RegisterNotifier() : super(RegisterState.initial());

  Future<void> register(RegisterDto dto) async {
    state = RegisterState.loading();
    final registerUseCase = locator<RegisterUseCase>();
    await registerUseCase(dto, onError: (error) {
      state = RegisterState.error(error.toString());
    });
    state = RegisterState.success();
  }
}

final registerNotifierProvider =
    StateNotifierProvider<RegisterNotifier, RegisterState>(
        (_) => RegisterNotifier());

class RegisterState {
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;

  const RegisterState({
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage,
  });

  factory RegisterState.initial() => const RegisterState();

  factory RegisterState.loading() => const RegisterState(isLoading: true);

  factory RegisterState.success() => const RegisterState(isSuccess: true);

  factory RegisterState.error(String errorMessage) =>
      RegisterState(errorMessage: errorMessage);
}
