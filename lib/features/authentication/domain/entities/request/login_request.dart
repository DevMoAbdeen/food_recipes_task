class LoginRequest {
  final String username;
  final String password;
  final int expiresInMinutes;

  LoginRequest({
    required this.username,
    required this.password,
    required this.expiresInMinutes,
  });
}
