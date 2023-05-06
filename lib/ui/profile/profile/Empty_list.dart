import 'package:boilerplate/constants/text_style.dart';
import 'package:boilerplate/widgets/custom_app_bar_widget.dart';
import 'package:boilerplate/widgets/rounded_button_widget.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../../constants/assets.dart';

class EmptyListView extends StatefulWidget {
  EmptyListView({Key? key, required this.title, this.image, this.isNoPostView})
      : super(key: key);
  final String title;
  final String? image;
  bool? isNoPostView = false;

  @override
  State<EmptyListView> createState() => _EmptyListViewState();
}

class _EmptyListViewState extends State<EmptyListView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: CustomAppBar(
                onPressed: () {
                  Navigator.pop(context);
                },
                title: '내 게시물',
                count: '0',
              ),
            ),
            SizedBox(
              height: 150,
            ),
            if (widget.isNoPostView != null && widget.isNoPostView == true) ...[
              noPostView(),
            ] else ...[
              savePostFavSwmingView(),
            ]
          ],
        ),
      ),
    );
  }

  Column savePostFavSwmingView() {
    return Column(
      children: [
        RoundedButtonWidget(
          onPressed: () {},
          isLoginScreen: true,
          buttonChildView: Image.asset(
              widget.image ?? Assets.communityCopyPostIconImg,
              width: 22,
              height: 22,
              color: Color(0xffB6C6D0)),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text(widget.title,
              style: Styles.subHeadSemiBoldTextStyle()
                  .copyWith(color: Color(0xff8195A0))),
        ),
      ],
    );
  }

  Column noPostView() {
    return Column(
      children: [
        Container(
          child: Text(widget.title,
              style: Styles.subHeadSemiBoldTextStyle()
                  .copyWith(color: Color(0xff8195A0))),
        ),
        SizedBox(height: 8),
        NeumorphicButton(
          style: NeumorphicStyle(
            color: Colors.transparent,
            boxShape: NeumorphicBoxShape.stadium(),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.edit_outlined, color: Color(0xff4A525C), size: 16),
              SizedBox(
                width: 1,
              ),
              Text('작성하러 가기',
                  style: Styles.cap2MediumTextStyle().copyWith(fontSize: 12)),
            ],
          ),
        )
      ],
    );
  }
}
