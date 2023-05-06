import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/constants/text_style.dart';
import 'package:boilerplate/widgets/app_theme_button.dart';
import 'package:boilerplate/widgets/custom_app_bar_widget.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ValueNotifier<bool> isValidValue = ValueNotifier(false);
  ValueNotifier<bool> isValidatorOn = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: 12, right: 8, left: 8, bottom: 12),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomAppBar(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  title: '비밀번호 변경하기',
                ),
                _buildInfoView(),
                buildTextFormFieldView(
                  label: '새 비밀번호',
                  hintText: '영문 대소문자,숫자,특수문자 포함 8자리 이상',
                  textInputType: TextInputType.visiblePassword,
                  onChanged: (value) {},
                  controller: newPasswordController,
                  validator: (value) {
                    return passwordValidation(
                        value: value!,
                        errorMsg: '영문 대소문자, 숫자, 특수문자 포함 8자이상으로 만들어주세요',
                        validValueMsg: '안전한 비밀번호입니다.');
                  },
                ),
                buildTextFormFieldView(
                  label: '새 비밀번호 확인',
                  hintText: '비밀번호 재 입력',
                  textInputType: TextInputType.visiblePassword,
                  onChanged: (value) {},
                  controller: confirmPasswordController,
                  validator: (value) {
                    if (confirmPasswordController.text ==
                        newPasswordController.text) {
                      isValidValue.value = true;
                      return '비밀번호가 일치합니다.';
                    } else {
                      isValidValue.value = false;
                      return '비밀번호가 일치하지 않습니다.';
                    }
                  },
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: AppThemeButton(
                      text: '변경하기',
                      onTap: () {
                        submitForm();
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? passwordValidation(
      {required String value,
      required String errorMsg,
      required String validValueMsg}) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

    if (!regex.hasMatch(value)) {
      isValidValue.value = false;
      return errorMsg;
    } else {
      isValidValue.value = true;
      return validValueMsg;
    }
  }

  void submitForm() {
    final FormState formState = _formKey.currentState!;
    if (formState.validate()) {
      print('form is valid');
      formState.save();
    } else {
      print('form is invalid');
    }
  }

  buildTextFormFieldView(
      {required String label,
      required TextEditingController controller,
      required String hintText,
      ValueChanged<String>? onChanged,
      required Function(String? value) validator,
      TextInputType? textInputType}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10),
          child: Text(label, style: Styles.cap2MediumTextStyle()),
        ),
        ValueListenableBuilder<bool>(
          valueListenable: isValidValue,
          builder: (context, validValue, child) {
            return Neumorphic(
              margin: EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 4),
              padding: EdgeInsets.only(bottom: validValue ? 8 : 0),
              style: validValue == true
                  ? NeumorphicStyle(
                      depth: 0,
                      color: Colors.transparent,
                    )
                  : NeumorphicStyle(
                      color: Colors.transparent,
                      depth: NeumorphicTheme.embossDepth(context),
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(8)),
                    ),
              // padding: EdgeInsets.symmetric(vertical: 14, horizontal: 18),
              child: TextFormField(
                onChanged: onChanged,
                validator: (String? value) {
                  return validator(value);
                },
                controller: controller,
                keyboardType: textInputType ?? TextInputType.text,
                cursorColor: Colors.black,
                obscureText: true,
                decoration: InputDecoration(
                  errorStyle: validValue == true
                      ? Styles.errorTextStyle()
                          .copyWith(color: AppColors.themeColor)
                      : Styles.errorTextStyle(),
                  suffix: GestureDetector(
                      onTap: () {
                        _formKey.currentState!.reset();
                        controller.clear();
                        controller.text = '';
                      },
                      child: Image.asset(Assets.roundCloseIcon,
                          height: 16, width: 16)),
                  hintText: hintText,
                  hintStyle: Styles.body2MediumTextStyle(),
                  border: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: AppColors.themeColor,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 0,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: validValue == true
                          ? AppColors.themeColor
                          : Colors.red,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  disabledBorder: OutlineInputBorder(),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: validValue == true
                          ? AppColors.themeColor
                          : Colors.red,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Container _buildInfoView() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(top: 16, left: 8, right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              '유의사항',
              style: Styles.cap2SemiBoldTextStyle(),
            ),
            margin: EdgeInsets.only(top: 10),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              children: [
                _buildDotIcon(),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    '영문 대/소문자, 숫자, 특수 문자를 조합하여 8자이상',
                    style: _infoTextStyle(),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              children: [
                _buildDotIcon(),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      '3자 이상 연속/동일한 문자, 숫자는 사용할 수 없습니다.',
                      style: _infoTextStyle(),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
          color: AppColors.infoBgColor,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          shape: BoxShape.rectangle),
    );
  }

  Icon _buildDotIcon() {
    return Icon(
      Icons.circle,
      color: Color.fromRGBO(109, 121, 132, 1),
      size: 8,
    );
  }

  TextStyle _infoTextStyle() {
    return Styles.caption3MediumTextStyle();
  }
}
