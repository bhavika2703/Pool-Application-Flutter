import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/constants/text_style.dart';
import 'package:boilerplate/widgets/app_theme_button.dart';
import 'package:boilerplate/widgets/rounded_button_widget.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class TermsConditions extends StatefulWidget {
  const TermsConditions({Key? key}) : super(key: key);

  @override
  State<TermsConditions> createState() => _TermsConditionsState();
}

class _TermsConditionsState extends State<TermsConditions> {
  ValueNotifier<bool> check1 = ValueNotifier<bool>(false);
  ValueNotifier<bool> check2 = ValueNotifier<bool>(false);
  ValueNotifier<bool> check3 = ValueNotifier<bool>(false);
  ValueNotifier<bool> check4 = ValueNotifier<bool>(false);
  ValueNotifier<bool> enableCheckButton = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
      margin: EdgeInsets.only(top: 12, right: 8, left: 8, bottom: 12),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        RoundedButtonWidget(
          onPressed: () {},
          buttonIcon: Icons.arrow_back_ios_new_sharp,
        ),
        Container(
          margin: EdgeInsets.only(top: 20, bottom: 20, left: 6),
          child:
              Text('서비스 이용 약관에 \n 동의해주세요.', style: Styles.heading2TextStyle()),
        ),
        Expanded(child: _buildChecks()),
        ValueListenableBuilder<bool>(
            valueListenable: enableCheckButton,
            builder: (context, bool value, child) {
              return AppThemeButton(
                text: '동의하기',
                backgroundColor: value
                    ? AppColors.themeColor
                    : AppColors.themeColorTransparent,
                onTap: () {},
              );
            }),
      ]),
    )));
  }

  Widget _buildChecks() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 12),
          ValueListenableBuilder<bool>(
            valueListenable: check1,
            builder: (context, check1Value, child) {
              return Neumorphic(
                style: NeumorphicStyle(
                  depth: NeumorphicTheme.depth(context),
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
                ),
                child: Row(
                  children: [
                    checkboxView(check1),
                    Container(
                        padding: EdgeInsets.only(
                            left: 6, right: 6, bottom: 17, top: 17),
                        child: Text(
                          '전체 약관에 동의합니다',
                          style: Styles.body1TextStyle(),
                        )),
                  ],
                ),
              );
            },
          ),
          SizedBox(height: 12),
          ValueListenableBuilder<bool>(
            valueListenable: check2,
            builder: (context, check2Value, child) {
              return Row(
                children: [
                  checkboxView(check2),
                  Expanded(child: checkBoxTextView(text: '서비스 이용약관 동의 (필수)')),
                  Image.asset(Assets.arrowIconImg, width: 12, height: 12),
                ],
              );
            },
          ),
          SizedBox(height: 12),
          ValueListenableBuilder<bool>(
            valueListenable: check3,
            builder: (context, value, child) {
              return Row(
                children: [
                  checkboxView(check3),
                  Expanded(
                      child: checkBoxTextView(text: '개인정보 수집 및 이용 동의 (필수)')),
                  Image.asset(Assets.arrowIconImg, width: 12, height: 12),
                ],
              );
            },
          ),
          SizedBox(height: 12),
          ValueListenableBuilder<bool>(
            valueListenable: check4,
            builder: (context, value, child) {
              return Row(
                children: [
                  checkboxView(check4),
                  Expanded(child: checkBoxTextView(text: '마케팅 정보 수신 동의 (선택)')),
                  Image.asset(Assets.arrowIconImg, width: 12, height: 12),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  bool checkAllCheckBox() {
    if (check1.value == true &&
        check2.value == true &&
        check3.value == true &&
        check4.value == true) {
      print('enableCheckButton${enableCheckButton.value}');
      return enableCheckButton.value = true;
    } else {
      return enableCheckButton.value = false;
    }
  }

  Text checkBoxTextView({required String text}) {
    return Text(
      text,
      style: Styles.body2TextStyle(),
    );
  }

  NeumorphicCheckbox checkboxView(checkBoxValue) {
    return NeumorphicCheckbox(
      value: checkBoxValue.value,
      onChanged: (value) {
        checkBoxValue.value = value;
        checkAllCheckBox();
      },
      padding: EdgeInsets.all(2),
      margin: EdgeInsets.all(8),
      style: NeumorphicCheckboxStyle(),
    );
  }
}
