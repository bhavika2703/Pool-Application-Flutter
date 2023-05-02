import 'package:another_flushbar/flushbar_helper.dart';
import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/constants/text_style.dart';
import 'package:boilerplate/data/sharedpref/constants/preferences.dart';
import 'package:boilerplate/stores/theme/theme_store.dart';
import 'package:boilerplate/utils/device/device_utils.dart';
import 'package:boilerplate/utils/locale/app_localization.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:boilerplate/widgets/app_icon_widget.dart';
import 'package:boilerplate/widgets/app_theme_button.dart';
import 'package:boilerplate/widgets/custom_app_bar_widget.dart';
import 'package:boilerplate/widgets/rounded_button_widget.dart';
import 'package:boilerplate/widgets/textfield_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //text controllers:-----------------------------------------------------------
  TextEditingController _userEmailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  //stores:---------------------------------------------------------------------
  late ThemeStore _themeStore;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _themeStore = Provider.of<ThemeStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 14, right: 14, top: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppIconWidget(image: Assets.appLogo),
              buildTitleView(context),
              buildRowImageIconView(),
              SizedBox(height: 25),
              buildBottomButtonView(title: "이메일로 로그인"),
              SizedBox(height: 16),
              buildBottomButtonView(title: "회원가입", isMembershipButton: true),
              SizedBox(height: 20),
              bottomTextView(),
            ],
          ),
        ),
      ),
    );
  }

  Row bottomTextView() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        findIdPwdText(text: '아이디찾기'),
        Neumorphic(
          margin: EdgeInsets.only(right: 6, left: 6),
          child: Container(
            height: 12,
            width: 1,
            color: Color(0xffECF0F3),
          ),
        ),
        findIdPwdText(text: '비밀번호 찾기'),
      ],
    );
  }

  Padding findIdPwdText({required String text}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: Styles.body2SemiBoldTextStyle(),
      ),
    );
  }

  Row buildBottomButtonView(
      {required String title, bool isMembershipButton = false}) {
    return Row(
      children: [
        Expanded(
          child: NeumorphicButton(
            style: NeumorphicStyle(
              shape: NeumorphicShape.flat,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
            ),
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 18),
            margin: EdgeInsets.only(right: 30, left: 30),
            child: isMembershipButton
                ? Center(child: buildButtonTextView(title))
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(Assets.inboxIconImg, width: 16, height: 16),
                      SizedBox(
                        width: 4,
                      ),
                      buildButtonTextView(title),
                    ],
                  ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  Text buildButtonTextView(String title) {
    return Text(
      title,
      style: Styles.body2TextStyle(),
    );
  }

  Widget buildTitleView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildNeumorphicLineWidget(context),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Text('간편로그인', style: Styles.body1TextStyle()),
          ),
          buildNeumorphicLineWidget(context),
        ],
      ),
    );
  }

  Widget buildNeumorphicLineWidget(
    BuildContext context,
  ) {
    return Neumorphic(
      margin: EdgeInsets.only(right: 6, left: 6),
      child: Container(
        height: 1.5,
        width: DeviceUtils.getDeviceWidth(context) / 3.5,
        color: Color(0xffECF0F3),
      ),
    );
  }

  Row buildRowImageIconView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        RoundedButtonWidget(
          onPressed: () {},
          isLoginScreen: true,
          buttonChildView:
              Image.asset(Assets.messageIconImg, width: 20, height: 20),
        ),
        RoundedButtonWidget(
          onPressed: () {},
          isLoginScreen: true,
          buttonChildView:
              Image.asset(Assets.letterNIconImg, width: 18, height: 19),
        ),
        RoundedButtonWidget(
          onPressed: () {},
          isLoginScreen: true,
          buttonChildView:
              Image.asset(Assets.facebookIconImg, width: 24, height: 23),
        ),
        RoundedButtonWidget(
          onPressed: () {},
          isLoginScreen: true,
          buttonChildView:
              Image.asset(Assets.appleIconImg, width: 20, height: 22),
        ),
        RoundedButtonWidget(
          onPressed: () {},
          isLoginScreen: true,
          buttonChildView:
              Image.asset(Assets.googleIconImg, width: 19, height: 19),
        ),
      ],
    );
  }

  // body methods:--------------------------------------------------------------
  /*Widget _buildBody() {
    return Material(
      child: Stack(
        children: <Widget>[
          MediaQuery.of(context).orientation == Orientation.landscape
              ? Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: _buildLeftSide(),
                    ),
                    Expanded(
                      flex: 1,
                      child: _buildRightSide(),
                    ),
                  ],
                )
              : Center(child: _buildRightSide()),
          Observer(
            builder: (context) {
              return _store.success
                  ? navigate(context)
                  : _showErrorMessage(_store.errorStore.errorMessage);
            },
          ),
          Observer(
            builder: (context) {
              return Visibility(
                visible: _store.loading,
                child: CustomProgressIndicatorWidget(),
              );
            },
          )
        ],
      ),
    );
  }*/

  Widget _buildLeftSide() {
    return SizedBox.expand(
      child: Image.asset(
        Assets.carBackground,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildRightSide() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomAppBar(
              onPressed: () {},
              title: '날짜 선택',
            ),
            // RoundedButtonWidget(onPressed: () {},buttonIcon: Icons.arrow_back_ios_new_rounded,),
            AppIconWidget(image: 'assets/icons/ic_app_icon.png'),
            SizedBox(height: 10.0),
            Text('간편로그인', style: Styles.body1TextStyle()),
            _buildUserIdField(),
            //_buildPasswordField(),
            CommonTextField(
              label: '이메일 주소',
              hint: '비밀번호 재 입력',
              controller: _passwordController,
              onChanged: (value) {},
            ),
            AppThemeButton(
              text: '확인',
              onTap: () {},
            )
            // _buildSignInButton()
          ],
        ),
      ),
    );
  }

  Widget _buildUserIdField() {
    return Observer(
      builder: (context) {
        var _controller;
        return Neumorphic(
          margin: EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 4),
          style: NeumorphicStyle(
            depth: NeumorphicTheme.embossDepth(context),
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
          ),
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 19),
          child: TextFormField(
            onChanged: (value) {},
            controller: _controller,
            decoration: InputDecoration.collapsed(
                hintText: 'Login', hintStyle: Styles.body2MediumTextStyle()),
          ),
        );
      },
    );
  }

  NeumorphicButton buildNeumorphicRoundButton(BuildContext context) {
    return NeumorphicButton(
      margin: const EdgeInsets.only(top: 8, bottom: 6),
      padding: const EdgeInsets.all(12),
      style: const NeumorphicStyle(
        boxShape: NeumorphicBoxShape.circle(),
        shape: NeumorphicShape.concave,
        depth: 12,
      ),
      child: buildBackIcon(context),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  Icon buildBackIcon(BuildContext context) {
    return Icon(
      Icons.arrow_back_ios_new_outlined,
      size: 20,
      color: NeumorphicTheme.isUsingDark(context)
          ? Colors.white70
          : const Color.fromRGBO(74, 82, 92, 1),
    );
  }

  /*Widget _buildPasswordField() {
    return Observer(
      builder: (context) {
        return TextField(
          hint:
              AppLocalizations.of(context).translate('login_et_user_password'),
          isObscure: true,
          padding: EdgeInsets.only(top: 16.0),
          icon: Icons.lock,
          iconColor: _themeStore.darkMode ? Colors.white70 : Colors.black54,
          textController: _passwordController,
          focusNode: _passwordFocusNode,
          errorText: _store.formErrorStore.password,
          onChanged: (value) {
            _store.setPassword(_passwordController.text);
          },
        );
      },
    );
  }*/

  Widget _buildForgotPasswordButton() {
    return Align(
      alignment: FractionalOffset.centerRight,
      child: TextButton(
        // padding: EdgeInsets.all(0.0),
        child: Text(
          AppLocalizations.of(context).translate('login_btn_forgot_password'),
          style: Theme.of(context)
              .textTheme
              .caption
              ?.copyWith(color: Colors.orangeAccent),
        ),
        onPressed: () {},
      ),
    );
  }

  Widget _buildSignInButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: NeumorphicButton(
        onPressed: () {},
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Text(
          "Sign Up",
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
      ),
    );
  }

  Widget navigate(BuildContext context) {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool(Preferences.is_logged_in, true);
    });

    Future.delayed(Duration(milliseconds: 0), () {
      Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.home, (Route<dynamic> route) => false);
    });

    return Container();
  }

  // General Methods:-----------------------------------------------------------
  _showErrorMessage(String message) {
    if (message.isNotEmpty) {
      Future.delayed(Duration(milliseconds: 0), () {
        if (message.isNotEmpty) {
          FlushbarHelper.createError(
            message: message,
            title: AppLocalizations.of(context).translate('home_tv_error'),
            duration: Duration(seconds: 3),
          )..show(context);
        }
      });
    }

    return SizedBox.shrink();
  }

  // dispose:-------------------------------------------------------------------
  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    _userEmailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
