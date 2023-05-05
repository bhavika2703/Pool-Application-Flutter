import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/constants/text_style.dart';
import 'package:boilerplate/widgets/app_theme_button.dart';
import 'package:boilerplate/widgets/custom_app_bar_widget.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class WithdrawalView extends StatefulWidget {
  const WithdrawalView({Key? key}) : super(key: key);

  @override
  _WithdrawalViewState createState() => _WithdrawalViewState();
}

class _WithdrawalViewState extends State<WithdrawalView> {
  bool isDataLoaded = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Column(
            children: [
              CustomAppBar(
                onPressed: () {
                  Navigator.pop(context);
                },
                title: '회원탈퇴',
              ),
              _buildWithdrawalView(context),
              _buildButtonView()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWithdrawalView(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                iconSize: 35,
                icon: Image.asset(Assets.infoIcon, color: AppColors.themeColor),
                color: AppColors.themeColor,
                onPressed: () {},
              ),
              Expanded(
                child: Text(
                  '탈퇴전에 확인해주세요!',
                  style: Styles.heading2TextStyle(),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 15),
            child: Text(
              '프로필 및 작성한 게시물들이 모두 사라지게 되며,더 이상 해당 계정으로 활동할 수 없게 됩니다.',
              style: Styles.body2MediumTextStyle()
                  .copyWith(color: Color(0xFF383E45)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 15),
            child: Text(
              '한번 삭제한 계정은 다시 복구가 불가능합니다.',
              style: Styles.body2MediumTextStyle()
                  .copyWith(color: Color(0xFF383E45)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonView() {
    return Expanded(
        child: Align(
      alignment: Alignment.bottomCenter,
      child: AppThemeButton(
        text: '탈퇴하기',
        onTap: () {},
      ),
    ));
  }
}
