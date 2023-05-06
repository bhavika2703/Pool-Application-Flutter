import 'package:boilerplate/constants/app_utils.dart';
import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/constants/text_style.dart';
import 'package:boilerplate/ui/bottom_navigation.dart';
import 'package:boilerplate/utils/device/device_utils.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:boilerplate/widgets/rounded_button_widget.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16, top: 16),
                    child: RoundedButtonWidget(
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          Routes.alarmView,
                        );
                      },
                      isLoginScreen: true,
                      buttonChildView: Image.asset(Assets.communityBellIconImg,
                          height: 18, width: 18),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(Routes.editPersonalInfo);
                  },
                  child: buildProfileView()),
              buildThreeButtonView(context),
              Neumorphic(
                padding: EdgeInsets.only(top: 18, bottom: 18),
                margin:
                    EdgeInsets.only(left: 16, right: 16, top: 14, bottom: 8),
                style: NeumorphicStyle(
                    color: Colors.transparent,
                    depth: NeumorphicTheme.depth(context),
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(8))),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: buildRowButtonsView(text: '개인정보'),
                    ),
                    buildRowLineView(context),
                    GestureDetector(
                      onTap: () {},
                      child: buildRowButtonsView(text: '개인정보보호 처리방침'),
                    ),
                    buildRowLineView(context),
                    GestureDetector(
                      onTap: () {
                        AppUtils.showAlertDialog(
                            context: context,
                            showCancel: true,
                            optionText1: '취소',
                            optionText2: '확인',
                            desc: '로그아웃 하시겠습니까?');
                      },
                      child: buildRowButtonsView(text: '로그아웃'),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(Routes.withdrawalView);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text('회원탈퇴',
                          style: Styles.caption1SemiBoldTextStyle()),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigation(selectedTab: 3),
      ),
    );
  }

  Column buildProfileView() {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.only(top: 18),
            child: Image.asset(Assets.userAvatarImg, height: 120, width: 120)),
        Text(
          '김연지',
          style: Styles.body1TextStyle(),
        ),
        SizedBox(
          height: 6,
        ),
        Text(
          'dlskdj93@gmail.com',
          style:
              Styles.body2MediumTextStyle().copyWith(color: Color(0xff6D7984)),
        ),
      ],
    );
  }

  Widget buildRowButtonsView({required String text}) {
    return Container(
      margin: EdgeInsets.only(right: 14, left: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: Styles.body2SemiBoldTextStyle()),
          Icon(Icons.arrow_forward_ios, color: Colors.grey.shade500, size: 17),
        ],
      ),
    );
  }

  Neumorphic buildThreeButtonView(BuildContext context) {
    return Neumorphic(
      padding: EdgeInsets.only(top: 18, bottom: 18),
      margin: EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 8),
      style: NeumorphicStyle(
          color: Colors.transparent,
          depth: NeumorphicTheme.depth(context),
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                Routes.myPost,
              );
            },
            child: Column(
              children: [
                Text('내 게시물', style: Styles.cap2SemiBoldTextStyle()),
                Text(
                  '2',
                  style: Styles.body1TextStyle()
                      .copyWith(color: Color(0xff0BA5EC)),
                ),
              ],
            ),
          ),
          buildColumnLineView(context),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                Routes.favouriteSwimmingPool,
              );
            },
            child: Column(
              children: [
                Text('찜한 수영장', style: Styles.cap2SemiBoldTextStyle()),
                Text(
                  '10',
                  style: Styles.body1TextStyle()
                      .copyWith(color: Color(0xff0BA5EC)),
                ),
              ],
            ),
          ),
          buildColumnLineView(context),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                Routes.savePost,
              );
            },
            child: Column(
              children: [
                Text('저장 게시글', style: Styles.cap2SemiBoldTextStyle()),
                Text(
                  '10',
                  style: Styles.body1TextStyle()
                      .copyWith(color: Color(0xff0BA5EC)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Neumorphic buildColumnLineView(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
          color: Colors.transparent,
          depth: NeumorphicTheme.embossDepth(context),
          boxShape: NeumorphicBoxShape.rect()),
      child: Container(height: 40, width: 1),
    );
  }

  Neumorphic buildRowLineView(BuildContext context) {
    return Neumorphic(
      margin: EdgeInsets.only(top: 14, bottom: 14),
      style: NeumorphicStyle(
          color: Colors.transparent,
          depth: NeumorphicTheme.embossDepth(context),
          boxShape: NeumorphicBoxShape.rect()),
      child: Container(height: 2, width: DeviceUtils.getDeviceWidth(context)),
    );
  }
}
