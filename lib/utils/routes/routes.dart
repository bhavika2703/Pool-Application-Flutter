import 'package:boilerplate/ui/findPassword/find_password.dart';
import 'package:boilerplate/ui/findPassword/password_reset.dart';
import 'package:boilerplate/ui/home/home.dart';
import 'package:boilerplate/ui/login/join_membership.dart';
import 'package:boilerplate/ui/login/login.dart';
import 'package:boilerplate/ui/login/login_with_email.dart';
import 'package:boilerplate/ui/login/terms_conditions.dart';
import 'package:boilerplate/ui/splash/splash.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';
  static const String findPassword = '/findPassword';
  static const String passwordReset = '/passwordReset';
  static const String joinMemberShip = '/joinMemberShip';
  static const String agreeTermsConditions = '/agreeTermsConditions';
  static const String loginWithEmail = '/loginWithEmail';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    login: (BuildContext context) => LoginScreen(),
    home: (BuildContext context) => HomeScreen(),
    findPassword: (BuildContext context) => FindPassword(),
    passwordReset: (BuildContext context) => PasswordReset(),
    joinMemberShip: (BuildContext context) => JoinMemberShip(),
    agreeTermsConditions: (BuildContext context) => TermsConditions(),
    loginWithEmail: (BuildContext context) => LoginWithEmail(),
  };
}
