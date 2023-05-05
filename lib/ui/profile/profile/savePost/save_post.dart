import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/constants/text_style.dart';
import 'package:boilerplate/ui/bottom_navigation.dart';
import 'package:boilerplate/ui/profile/profile/Empty_list.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:boilerplate/widgets/custom_app_bar_widget.dart';
import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class SavePost extends StatefulWidget {
  const SavePost({Key? key}) : super(key: key);

  @override
  State<SavePost> createState() => _SavePostState();
}

class _SavePostState extends State<SavePost> {
  TextEditingController searchController = TextEditingController();
  List<String> avtarImage = [
    Assets.communityAvtar1IconImg,
    Assets.communityAvtar2IconImg
  ];
  List<String> avtarTitle = ['김진희', '수영러버'];
  List<String> avtarSubTitle = ['fofghh@hanmail.net', 'fodjsi@hanmail.net'];
  List<String> listTitle = ['근처에 같이 수영다니실 분 구합니다!', '안녕하세요! 수영 4주차 초보자입니다'];
  List<String> listSubTitle = [
    '방배근처에서 같이 수영장 다니실 분 구해요! 아침수영을 다니고 있는데, 동기부여가 안되어서 아침에 일... 더 보기',
    '이제 어린이풀에서 25m 초보반으로 넘어왔습니다 :) \n거북이등 없이 25m 하려니 힘드네요 현재 자유... 더 보기'
  ];
  GlobalKey<ExpandableBottomSheetState> key = new GlobalKey();

  bool isDataEmpty = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 12, bottom: 12, left: 8, right: 8),
        child: isDataEmpty
            ? EmptyListView(
                title: '아직 저장한 게시글이 없어요.',
              )
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: CustomAppBar(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      title: '저장 게시글',
                      count: '10',
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        var profileImage = avtarImage[index];
                        var profileTitle = avtarTitle[index];
                        var profileSubTitle = avtarSubTitle[index];
                        var message = listTitle[index];
                        var subMessage = listSubTitle[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(Routes.saveDetailView);
                          },
                          child: Container(
                            padding: EdgeInsets.all(4),
                            child: Neumorphic(
                              style: NeumorphicStyle(/*color: Colors.white*/),
                              child: Column(
                                children: [
                                  buildListTileProfileView(profileImage,
                                      profileTitle, profileSubTitle),
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
                                        if (index == 1) ...[
                                          buildListImageView(),
                                        ],
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
                                          Assets.communityCopyPostIconImg,
                                          height: 15,
                                          width: 14,
                                          color: index == 1
                                              ? Color(0xffB6C6D0)
                                              : null,
                                        ),
                                        SizedBox(width: 3),
                                        Text('25',
                                            style:
                                                Styles.caption3MediumTextStyle()
                                                    .copyWith(
                                                        color: index == 1
                                                            ? Color(0xff8195A0)
                                                            : Color(
                                                                0xff0BA5EC))),
                                        SizedBox(width: 6),
                                        Image.asset(
                                          Assets.communityPostMessageIconImg,
                                          height: 20,
                                          width: 20,
                                        ),
                                        SizedBox(width: 2),
                                        Text('39',
                                            style: Styles
                                                .caption3MediumTextStyle()),
                                        Spacer(),
                                        Text('2023.04.01',
                                            style: Styles.cap2MediumTextStyle()
                                                .copyWith(
                                                    color: Color(0xff8195A0),
                                                    fontSize: 12)),
                                      ],
                                    ),
                                    margin: EdgeInsets.only(
                                        bottom: 10, top: 8, left: 8, right: 8),
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
              ),
      ),
      bottomNavigationBar: BottomNavigation(selectedTab: 3),
    ));
  }

  Widget bottomDetailsSheet() {
    return DraggableScrollableSheet(
      initialChildSize: .2,
      minChildSize: .1,
      maxChildSize: .6,
      expand: false,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          color: Colors.lightGreen[100],
          child: ListView(
            controller: scrollController,
            children: [
              ListTile(
                title: Text(
                  "NAME",
                ),
                subtitle: Text(
                  'animalNames[selectedTile]',
                ),
              ),
              ListTile(
                title: Text(
                  "FAMILY",
                ),
                subtitle: Text(
                  ' animalFamily[selectedTile]',
                ),
              ),
              ListTile(
                title: Text(
                  "LIFESPAN",
                ),
                subtitle: Text(
                  ' animalLifeSpan[selectedTile]',
                ),
              ),
              ListTile(
                title: Text(
                  "WEIGHT",
                ),
                subtitle: Text(
                  'animalWeight[selectedTile]',
                ),
              ),
            ],
          ),
        );
      },
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

  ListTile buildListTileProfileView(
      String profileImage, String profileTitle, String profileSubTitle) {
    return ListTile(
      leading: CircleAvatar(
        child: Image.asset(profileImage),
        radius: 18,
      ),
      title: Text(profileTitle, style: Styles.body2TextStyle()),
      subtitle: Text(
        profileSubTitle,
        style: Styles.cap2SemiBoldTextStyle(),
      ),
      trailing: Image.asset(Assets.communityMoreIconImg, height: 24, width: 24),
      dense: true,
      minLeadingWidth: 18,
    );
  }
}
