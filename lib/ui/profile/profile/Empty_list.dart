import 'package:boilerplate/constants/text_style.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:boilerplate/widgets/custom_app_bar_widget.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class EmptyListView extends StatefulWidget {
  const EmptyListView({Key? key}) : super(key: key);

  @override
  State<EmptyListView> createState() => _EmptyListViewState();
}

class _EmptyListViewState extends State<EmptyListView> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 6), () {
      Navigator.of(context).pushNamed(
        Routes.myPost,
      );
    });
    // TODO: implement initState
    super.initState();
  }

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
            Container(
              child: Text('작성한 게시물이 없어요.',
                  style: Styles.subHeadSemiBoldTextStyle()
                      .copyWith(color: Color(0xff8195A0))),
            ),
            SizedBox(height: 8),
            NeumorphicButton(
              style: NeumorphicStyle(
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
                      style:
                          Styles.cap2MediumTextStyle().copyWith(fontSize: 12)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
