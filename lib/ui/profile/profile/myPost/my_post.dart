import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/constants/text_style.dart';
import 'package:boilerplate/ui/bottom_navigation.dart';
import 'package:boilerplate/ui/profile/profile/Empty_list.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:boilerplate/widgets/custom_app_bar_widget.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class MyPost extends StatefulWidget {
  const MyPost({Key? key}) : super(key: key);

  @override
  State<MyPost> createState() => _MyPostState();
}

class _MyPostState extends State<MyPost> {
  List<String> listTitle = ['아이들 데리고 수영장에 다녀왔어요', '근처에 같이 수영다니실 분 구합니다!'];
  List<String> listSubTitle = [
    '아이들 데리고 과천에 있는 수영장에 다녀왔습니다. 수질도 좋고 무엇보다 아이들이 너무 좋아하네요 다... 더 보기',
    '방배근처에서 같이 수영장 다니실 분 구해요! 아침수영을 다니고 있는데, 동기부여가 안되어서 아침에 일... 더 보기'
  ];

  ValueNotifier<bool> showEmptyView = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ValueListenableBuilder<bool>(
          valueListenable: showEmptyView,
          builder: (context, value, child) {
            return Container(
              child: value == true
                  ? Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: CustomAppBar(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            title: '내 게시물',
                            count: '2',
                          ),
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: 2,
                            itemBuilder: (context, index) {
                              var message = listTitle[index];
                              var subMessage = listSubTitle[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(Routes.myPostDetails);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  child: Neumorphic(
                                    style: NeumorphicStyle(),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: Container(
                                            child: Row(
                                              children: [
                                                Text(message,
                                                    style: Styles
                                                            .body1TextStyle()
                                                        .copyWith(
                                                            color: Color(
                                                                0xff383E45))),
                                                Image.asset(
                                                    Assets.communityMoreIconImg,
                                                    height: 24,
                                                    width: 24),
                                              ],
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                            ),
                                            margin: EdgeInsets.only(bottom: 14),
                                          ),
                                          subtitle: Column(
                                            children: [
                                              if (index == 0) ...[
                                                buildListImageView(),
                                              ],
                                              Text(
                                                subMessage,
                                                style: Styles
                                                        .body2MediumTextStyle()
                                                    .copyWith(
                                                        color:
                                                            Color(0xff212529)),
                                                maxLines: 2,
                                                overflow: TextOverflow.visible,
                                              ),
                                            ],
                                          ),
                                          contentPadding: EdgeInsets.only(
                                              top: 4,
                                              bottom: 8,
                                              left: 10,
                                              right: 10),
                                        ),
                                        Container(
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Image.asset(
                                                Assets.communityCopyPostIconImg,
                                                height: 15,
                                                width: 14,
                                                color: Color(0xffB6C6D0),
                                              ),
                                              SizedBox(width: 3),
                                              Text('25',
                                                  style: Styles
                                                      .caption3MediumTextStyle()),
                                              SizedBox(width: 6),
                                              Image.asset(
                                                Assets
                                                    .communityPostMessageIconImg,
                                                height: 20,
                                                width: 20,
                                              ),
                                              SizedBox(width: 2),
                                              Text('39',
                                                  style: Styles
                                                      .caption3MediumTextStyle()),
                                              Spacer(),
                                              Text('2023.04.01',
                                                  style: Styles
                                                          .cap2MediumTextStyle()
                                                      .copyWith(
                                                          color:
                                                              Color(0xff8195A0),
                                                          fontSize: 12)),
                                            ],
                                          ),
                                          margin: EdgeInsets.only(
                                              bottom: 10,
                                              top: 8,
                                              left: 8,
                                              right: 8),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    )
                  : EmptyListView(
                      title: '작성한 게시물이 없어요.',
                    ),
            );
          },
        ),
        bottomSheet: BottomNavigation(selectedTab: 3),
      ),
    );
  }

  Container buildListImageView() {
    return Container(
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            child: Image.asset(Assets.myPostListImg1),
            width: 140,
            margin: EdgeInsets.only(right: 8),
          ),
          Container(
            child: Image.asset(Assets.myPostListImg2),
            width: 140,
            margin: EdgeInsets.only(right: 8),
          ),
          Container(
            child: Image.asset(Assets.myPostListImg1),
            width: 140,
            margin: EdgeInsets.only(right: 8),
          ),
        ],
      ),
      height: 140,
      margin: EdgeInsets.only(top: 4, bottom: 14),
    );
  }
}
