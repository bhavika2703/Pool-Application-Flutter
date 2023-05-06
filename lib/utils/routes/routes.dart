import 'package:boilerplate/ui/community/community.dart';
import 'package:boilerplate/ui/community/post_detalis.dart';
import 'package:boilerplate/ui/community/post_view.dart';
import 'package:boilerplate/ui/findEmail/find_email.dart';
import 'package:boilerplate/ui/findEmail/find_email_result.dart';
import 'package:boilerplate/ui/findPassword/find_password.dart';
import 'package:boilerplate/ui/findPassword/password_reset.dart';
import 'package:boilerplate/ui/home/calenderView/full_screen_time_table_view.dart';
import 'package:boilerplate/ui/home/calenderView/home.dart';
import 'package:boilerplate/ui/home/detalis/pool_detalis.dart';
import 'package:boilerplate/ui/home/search_file.dart';
import 'package:boilerplate/ui/home/time_table_view.dart';
import 'package:boilerplate/ui/login/join_membership.dart';
import 'package:boilerplate/ui/login/login.dart';
import 'package:boilerplate/ui/login/login_with_email.dart';
import 'package:boilerplate/ui/login/terms_conditions.dart';
import 'package:boilerplate/ui/profile/alarmsView/alarmsView.dart';
import 'package:boilerplate/ui/profile/changeEmail/change_email.dart';
import 'package:boilerplate/ui/profile/changePassword/chnage_password.dart';
import 'package:boilerplate/ui/profile/favouriteSwimmingPool/FavouriteSwimmingPool.dart';
import 'package:boilerplate/ui/profile/profile/edit_personal_info.dart';
import 'package:boilerplate/ui/profile/profile/myPost/my_post.dart';
import 'package:boilerplate/ui/profile/profile/myPost/my_post_detalis.dart';
import 'package:boilerplate/ui/profile/profile/profile.dart';
import 'package:boilerplate/ui/profile/profile/savePost/save_post.dart';
import 'package:boilerplate/ui/profile/profile/savePost/save_post_detalis.dart';
import 'package:boilerplate/ui/profile/withdrawal/withdrawal_view.dart';
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
  static const String findEmail = '/findEmail';
  static const String findEmailResults = '/FindEmailResults';
  static const String calenderBottomResourceView =
      '/calenderBottomResourceView';
  static const String calenderFullScreenResourceView =
      '/calenderFullScreenResourceView';
  static const String searchView = '/SearchView';
  static const String poolDetailView = '/poolDetailView';
  static const String postView = '/PostView';
  static const String community = '/community';
  static const String postDetails = '/postDetails';
  static const String profile = '/profile';
  static const String editPersonalInfo = '/editPersonalInfo';
  static const String changePassword = '/changePassword';
  static const String myPost = '/myPost';
  static const String myPostDetails = '/myPostDetails';
  static const String changeEmail = '/changeEmail';
  static const String favouriteSwimmingPool = '/FavouriteSwimmingPool';
  static const String alarmView = '/AlarmView';
  static const String withdrawalView = '/WithdrawalView';
  static const String savePost = '/savePost';
  static const String saveDetailView = '/saveDetailView';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    login: (BuildContext context) => LoginScreen(),
    home: (BuildContext context) => HomeScreen(),
    findPassword: (BuildContext context) => FindPassword(),
    passwordReset: (BuildContext context) => PasswordReset(),
    joinMemberShip: (BuildContext context) => JoinMemberShip(),
    agreeTermsConditions: (BuildContext context) => TermsConditions(),
    loginWithEmail: (BuildContext context) => LoginWithEmail(),
    findEmail: (BuildContext context) => FindEmail(),
    findEmailResults: (BuildContext context) => FindEmailResults(),
    calenderBottomResourceView: (BuildContext context) => ResourceViewBuilder(
          isFullScreenView: false,
        ),
    calenderFullScreenResourceView: (BuildContext context) =>
        FullScreenTimeTableView(),
    searchView: (BuildContext context) => SearchView(),
    poolDetailView: (BuildContext context) => PoolDetalis(),
    postView: (BuildContext context) => PostView(),
    community: (BuildContext context) => Community(),
    postDetails: (BuildContext context) => PostDetails(),
    profile: (BuildContext context) => ProfileScreen(),
    editPersonalInfo: (BuildContext context) => EditPersonalInfo(),
    changePassword: (BuildContext context) => ChangePassword(),
    myPostDetails: (BuildContext context) => MyPostDetails(),
    myPost: (BuildContext context) => MyPost(),
    changeEmail: (BuildContext context) => ChangeEmail(),
    favouriteSwimmingPool: (BuildContext context) => FavouriteSwimmingPool(),
    alarmView: (BuildContext context) => AlarmView(),
    withdrawalView: (BuildContext context) => WithdrawalView(),
    savePost: (BuildContext context) => SavePost(),
    saveDetailView: (BuildContext context) => SavePostDetails(),
  };
}
