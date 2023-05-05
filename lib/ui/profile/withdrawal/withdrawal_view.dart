import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/constants/text_style.dart';
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
            ],
          ),
        ),
      ),
    );
  }

  Expanded _buildWithdrawalView(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 100),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  iconSize: 35,
                  icon: Image.asset(
                      Assets.infoIcon,
                      color: AppColors.themeColor),
                  color: AppColors.themeColor,
                  onPressed: () {},
                )
              ],
            ),
            Text(
              '프로필 및 작성한 게시물들이 모두 사라지게 되며,더 이상 해당 계정으로 활동할 수 없게 됩니다.',
              style: Styles.body2MediumTextStyle(),
            ),
            Text(
              '한번 삭제한 계정은 다시 복구가 불가능합니다.',
              style: Styles.body2MediumTextStyle(),
            ),
          ],
        ),
      ),
    );
  }






}
