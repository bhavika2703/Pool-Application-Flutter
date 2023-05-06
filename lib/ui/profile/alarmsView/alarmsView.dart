import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/constants/text_style.dart';
import 'package:boilerplate/widgets/custom_app_bar_widget.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class AlarmView extends StatefulWidget {
  const AlarmView({Key? key}) : super(key: key);

  @override
  _AlarmViewState createState() => _AlarmViewState();
}

class _AlarmViewState extends State<AlarmView> {
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
                title: '알림',
              ),
              isDataLoaded ? _buildListView() : _buildEmptyView(context),
            ],
          ),
        ),
      ),
    );
  }

  Expanded _buildEmptyView(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 100),
        child: Column(
          children: [
            NeumorphicButton(
              style: NeumorphicStyle(
                  color: Color(0XFFE1E7EC),
                  depth: NeumorphicTheme.depth(context),
                  boxShape: NeumorphicBoxShape.circle()),
              child: IconButton(
                iconSize: 50,
                icon: Image.asset(Assets.wishlistIcon),
                color: NeumorphicTheme.isUsingDark(context)
                    ? Colors.white70
                    : const Color.fromRGBO(74, 82, 92, 1),
                onPressed: () {},
              ),
            ),
            Text(
              '찜한 수영장이 없어요.',
              style: Styles.subHeadSemiBoldTextStyle(),
            ),
          ],
        ),
      ),
    );
  }

  Expanded _buildListView() {
    return Expanded(
      child: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) {
          return Divider(
            color: AppColors.checkButtonActiveColor,
          );
        },
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.only(
              top: 20,
              bottom: 10,
            ),
            child: ListTile(
              leading: _buildImageView(index),
              title: _buildTitleView(),
              subtitle: _buildSubTitleView(index),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSubTitleView(int index) {
    if (index % 2 == 0) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '‘저도 아이들 데리고 종종 가는 곳이에요! 수질도 깨끗...’',
            style: Styles.cap2SemiBoldTextStyle(),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Text(
              '20시간 전',
              style: Styles.cap2MediumTextStyle(),
            ),
          )
        ],
      );
    }
    return Text(
      '20시간 전',
      style: Styles.cap2MediumTextStyle(),
    );
  }

  Widget _buildTitleView() {
    return Container(
      margin: EdgeInsets.only(bottom: 4),
      child: Text(
        '김진희님이 내 글에 댓글을 달았어요!',
        maxLines: 1,
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

  Widget _buildImageView(int index) {
    return NeumorphicButton(
      padding: EdgeInsets.all(17),
      style: NeumorphicStyle(
          color: Color(0xffECF0F3),
          depth: NeumorphicTheme.embossDepth(context),
          boxShape: NeumorphicBoxShape.circle()),
      child: Image.asset(
          index % 2 == 0
              ? Assets.communityCopyPostIconImg
              : Assets.communityPostMessageIconImg,
          height: index % 2 == 0 ? 16 : 20,
          width: 20,
          color: AppColors.themeColor),
    );
  }

  NeumorphicStyle cardViewStyle() {
    return NeumorphicStyle(
      boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
      depth: 5,
      color: Colors.white,
    );
  }
}
