import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/constants/text_style.dart';
import 'package:boilerplate/utils/device/device_utils.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../../widgets/custom_app_bar_widget.dart';

class EditPersonalInfo extends StatefulWidget {
  const EditPersonalInfo({Key? key}) : super(key: key);

  @override
  State<EditPersonalInfo> createState() => _EditPersonalInfoState();
}

class _EditPersonalInfoState extends State<EditPersonalInfo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: CustomAppBar(
                title: '개인정보 수정',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            buildHeaderTextView(title: '계정 정보'),
            buildNeumorPhicWidget(
                context: context,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: buildAccountInfoRowButtonsView(
                          text: '개인정보', trailingText: 'dlskdj93@gmail.com'),
                    ),
                    buildRowLineView(context),
                    GestureDetector(
                      onTap: () {},
                      child: buildAccountInfoRowButtonsView(
                          text: '개인정보보호 처리방침', trailingText: '변경하기'),
                    ),
                  ],
                )),
            buildHeaderTextView(title: '사용자 정보'),
            buildNeumorPhicWidget(
                context: context,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: buildUserInformationRowButtonsView(
                          text: '이름', trailingText: '김연지'),
                    ),
                    buildRowLineView(context),
                    GestureDetector(
                        onTap: () {},
                        child: buildUserInformationRowButtonsView(
                            text: '성별', trailingText: '여자')),
                    buildRowLineView(context),
                    GestureDetector(
                        onTap: () {},
                        child: buildUserInformationRowButtonsView(
                            text: '생년월일', trailingText: '1991. 06. 12')),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Neumorphic buildNeumorPhicWidget(
      {required BuildContext context, required Widget child}) {
    return Neumorphic(
      padding: EdgeInsets.only(top: 18, bottom: 18),
      margin: EdgeInsets.only(left: 16, right: 16, top: 14, bottom: 8),
      style: NeumorphicStyle(
          depth: NeumorphicTheme.depth(context),
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8))),
      child: child,
    );
  }

  Container buildHeaderTextView({required String title}) {
    return Container(
        margin: EdgeInsets.only(left: 16, top: 16),
        child: Text(title,
            style: Styles.cap2MediumTextStyle().copyWith(
                color: AppColors.darkGrey, fontWeight: FontWeight.w600)),
        alignment: Alignment.centerLeft);
  }

  Neumorphic buildRowLineView(BuildContext context) {
    return Neumorphic(
      margin: EdgeInsets.only(top: 14, bottom: 14),
      style: NeumorphicStyle(
          depth: NeumorphicTheme.embossDepth(context),
          boxShape: NeumorphicBoxShape.rect()),
      child: Container(height: 2, width: DeviceUtils.getDeviceWidth(context)),
    );
  }

  Widget buildAccountInfoRowButtonsView(
      {required String text, required String trailingText}) {
    return Container(
      margin: EdgeInsets.only(right: 14, left: 18),
      child: Row(
        children: [
          Text(text,
              style: Styles.body2MediumTextStyle()
                  .copyWith(color: Color(0xff6D7984))),
          Spacer(),
          Text(trailingText,
              style: Styles.body2MediumTextStyle()
                  .copyWith(color: Color(0xff383E45))),
          Icon(Icons.arrow_forward_ios, color: Colors.grey.shade500, size: 17),
        ],
      ),
    );
  }

  Widget buildUserInformationRowButtonsView(
      {required String text, required String trailingText}) {
    return Container(
      margin: EdgeInsets.only(right: 14, left: 18),
      child: Row(
        children: [
          Text(text,
              style: Styles.body2MediumTextStyle()
                  .copyWith(color: Color(0xff6D7984))),
          Spacer(),
          Text(trailingText,
              style: Styles.body2MediumTextStyle()
                  .copyWith(color: Color(0xff383E45))),
        ],
      ),
    );
  }
}
