import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/constants/text_style.dart';
import 'package:boilerplate/widgets/app_theme_button.dart';
import 'package:boilerplate/widgets/custom_check_box.dart';
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
  ValueNotifier<int> isFirstCheckboxCalledDuringBuild = ValueNotifier<int>(0);
  ValueNotifier<int> isSecondCheckboxCalledDuringBuild = ValueNotifier<int>(0);
  ValueNotifier<int> isThirdCheckboxCalledDuringBuild = ValueNotifier<int>(0);
  ValueNotifier<int> isFourthCheckboxCalledDuringBuild = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
      margin: EdgeInsets.only(top: 12, right: 8, left: 8, bottom: 12),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        RoundedButtonWidget(
          onPressed: () {
            Navigator.pop(context);
          },
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
                    ValueListenableBuilder<int>(
                      valueListenable: isFirstCheckboxCalledDuringBuild,
                      builder: (context, int value, child) {
                        return CustomCheckbox(
                          value: value == 0 ? true : check1Value,
                          onChanged: (value) {
                            if (value != 0) {
                              checkAllCheckBox();
                            }
                            print('CheckBoxValue check1 ${check1.value}');
                            isFirstCheckboxCalledDuringBuild.value = 1;
                            check1.value = value;

                          },
                          isEnabled: true,
                          padding: EdgeInsets.all(2),
                          margin: EdgeInsets.all(8),
                          style: CustomCheckboxStyle(),
                        );
                      },
                    ),
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
                  ValueListenableBuilder<int>(
                    valueListenable: isSecondCheckboxCalledDuringBuild,
                    builder: (context, int value, child) {
                      return CustomCheckbox(
                        value: value == 0 ? true : check2Value,
                        onChanged: (value) {
                          if (value != 0) {
                            checkAllCheckBox();
                          }
                          print('CheckBoxValue check2${check2.value}');
                          isSecondCheckboxCalledDuringBuild.value = 1;
                          check2.value = value;

                        },
                        isEnabled: true,
                        padding: EdgeInsets.all(2),
                        margin: EdgeInsets.all(8),
                        style: CustomCheckboxStyle(),
                      );
                    },
                  ),
                  Expanded(child: checkBoxTextView(text: '서비스 이용약관 동의 (필수)')),
                  Image.asset(Assets.arrowIconImg, width: 12, height: 12),
                ],
              );
            },
          ),
          SizedBox(height: 12),
          ValueListenableBuilder<bool>(
            valueListenable: check3,
            builder: (context, check3value, child) {
              return Row(
                children: [
                  ValueListenableBuilder<int>(
                    valueListenable: isThirdCheckboxCalledDuringBuild,
                    builder: (context, int value, child) {
                      return CustomCheckbox(
                        value: value == 0 ? true : check3value,
                        onChanged: (value) {
                          if (value != 0) {
                            checkAllCheckBox();
                          }
                          print('CheckBoxValue check3${check3.value}');
                          isThirdCheckboxCalledDuringBuild.value = 1;
                          check3.value = value;

                        },
                        isEnabled: true,
                        padding: EdgeInsets.all(2),
                        margin: EdgeInsets.all(8),
                        style: CustomCheckboxStyle(),
                      );
                    },
                  ),
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
            builder: (context, check4value, child) {
              return Row(
                children: [
                  ValueListenableBuilder<int>(
                    valueListenable: isFourthCheckboxCalledDuringBuild,
                    builder: (context, int value, child) {
                      return CustomCheckbox(
                        value: value == 0 ? true : check4value,
                        onChanged: (value) {
                          if (value != 0) {
                            checkAllCheckBox();
                          }
                          print('CheckBoxValue check4 ${check4.value}');
                          isFourthCheckboxCalledDuringBuild.value = 1;
                          check4.value = value;

                        },
                        isEnabled: true,
                        padding: EdgeInsets.all(2),
                        margin: EdgeInsets.all(8),
                        style: CustomCheckboxStyle(),
                      );
                    },
                  ),
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
    if (check1.value == false &&
        check2.value == false &&
        check3.value == false &&
        check4.value == false) {
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
}
