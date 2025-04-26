class TValidator {
  ///Empty Text Validation

  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName برجاء ادخال';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'الرجاء إدخال عنوان البريد الإلكتروني';
    }
    // Regular expression for email validation
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'عنوان البريد الالكتروني غير صالح';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'الرجاء إدخال كلمة المرور';
    }
    if (value.length < 6) {
      return 'الرجاء إدخال كلمة المرور بطول 6 أحرف على الأقل';
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'الرجاء إدخال حرف كبير واحد على الأقل';
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'الرجاء إدخال رقم واحد على الأقل';
    }
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'الرجاء إدخال رمز خاص واحد على الأقل';
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'الرجاء إدخال رقم الهاتف';
    }
    if (value.length < 3) {
      return 'رقم الهاتف يجب أن يكون على الأقل 3 أحرف';
    }
    return null;
  }

  //add more validators as needed
}
