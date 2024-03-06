String? validateFirstName(String? value) {
  if (value == null || value.isEmpty) {
    return 'name required!';
  }
  return null;
}
String? validateLasttName(String? value) {
  if (value == null || value.isEmpty) {
    return 'name required!';
  }
  return null;
}
String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'email address required!';
  } else if (!RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(value)) {
    return 'invalid email address';
  }
  return null;
}
String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'password required!';
  } else if (!RegExp(
          r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})')
      .hasMatch(value)) {
    return 'password must have at least 8 characters or more with one uppercase, one lowercase and one digit with at least one special character.';
  }
  return null;
}
String? validateConfirmPassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'please retype password';
  }
  return null;
}
String? validatePhone(String? value) {
  if (value == null || value.isEmpty) {
    return 'phone number required!';
  } else if (value.length < 10) {
    return 'phone number invalid!';
  }
  return null;
}