import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/constants/text_style.dart';
import 'package:boilerplate/ui/profile/profile/Empty_list.dart';
import 'package:boilerplate/widgets/custom_app_bar_widget.dart';
import 'package:boilerplate/widgets/rounded_button_widget.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class FavouriteSwimmingPool extends StatefulWidget {
  const FavouriteSwimmingPool({Key? key}) : super(key: key);

  @override
  _FavouriteSwimmingPoolState createState() => _FavouriteSwimmingPoolState();
}

class _FavouriteSwimmingPoolState extends State<FavouriteSwimmingPool> {
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
                count: '10',
                title: '찜한 수영장 ',
              ),
              isDataLoaded
                  ? _buildListView()
                  : EmptyListView(
                      title: '찜한 수영장이 없어요.',
                      image: Assets.wishlistIcon,
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded _buildListView() {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Neumorphic(
            padding: EdgeInsets.only(
              top: 20,
              bottom: 20,
            ),
            margin: EdgeInsets.only(right: 5, top: 14, bottom: 8),
            style: getStyles(context),
            child: Container(
              child: Row(
                children: [
                  Expanded(
                    child: ListTile(
                      leading: _buildImageView(),
                      title: _buildTitleView(),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              child: Icon(Icons.location_on, size: 15),
                              margin: EdgeInsets.only(right: 5)),
                          Expanded(
                            child: Text(
                              '서울특별시 서초구 사임당로 64 교대벤처타워 1층',
                              style:
                                  Styles.caption3SemiBoldTextStyle().copyWith(
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      right: 5,
                      bottom: 10,
                    ),
                    child: _buildLikeButton(context),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLikeButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: RoundedButtonWidget(
        onPressed: () {},
        buttonColor: AppColors.whiteColor,
        isLoginScreen: true,
        buttonChildView:
            Image.asset(Assets.wishlistIcon, height: 18, width: 18),
      ),
    );
  }

  Widget _buildTitleView() {
    return Container(
      margin: EdgeInsets.only(bottom: 4),
      child: Text(
        '역삼청소년수련관 수영장',
        style: Styles.body2TextStyle(),
      ),
    );
  }

  NeumorphicStyle getStyles(BuildContext context) {
    return NeumorphicStyle(
      color: Color(0xFFECF0F3),
      depth: NeumorphicTheme.depth(context),
      boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
    );
  }

  Container _buildImageView() {
    return Container(
      child: Image.asset(Assets.favouriteSample),
      height: 64,
      width: 64,
    );
  }

  NeumorphicStyle cardViewStyle() {
    return NeumorphicStyle(
      color: Colors.transparent,
      boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
      depth: 5,
    );
  }
}
