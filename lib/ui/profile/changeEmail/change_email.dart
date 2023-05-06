import 'package:boilerplate/constants/app_utils.dart';
import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/constants/text_style.dart';
import 'package:boilerplate/widgets/app_theme_button.dart';
import 'package:boilerplate/widgets/custom_app_bar_widget.dart';
import 'package:boilerplate/widgets/textfield_button_widget_.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ChangeEmail extends StatefulWidget {
  const ChangeEmail({Key? key}) : super(key: key);

  @override
  _ChangeEmailState createState() => _ChangeEmailState();
}

class _ChangeEmailState extends State<ChangeEmail> {
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
        resizeToAvoidBottomInset: false,
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomAppBar(
                onPressed: () {
                  Navigator.pop(context);
                },
                title: '이메일 변경하기',
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 20),
                child: Text(
                  '새 이메일 주소를 입력하고 인증해주세요.',
                  style: Styles.body2MediumTextStyle()
                      .copyWith(color: Color(0xFF6D7984)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 20),
                child: Text(
                  '가입한 이메일 주소',
                  style: Styles.cap2MediumTextStyle(),
                ),
              ),
              Neumorphic(
                padding: EdgeInsets.only(top: 16, bottom: 16,left: 10,right: 10),
                margin:
                EdgeInsets.only(left: 16, right: 16, top: 14, bottom: 8),
                style: NeumorphicStyle(
                    depth: NeumorphicTheme.depth(context),
                    boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(8))),
                child: Container(child: Row(
                  children: [
                    Expanded(child: Text('dlskdj93@gmail.com',style: Styles.body2MediumTextStyle().copyWith(
                        color: Color(0xFF8195A0)
                    ),),),
                    Icon(Icons.check,size: 20,color: Color(0xFF8195A0),)

                  ],
                )),
              ),
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
            label: '변경할 이메일 주소',
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
