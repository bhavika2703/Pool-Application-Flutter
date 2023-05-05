import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/constants/text_style.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:boilerplate/widgets/app_theme_button.dart';
import 'package:boilerplate/widgets/custom_app_bar_widget.dart';
import 'package:boilerplate/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class LoginWithEmail extends StatefulWidget {
  const LoginWithEmail({Key? key}) : super(key: key);

  @override
  State<LoginWithEmail> createState() => _LoginWithEmailState();
}

class _LoginWithEmailState extends State<LoginWithEmail> {
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  ValueNotifier<bool> enableCheckButton = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
      margin: EdgeInsets.only(top: 12, right: 8, left: 8, bottom: 12),
      child: ValueListenableBuilder<bool>(
        valueListenable: enableCheckButton,
        builder: (context, value, child) {
          return Column(
            children: [
              CustomAppBar(
                onPressed: () {
                  Navigator.of(context).popAndPushNamed(Routes.login);
                },
                title: '이메일로 로그인',
              ),
              CommonTextField(
                  label: '이메일 주소',
                  hint: 'abc@gmail.com',
                  onChanged: (value) {
                    changedBottomColor();
                  },
                  controller: emailAddressController),
              CommonTextField(
                  label: '비밀번호',
                  hint: '영문 대소문자,숫자,특수문자 포함 8자리 이상',
                  onChanged: (value) {
                    changedBottomColor();
                  },
                  isObSecure: true,
                  controller: passwordController),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 20, bottom: 12),
                  child: Text(
                    '비밀번호를 잊으셨나요?',
                    style: Styles.cap2SemiBoldTextStyle(),
                  ),
                ),
              ),
              AppThemeButton(
                text: '로그인',
                backgroundColor: value
                    ? AppColors.themeColor
                    : AppColors.themeColorTransparent,
                onTap: () {
                  clearTextFiledText();
                  Navigator.of(context).pushReplacementNamed(
                    Routes.home,
                  );
                },
              )
            ],
          );
        },
      ),
    )));
  }

  bool changedBottomColor() {
    if (emailAddressController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      return enableCheckButton.value = true;
    } else {
      return enableCheckButton.value = false;
    }
  }

  void clearTextFiledText() {
    emailAddressController.clear();
    passwordController.clear();
  }
}
