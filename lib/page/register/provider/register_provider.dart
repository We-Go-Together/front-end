import 'package:herewego/domain/entity/user_profile.dart';

class RegisterState {
  final bool isLoading;
  final bool? isSuccess;
  final String? errorMessage;

  RegisterState({
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage,
  });

  factory RegisterState.initial() => RegisterState();

  factory RegisterState.loading() => RegisterState(isLoading: true);

  factory RegisterState.success(UserProfile userProfile) =>
      RegisterState(isSuccess: true);

  factory RegisterState.error(String errorMessage) =>
      RegisterState(errorMessage: errorMessage);
}
