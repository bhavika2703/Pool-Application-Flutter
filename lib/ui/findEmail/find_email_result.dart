import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/constants/text_style.dart';
import 'package:boilerplate/widgets/app_theme_button.dart';
import 'package:boilerplate/widgets/custom_app_bar_widget.dart';
import 'package:flutter/material.dart';

class FindEmailResults extends StatefulWidget {
  const FindEmailResults({Key? key}) : super(key: key);

  @override
  _FindEmailResultsState createState() => _FindEmailResultsState();
}

class _FindEmailResultsState extends State<FindEmailResults> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: 12, right: 8, left: 8, bottom: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                title: '회원가입',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Container(
                margin: EdgeInsets.only(top: 45, left: 10, right: 10),
                child: Text(
                  '아이디 확인',
                  style: Styles.heading2TextStyle(),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Text(
                  '고객님 계정(이메일)입니다.',
                  style: Styles.body2SemiBoldTextStyle()
                      .copyWith(color: Color(0xFF383E45)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(Assets.userAvatarImg, width: 65, height: 65),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'dffff23@gmail.com',
                            style: Styles.body2MediumTextStyle().copyWith(
                              color: Color(0xFF212529),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            child: Text(
                              '카카오',
                              style: Styles.body2MediumTextStyle()
                                  .copyWith(color: Color(0xFF6D7984)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: AppThemeButton(
                    text: '확인',
                    onTap: () {},
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
