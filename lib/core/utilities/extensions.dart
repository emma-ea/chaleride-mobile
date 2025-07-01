extension StringExtensions on String {

  bool isValidUrlEndpoint() => trim().isNotEmpty && trim().split(' ').length == 1;

}