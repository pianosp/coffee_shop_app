String? validateEmail(String? value) {
  const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
  final regex = RegExp(pattern);

  return value!.isEmpty || !regex.hasMatch(value)
      ? 'Please enter valid email'
      : null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your password.';
  } else if (value.length < 8) {
    return 'Password must be at least 8 characters';
  }
  return null;
}

String? validateName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your name.';
  }
  return null;
}

String? errorEmailSignup(String message) {
  // at any time, we can get the text from _controller.value.text
  if (message == 'Email is already in use') {
    return message;
  }
  return null;
}

String? errorEmailLogin(String message) {
  // at any time, we can get the text from _controller.value.text
  if (message == 'Email Invalid, please enter valid email.') {
    return message;
  }
  return null;
}

String? errorPassword(String message) {
  // at any time, we can get the text from _controller.value.text
  if (message == 'Password Invalid, please enter valid password.') {
    return message;
  }
  return null;
}
