import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/constants/text_style.dart';
import 'package:boilerplate/utils/device/device_utils.dart';
import 'package:boilerplate/widgets/rounded_button_widget.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class MyPostDetails extends StatefulWidget {
  const MyPostDetails({Key? key}) : super(key: key);

  @override
  State<MyPostDetails> createState() => _MyPostDetailsState();
}

class _MyPostDetailsState extends State<MyPostDetails> {
  List<String> avtarImage = [
    Assets.communityAvtar1IconImg,
    Assets.communityAvtar2IconImg,
  ];
  List<String> avtarTitle = ['김진희', '수영러버'];
  List<String> avtarSubTitle = ['fofghh@hanmail.net', 'fodjsi@hanmail.net'];
  List<String> listTitle = [
    '아이들 데리고 수영장에 다녀왔어요',
  ];
  List<String> listSubTitle = [
    '아이들 데리고 과천에 있는 수영장에 다녀왔습니다. 수질도 좋고 무엇보다 아이들이 너무 좋아하네요 다시한번 더 가고싶을 정도로 너무 좋았던 곳이었습니다~~ 정말 추천드려요!!',
    '저도 아이들 데리고 종종 가는 곳이에요! 수질도 깨끗하고 정말 좋았던 기억이 나네요~!! 언제한번 같이 애 데리고 정모한번 가졌으면 좋겠네요~~'
  ];

  @override
  Widget build(BuildContext context) {
    var profileImage = avtarImage[0];
    var message = listTitle[0];
    var subMessage = listSubTitle[0];
    return SafeArea(
      child: Scaffold(
          body: Container(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12, left: 12, bottom: 6),
                  child: RoundedButtonWidget(
                      onPressed: () {
                            Navigator.pop(context);
                          },
                          buttonIcon: Icons.arrow_back_ios_new_rounded,
                          size: 16),
                    ),
                  ],
                ),
                SizedBox(
                  height: 18,
                ),
                Expanded(
                  child: Neumorphic(
                style: NeumorphicStyle(
                  depth: 0,
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(message,
                                style: Styles.body1TextStyle()
                                    .copyWith(color: Color(0xff383E45))),
                            moreIconImg(),
                          ],
                            ),
                            margin: EdgeInsets.only(bottom: 14),
                          ),
                          subtitle: Column(
                            children: [
                              buildListImageView(),
                          Text(
                            subMessage,
                            style: Styles.body2MediumTextStyle()
                                .copyWith(color: Color(0xff212529)),
                            maxLines: 4,
                            overflow: TextOverflow.visible,
                          ),
                        ],
                      ),
                      contentPadding: EdgeInsets.only(
                          top: 6, bottom: 8, left: 10, right: 10),
                    ),
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                Assets.communityCopyPostIconImg,
                                height: 15,
                                width: 14,
                                color: Color(0xffB6C6D0),
                              ),
                              SizedBox(width: 3),
                              Text('25', style: Styles.caption3MediumTextStyle()),
                              SizedBox(width: 6),
                              Image.asset(
                                Assets.communityPostMessageIconImg,
                                height: 20,
                                width: 20,
                              ),
                              SizedBox(width: 2),
                          Text('39', style: Styles.caption3MediumTextStyle()),
                          Spacer(),
                          Text('2023.04.01',
                              style: Styles.cap2MediumTextStyle().copyWith(
                                  color: Color(0xff8195A0), fontSize: 12)),
                        ],
                      ),
                      margin: EdgeInsets.only(
                          bottom: 10, top: 8, left: 8, right: 8),
                    ),
                    buildLineView(context),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 5, top: 8),
                        child: ListView.builder(
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.all(4),
                              child: Column(
                                children: [
                                  ListTile(
                                    title: replayListTitle(),
                                    leading: CircleAvatar(
                                      child: Image.asset(profileImage),
                                      radius: 18,
                                    ),
                                    subtitle: replayListSubTitle(),
                                    contentPadding: EdgeInsets.only(
                                        top: 4, bottom: 4, left: 10, right: 10),
                                  ),
                                      SizedBox(
                                        height: 180,
                                        child: ListView.builder(
                                          itemCount: 1,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              padding: EdgeInsets.all(4),
                                              margin:
                                              EdgeInsets.only(left: 30, top: 5),
                                              child: Column(
                                                children: [
                                                  ListTile(
                                                title: Row(
                                                  children: [
                                                    SizedBox(height: 10),
                                                    Text('김진희',
                                                        style: Styles
                                                                .body1TextStyle()
                                                            .copyWith(
                                                                color: Color(
                                                                    0xff383E45))),
                                                    Spacer(),
                                                    Text('2021.12.05',
                                                        style: Styles.cap2MediumTextStyle()
                                                            .copyWith(
                                                                color: Color(
                                                                    0xff8195A0),
                                                                fontSize: 12)),
                                                    moreIconImg(),
                                                  ],
                                                ),
                                                subtitle: Column(
                                                  children: [
                                                    SizedBox(height: 4),
                                                    Text(
                                                      '오! 반갑습니다! 다음에 꼭 봬요!',
                                                      style: Styles
                                                              .body2MediumTextStyle()
                                                          .copyWith(
                                                              color: Color(
                                                                  0xff212529)),
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.visible,
                                                    ),
                                                    SizedBox(height: 4),
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Image.asset(
                                                          Assets
                                                              .likePostIconImg,
                                                          height: 15,
                                                          width: 15,
                                                          color:
                                                              Color(0xffB6C6D0),
                                                        ),
                                                        SizedBox(width: 3),
                                                        Text('12',
                                                            style: Styles
                                                                    .caption3MediumTextStyle()
                                                                .copyWith(
                                                              color: Color(
                                                                  0xffB6C6D0),
                                                            )),
                                                        SizedBox(width: 5),
                                                        Text('댓글달기',
                                                            style: Styles
                                                                    .caption3MediumTextStyle()
                                                                .copyWith(
                                                                    color: Color(
                                                                        0xff8195A0))),
                                                      ],
                                                    ),
                                                  ],
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                ),
                                                leading: CircleAvatar(
                                                  child: Image.asset(
                                                    Assets
                                                        .communityAvtar3IconImg,
                                                  ),
                                                  radius: 18,
                                                ),
                                              ),
                                            ],
                                              ),
                                            );
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }

  Column replayListSubTitle() {
    return Column(
      children: [
        Text(
          listSubTitle[1],
          style:
              Styles.body2MediumTextStyle().copyWith(color: Color(0xff212529)),
          maxLines: 3,
          overflow: TextOverflow.visible,
        ),
        Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                Assets.likePostIconImg,
                height: 15,
                width: 15,
                color: Color(0xffB6C6D0),
              ),
              SizedBox(width: 1),
              Text('12',
                  style: Styles.caption3MediumTextStyle().copyWith(
                    color: Color(0xffB6C6D0),
                  )),
              SizedBox(width: 5),
              Text('댓글달기',
                  style: Styles.caption3MediumTextStyle()
                      .copyWith(color: Color(0xff8195A0))),
            ],
          ),
          margin: EdgeInsets.only(bottom: 10, top: 8, left: 8, right: 8),
        ),
      ],
    );
  }

  Container replayListTitle() {
    return Container(
      child: Row(
        children: [
          Text('김진희',
              style:
                  Styles.body1TextStyle().copyWith(color: Color(0xff383E45))),
          Spacer(),
          Text('2021.12.05',
              style: Styles.cap2MediumTextStyle()
                  .copyWith(color: Color(0xff8195A0), fontSize: 12)),
          moreIconImg(),
        ],
      ),
      margin: EdgeInsets.only(bottom: 14),
    );
  }

  Padding moreIconImg() {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Image.asset(Assets.communityMoreIconImg, height: 24, width: 24),
    );
  }

  Container buildLineView(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8, top: 8),
      padding: EdgeInsets.zero,
      child: Neumorphic(
        padding: EdgeInsets.zero,
        style: NeumorphicStyle(
            depth: NeumorphicTheme.depth(context),
            boxShape: NeumorphicBoxShape.rect()),
        child: Container(
            margin: EdgeInsets.only(top: 2, bottom: 2),
            height: 0.1,
            width: DeviceUtils.getDeviceWidth(context)),
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
