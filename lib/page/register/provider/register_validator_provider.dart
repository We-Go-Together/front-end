class RegisterFormState {
  final String email;
  final String name;
  final String password;
  final String confirmPassword;
  final bool isEmailValid;
  final bool isNameValid;
  final bool isPasswordValid;
  final bool isConfirmPasswordValid;

  RegisterFormState(
      {this.email = '',
      this.name = '',
      this.password = '',
      this.confirmPassword = '',
      this.isEmailValid = false,
      this.isNameValid = false,
      this.isPasswordValid = false,
      this.isConfirmPasswordValid = false});

  bool get canSubmit => isEmailValid && isPasswordValid;

  RegisterFormState copyWith({
    String? email,
    String? name,
    String? password,
    String? confirmPassword,
    bool? isEmailValid,
    bool? isNameValid,
    bool? isPasswordValid,
    bool? isConfirmPasswordValid,
  }) =>
      RegisterFormState(
        email: email ?? this.email,
        name: name ?? this.name,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        isEmailValid: isEmailValid ?? this.isEmailValid,
        isNameValid: isNameValid ?? this.isNameValid,
        isPasswordValid: isPasswordValid ?? this.isPasswordValid,
        isConfirmPasswordValid:
            isConfirmPasswordValid ?? this.isConfirmPasswordValid,
      );
}
