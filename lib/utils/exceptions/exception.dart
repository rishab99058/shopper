class AppException implements Exception {
  final String message;

  AppException([
    this.message = 'An unexpected error occurred. Please try again.',
  ]);

  factory AppException.fromCode(String code) {
    switch (code) {
      case 'email-already-in-use':
        return AppException(
          'The email address is already registered. Please use a different email.',
        );
      case 'invalid-email':
        return AppException(
          'The email address provided is invalid. Please enter a valid email.',
        );
      case 'weak-password':
        return AppException(
          'The password is too weak. Please choose a stronger password.',
        );
      case 'user-disabled':
        return AppException(
          'This user account has been disabled. Please contact support for assistance.',
        );
      case 'user-not-found':
        return AppException('Invalid login details. User not found.');
      case 'wrong-password':
        return AppException(
          'Incorrect password. Please check your password and try again.',
        );
      case 'INVALID_LOGIN_CREDENTIALS':
        return AppException(
          'Invalid login credentials. Please double-check your information.',
        );
      case 'too-many-requests':
        return AppException('Too many requests. Please try again later.');
      case 'invalid-argument':
        return AppException(
          'Invalid argument provided to the authentication method.',
        );
      case 'invalid-password':
        return AppException('Incorrect password. Please try again.');
      case 'invalid-phone-number':
        return AppException('The provided phone number is invalid.');
      case 'operation-not-allowed':
        return AppException(
          'The sign-in provider is disabled for your Firebase project.',
        );
      case 'session-cookie-expired':
        return AppException(
          'The Firebase session cookie has expired. Please sign in again.',
        );
      case 'uid-already-exists':
        return AppException(
          'The provided user ID is already in use by another user.',
        );
      case 'sign_in_failed':
        return AppException('Sign-in failed. Please try again.');
      case 'network-request-failed':
        return AppException(
          'Network request failed. Please check your internet connection.',
        );
      case 'internal-error':
        return AppException('Internal error. Please try again later.');
      case 'invalid-verification-code':
        return AppException(
          'Invalid verification code. Please enter a valid code.',
        );
      case 'invalid-verification-id':
        return AppException(
          'Invalid verification ID. Please request a new verification code.',
        );
      case 'quota-exceeded':
        return AppException('Quota exceeded. Please try again later.');
      default:
        return AppException();
    }
  }
}
