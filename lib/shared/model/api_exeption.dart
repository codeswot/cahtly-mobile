class ApiExcepetion implements Exception {
  final String message;
  final int statusCode;
  const ApiExcepetion({required this.message, required this.statusCode});
}
