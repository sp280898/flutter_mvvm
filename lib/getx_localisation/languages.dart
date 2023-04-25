import 'package:get/get_navigation/src/root/internacionalization.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'hello': 'Hello',
          'internet_exception':
              "We're unable to show results.\nPlease check your data connection.\n😴",
          'general_exception':
              'Sorry! your request is not processed.\nPlease try again',
          'welcome_back': 'Hello!\nWelcome Back',
          'login': 'Enter your email address',
          'password': 'Enter your password',
          'sign_up': "Don't have an account ",
          'email': 'Email'
        },
        'hi_IN': {
          'hello': 'Namaste',
        }
      };
}
