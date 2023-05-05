import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/constants/text_style.dart';
import 'package:boilerplate/widgets/rounded_button_widget.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class MyPostDetails extends StatefulWidget {
  const MyPostDetails({Key? key}) : super(key: key);

  @override
  State<MyPostDetails> createState() => _MyPostDetailsState();
}

class _MyPostDetailsState extends State<MyPostDetails> {
  List<String> avtarTitle = ['김진희', '수영러버'];
  List<String> avtarSubTitle = ['fofghh@hanmail.net', 'fodjsi@hanmail.net'];
  List<String> listTitle = ['아이들 데리고 수영장에 다녀왔어요', '근처에 같이 수영다니실 분 구합니다!'];
  List<String> listSubTitle = [
    '아이들 데리고 과천에 있는 수영장에 다녀왔습니다. 수질도 좋고 무엇보다 아이들이 너무 좋아하네요 다... 더 보기',
    '방배근처에서 같이 수영장 다니실 분 구해요! 아침수영을 다니고 있는데, 동기부여가 안되어서 아침에 일... 더 보기'
  ];

  @override
  Widget build(BuildContext context) {
    var message = listTitle[1];
    var subMessage = listSubTitle[1];
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
                child: Column(
                  children: [
                    ListTile(
                      title: Container(
                        child: Text(message,
                            style: Styles.body1TextStyle()
                                .copyWith(color: Color(0xff383E45))),
                        margin: EdgeInsets.only(bottom: 14),
                      ),
                      subtitle: Column(
                        children: [
                          buildListImageView(),
                          Text(
                            subMessage,
                            style: Styles.body2MediumTextStyle()
                                .copyWith(color: Color(0xff212529)),
                            maxLines: 2,
                            overflow: TextOverflow.visible,
                          ),
                        ],
                      ),
                      contentPadding: EdgeInsets.only(
                          top: 4, bottom: 8, left: 10, right: 10),
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
                          ),
                          SizedBox(width: 3),
                          Text('25',
                              style: Styles.caption3MediumTextStyle()
                                  .copyWith(color: Color(0xff0BA5EC))),
                          SizedBox(width: 6),
                          Image.asset(
                            Assets.communityPostMessageIconImg,
                            height: 20,
                            width: 20,
                          ),
                          SizedBox(width: 2),
                          Text('39', style: Styles.caption3MediumTextStyle()),
                          Spacer(),
                          Text('2023.04.03',
                              style: Styles.cap2MediumTextStyle().copyWith(
                                  color: Color(0xff8195A0), fontSize: 12)),
                        ],
                      ),
                      margin: EdgeInsets.only(
                          bottom: 10, top: 8, left: 8, right: 8),
                    ),
                    Divider(
                      color: Color(0xFFECF0F3),
                      height: 1,
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 5, top: 10),
                        child: ListView.builder(
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            var message = listTitle[index];
                            var subMessage = listSubTitle[index];
                            return Container(
                              padding: EdgeInsets.all(4),
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Container(
                                      child: Text(message,
                                          style: Styles.body1TextStyle()
                                              .copyWith(
                                                  color: Color(0xff383E45))),
                                      margin: EdgeInsets.only(bottom: 14),
                                    ),
                                    subtitle: Column(
                                      children: [
                                        Text(
                                          subMessage,
                                          style: Styles.body2MediumTextStyle()
                                              .copyWith(
                                                  color: Color(0xff212529)),
                                          maxLines: 2,
                                          overflow: TextOverflow.visible,
                                        ),
                                      ],
                                    ),
                                    contentPadding: EdgeInsets.only(
                                        top: 4, bottom: 8, left: 10, right: 10),
                                  ),
                                  Container(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          Assets.likePostIconImg,
                                          height: 15,
                                          width: 15,
                                        ),
                                        SizedBox(width: 3),
                                        Text('12',
                                            style:
                                                Styles.caption3MediumTextStyle()
                                                    .copyWith(
                                                        color:
                                                            Color(0xff0BA5EC))),
                                        SizedBox(width: 5),
                                        Text('댓글달기',
                                            style:
                                                Styles.caption3MediumTextStyle()
                                                    .copyWith(
                                                        color:
                                                            Color(0xff8195A0))),
                                      ],
                                    ),
                                    margin: EdgeInsets.only(
                                        bottom: 10, top: 8, left: 8, right: 8),
                                  ),
                                  SizedBox(
                                    height: 180,
                                    child: ListView.builder(
                                      itemCount: 1,
                                      itemBuilder: (context, index) {
                                        var profileTitle = avtarTitle[index];
                                        var message = listTitle[index];
                                        var subMessage = listSubTitle[index];
                                        return Container(
                                          padding: EdgeInsets.all(4),
                                          margin:
                                              EdgeInsets.only(left: 30, top: 5),
                                          child: Column(
                                            children: [
                                              ListTile(
                                                title: Container(
                                                  child: Text(message,
                                                      style: Styles
                                                              .body1TextStyle()
                                                          .copyWith(
                                                              color: Color(
                                                                  0xff383E45))),
                                                  margin: EdgeInsets.only(
                                                      bottom: 14),
                                                ),
                                                subtitle: Column(
                                                  children: [
                                                    Text(
                                                      subMessage,
                                                      style: Styles
                                                              .body2MediumTextStyle()
                                                          .copyWith(
                                                              color: Color(
                                                                  0xff212529)),
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.visible,
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
                                                      Assets.likePostIconImg,
                                                      height: 15,
                                                      width: 15,
                                                    ),
                                                    SizedBox(width: 3),
                                                    Text('12',
                                                        style: Styles
                                                                .caption3MediumTextStyle()
                                                            .copyWith(
                                                                color: Color(
                                                                    0xff0BA5EC))),
                                                    SizedBox(width: 5),
                                                    Text('댓글달기',
                                                        style: Styles
                                                                .caption3MediumTextStyle()
                                                            .copyWith(
                                                                color: Color(
                                                                    0xff8195A0))),
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

  Container buildListImageView() {
    return Container(
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            child: Image.asset(Assets.communityListImg1IconImg),
            width: 140,
            margin: EdgeInsets.only(right: 8),
          ),
          Container(
            child: Image.asset(Assets.communityListImg2IconImg),
            width: 140,
            margin: EdgeInsets.only(right: 8),
          ),
          Container(
            child: Image.asset(Assets.communityListImg1IconImg),
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
