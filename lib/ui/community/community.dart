import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/constants/text_style.dart';
import 'package:boilerplate/widgets/rounded_button_widget.dart';
import 'package:boilerplate/widgets/search_text_field.dart';
import 'package:flutter/material.dart';

class Community extends StatefulWidget {
  const Community({Key? key}) : super(key: key);

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 12, bottom: 12, left: 8, right: 8),
        child: Column(
          children: [
            buildHeaderView(),
            SizedBox(height: 10),
            SearchTextField(
              onChanged: (value) {},
              controller: searchController,
              hint: '검색해보세요',
              leadingIcon:
                  Image.asset(Assets.searchIconImg, width: 15, height: 16),
            ),
          ],
        ),
      ),
    ));
  }

  Row buildHeaderView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Spacer(),
        Text('커뮤니티',
            style: Styles.subHeadSemiBoldTextStyle(),
            textAlign: TextAlign.center),
        Spacer(),
        RoundedButtonWidget(
          onPressed: () {},
          isLoginScreen: true,
          buttonChildView: Image.asset(Assets.communityLocationIconImg,
              height: 16, width: 16),
        ),
        SizedBox(
          width: 12,
        ),
        RoundedButtonWidget(
          onPressed: () {},
          isLoginScreen: true,
          buttonChildView:
              Image.asset(Assets.communityBellIconImg, height: 16, width: 16),
        )
      ],
    );
  }
}
