import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/constants/text_style.dart';
import 'package:boilerplate/widgets/app_theme_button.dart';
import 'package:boilerplate/widgets/custom_app_bar_widget.dart';
import 'package:boilerplate/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class PasswordReset extends StatefulWidget {
  const PasswordReset({Key? key}) : super(key: key);

  @override
  _PasswordResetState createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Scaffold(
        appBar: CustomAppBar(onPressed: () {}, title: '비밀번호 재설정'),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 14),
          child: Column(
            children: [
              _buildInfoView(),
              CommonTextField(
                label: '새 비밀번호',
                hint: '영문 대소문자,숫자,특수문자 포함 8자리 이상',
                onChanged: (value) {},
                controller: newPasswordController,
              ),
              CommonTextField(
                label: '새 비밀번호 확인',
                hint: '비밀번호 재 입력',
                onChanged: (value) {},
                controller: confirmPasswordController,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: AppThemeButton(
                    text: '확인',
                    onTap: () {

                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container _buildInfoView() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
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
                    '영문 대/소문자, 숫자, 특수 문자를 조합하여 8자이상 ',
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
    return TextStyle(
        color: Color.fromRGBO(109, 121, 132, 1),
        fontWeight: FontWeight.w500,
        fontSize: 11);
  }
}
