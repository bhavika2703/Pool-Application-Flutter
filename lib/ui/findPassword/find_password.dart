import 'package:boilerplate/constants/app_utils.dart';
import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:boilerplate/widgets/app_theme_button.dart';
import 'package:boilerplate/widgets/custom_app_bar_widget.dart';
import 'package:boilerplate/widgets/textfield_button_widget_.dart';
import 'package:flutter/material.dart';

class FindPassword extends StatefulWidget {
  const FindPassword({Key? key}) : super(key: key);

  @override
  _FindPasswordState createState() => _FindPasswordState();
}

class _FindPasswordState extends State<FindPassword> {
  ValueNotifier<bool> isEmailTextChanged = ValueNotifier<bool>(false);
  ValueNotifier<bool> isAuthenticationTextChanged = ValueNotifier<bool>(false);
  ValueNotifier<bool> showAuthenticationCode = ValueNotifier<bool>(false);
  ValueNotifier<bool> showAuthenticationComplete = ValueNotifier<bool>(false);
  ValueNotifier<bool> enableCheckButton = ValueNotifier<bool>(false);

  TextEditingController emailController = TextEditingController();
  TextEditingController authenticationController = TextEditingController();

  @override
  void initState() {
    emailController.addListener(() {
      isEmailTextChanged.value = emailController.text.isNotEmpty;
    });

    authenticationController.addListener(() {
      isAuthenticationTextChanged.value =
          authenticationController.text.isNotEmpty;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Column(
            children: [
              CustomAppBar(onPressed: () {}, title: '비밀번호 찾기'),
              _buildEmailField(),
              _buildAuthenticationField(),
              _buildValueEmailAuthenticated(),
              _buildCheckButton()
            ],
          ),
        ),
      ),
    );
  }

  ValueListenableBuilder<bool> _buildCheckButton() {
    return ValueListenableBuilder<bool>(
      valueListenable: enableCheckButton,
      builder: (context, bool value, child) {
        return Expanded(
          child: Container(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: AppThemeButton(
                text: '확인',
                backgroundColor: value
                    ? AppColors.themeColor
                    : AppColors.themeColorTransparent,
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(
                    Routes.passwordReset,
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  ValueListenableBuilder<bool> _buildValueEmailAuthenticated() {
    return ValueListenableBuilder<bool>(
      valueListenable: showAuthenticationComplete,
      builder: (BuildContext context, bool showAuthenticationComplete,
          Widget? child) {
        if (showAuthenticationComplete) {
          return Container(
            margin: EdgeInsets.only(top: 10, left: 10),
            child: Row(
              children: [
                Icon(Icons.check, color: AppColors.themeColor),
                Text(
                  '인증이 완료되었습니다.',
                  style: TextStyle(
                    color: AppColors.themeColor,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          );
        }
        return SizedBox();
      },
    );
  }

  ValueListenableBuilder<bool> _buildAuthenticationField() {
    return ValueListenableBuilder<bool>(
      valueListenable: showAuthenticationCode,
      builder: (BuildContext context, bool showAuthentication, Widget? child) {
        if (showAuthentication) {
          return ValueListenableBuilder(
            valueListenable: isAuthenticationTextChanged,
            builder: (context, bool isValueChanged, child) {
              return Container(
                margin: EdgeInsets.only(top: 10),
                child: CommonTextFieldWithButton(
                  label: '인증코드',
                  hint: '인증코드 입력',
                  onChanged: (value) {},
                  buttonText: '인증확인',
                  onButtonTap: () {
                    authenticateEmail();
                  },
                  textInputType: TextInputType.number,
                  isCheckButtonActive: isValueChanged,
                  controller: authenticationController,
                ),
              );
            },
          );
        } else {
          return SizedBox();
        }
      },
    );
  }

  ValueListenableBuilder<bool> _buildEmailField() {
    return ValueListenableBuilder<bool>(
      valueListenable: isEmailTextChanged,
      builder: (BuildContext context, bool value, Widget? child) {
        return Container(
          margin: EdgeInsets.only(top: 16, bottom: 4),
          child: CommonTextFieldWithButton(
            label: '이메일 주소',
            hint: 'abc@gmail.com',
            onChanged: (value) {},
            buttonText: '인증받기',
            onButtonTap: () {
              validateEmail();
            },
            isCheckButtonActive: value,
            controller: emailController,
          ),
        );
      },
    );
  }

  void validateEmail() {
    AppUtils.showToast(msg: '확인메일을 보냈습니다. 메일 함을 확인해주세요!');
    showAuthenticationCode.value = true;
  }

  void authenticateEmail() {
    isAuthenticationTextChanged.value = false;
    showAuthenticationComplete.value = true;
    enableCheckButton.value = true;
  }
}
