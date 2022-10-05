import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/cupertino.dart';

class AuthService {
  bool isSignUpComplete = false;
  bool isSignedIn = false;

  Future<void> signUpUser(
      String _username, String _email, String _password) async {
    try {
      final userAttributes = <CognitoUserAttributeKey, String>{
        CognitoUserAttributeKey.email: _email,
        // additional attributes
      };
      final result = await Amplify.Auth.signUp(
        username: _username,
        password: _password,
        options: CognitoSignUpOptions(userAttributes: userAttributes),
      );
      isSignUpComplete = result.isSignUpComplete;
    } on AuthException catch (e) {
      safePrint(e.message);
    }
  }

  Future<void> confirmUser(String _username, String _confirmationCode) async {
    try {
      final result = await Amplify.Auth.confirmSignUp(
          username: _username, confirmationCode: _confirmationCode);

      isSignUpComplete = result.isSignUpComplete;
    } on AuthException catch (e) {
      safePrint(e.message);
    }
  }

  Future<void> signInUser(String username, String password) async {
    try {
      final result = await Amplify.Auth.signIn(
        username: username,
        password: password,
      );

      isSignedIn = result.isSignedIn;
    } on AuthException catch (e) {
      safePrint(e.message);
    }
  }

  Future<void> fetchCurrentUserAttributes() async {
    try {
      final result = await Amplify.Auth.fetchUserAttributes();
      for (final element in result) {
        debugPrint('key: ${element.userAttributeKey}; value: ${element.value}');
      }
    } on AuthException catch (e) {
      debugPrint(e.message);
    }
  }

  Future<void> rememberCurrentDevice() async {
    try {
      await Amplify.Auth.rememberDevice();
      debugPrint('Remember device succeeded');
    } on Exception catch (e) {
      debugPrint('Remember device failed with error: $e');
    }
  }

  Future<void> signOutCurrentUser() async {
    try {
      await Amplify.Auth.signOut();
    } on AuthException catch (e) {
      debugPrint(e.message);
    }
  }
}
