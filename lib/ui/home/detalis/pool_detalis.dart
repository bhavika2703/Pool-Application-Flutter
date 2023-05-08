import 'package:boilerplate/constants/text_style.dart';
import 'package:boilerplate/ui/bottom_navigation.dart';
import 'package:boilerplate/ui/home/detalis/timeline2.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:sizer/sizer.dart';

class PoolDetalis extends StatelessWidget {
  PoolDetalis({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin:
                  const EdgeInsets.only(left: 12, right: 12, bottom: 80),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      buildNeumorphicRoundButton(context),
                      Neumorphic(
                        style: cardViewStyle(),
                        padding: const EdgeInsets.all(10.0),
                        margin: const EdgeInsets.all(8),
                        child: Image.asset('assets/images/swming_pool.png'),
                      ),
                      buildLikeWidgetView(),
                      Container(
                        margin: EdgeInsets.only(
                          top: 8.h,
                          left: 12.w,
                          right: 12.w,
                        ),
                        child: buildGridView(),
                      ),
                      Container(
                          margin: const EdgeInsets.only(
                              top: 20, bottom: 8, left: 8),
                          child: Text(
                            '요일별 자유시간 안내',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.sp),
                          )),
                      Neumorphic(
                        style: cardViewStyle(),
                        padding: const EdgeInsets.all(10.0),
                        margin: const EdgeInsets.all(8),
                        child: const Timeline2(),
                      ),
                      buildCopyViewContainer(),
                      Neumorphic(
                        style: cardViewStyle(),
                        padding: const EdgeInsets.all(12.0),
                        margin: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 10, top: 8),
                              child: Text('서울특별시 강남구 개포로110길 15',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                            Image.asset('assets/images/map.png'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigation(selectedTab: 1),
      ),
    );
  }

  NeumorphicStyle cardViewStyle() {
    return NeumorphicStyle(
      boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(14)),
      depth: 5,
      color: Colors.transparent,
    );
  }

  Container buildCopyViewContainer() {
    return Container(
        margin: const EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '위치',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            NeumorphicButton(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 14,
              ),
              style: NeumorphicStyle(
                color: Colors.transparent,
                boxShape: NeumorphicBoxShape.roundRect(
                  BorderRadius.circular(22),
                ),
                shape: NeumorphicShape.flat,
                depth: 8,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/images/copy.png', height: 17, width: 17),
                  const SizedBox(
                    width: 4,
                  ),
                  const Text('주소복사'),
                ],
              ),
              onPressed: () {},
            ),
          ],
        ));
  }

  Padding buildLikeWidgetView() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 6, bottom: 6, right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "역삼청소년수련관 수영장",
                style: Styles.heading2TextStyle(),
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/images/likeFill.png',
                    width: 16,
                    height: 14,
                    color: const Color.fromRGBO(54, 191, 250, 1),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 6.0),
                    child: Text(
                      "찜 3,919",
                      style: TextStyle(
                          fontSize: 15,
                          color: Color.fromRGBO(56, 62, 69, 1),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
          NeumorphicButton(
            margin:
            const EdgeInsets.only(top: 12, left: 8, bottom: 8, right: 6),
            padding: const EdgeInsets.all(12),
            style: const NeumorphicStyle(
              color: Colors.transparent,
              boxShape: NeumorphicBoxShape.circle(),
              shape: NeumorphicShape.flat,
              depth: 12,
            ),
            child: Image.asset('assets/images/like.png', width: 22, height: 22),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  GridView buildGridView() {
    return GridView(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 20.h,
          mainAxisSpacing: 5.h,
          crossAxisSpacing: 20),
      shrinkWrap: true,
      children: [
        NeumorphicButton(
          onPressed: () {},
          style: buildNeumorphicStyle(),
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Neumorphic(
                style: const NeumorphicStyle(
                  color: Color.fromRGBO(225, 231, 236, 1),
                  boxShape: NeumorphicBoxShape.circle(),
                  depth: 0,
                ),
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/images/clock.png',
                    height: 18, width: 18),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                '영업시간',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text(
                '매일 06:00 - 11:00',
                style: TextStyle(
                    fontSize: 12, color: Color.fromRGBO(56, 62, 69, 1)),
              )
            ],
          ),
        ),
        NeumorphicButton(
          onPressed: () {},
          style: buildNeumorphicStyle(),
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Neumorphic(
                style: const NeumorphicStyle(
                  color: Color.fromRGBO(225, 231, 236, 1),
                  boxShape: NeumorphicBoxShape.circle(),
                  depth: 0,
                ),
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/images/exlamationmark.png',
                    height: 18, width: 18),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                '정보',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text(
                '강남 일원/개포지역 종합 스포츠',
                style: TextStyle(
                    fontSize: 12, color: Color.fromRGBO(56, 62, 69, 1)),
              )
            ],
          ),
        ),
        NeumorphicButton(
          onPressed: () {},
          style: buildNeumorphicStyle(),
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Neumorphic(
                style: const NeumorphicStyle(
                  color: Color.fromRGBO(225, 231, 236, 1),
                  boxShape: NeumorphicBoxShape.circle(),
                  depth: 0,
                ),
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/images/document.png',
                    height: 18, width: 18),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                '특이사항',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text(
                '예약 방문시 무료 이용권 증정',
                style: TextStyle(
                    fontSize: 12, color: Color.fromRGBO(56, 62, 69, 1)),
              )
            ],
          ),
        ),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Neumorphic(
                style: const NeumorphicStyle(
                  color: Color.fromRGBO(225, 231, 236, 1),
                  boxShape: NeumorphicBoxShape.circle(),
                  depth: 0,
                ),
                padding: const EdgeInsets.all(8.0),
                child: const Icon(
                  Icons.add,
                  color: Color.fromRGBO(109, 121, 132, 1),
                ),
              ),
              SizedBox(height: 6),
              const Text(
                '추가정보 준비중',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  NeumorphicStyle buildNeumorphicStyle() {
    return NeumorphicStyle(
      shape: NeumorphicShape.flat,
      boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
      depth: 6,
      lightSource: LightSource.left,
      color: Color.fromRGBO(236, 240, 243, 0.5),
    );
  }

  NeumorphicButton buildNeumorphicRoundButton(BuildContext context) {
    return NeumorphicButton(
      margin: const EdgeInsets.only(top: 8, bottom: 6),
      padding: const EdgeInsets.all(12),
      style: const NeumorphicStyle(
        boxShape: NeumorphicBoxShape.circle(),
        shape: NeumorphicShape.concave,
        color: Color(0xffE1E7EC),
        depth: 12,
      ),
      child: buildBackIcon(context),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  Icon buildBackIcon(BuildContext context) {
    return Icon(
      Icons.arrow_back_ios_new_outlined,
      size: 20,
      color: NeumorphicTheme.isUsingDark(context)
          ? Colors.white70
          : const Color.fromRGBO(74, 82, 92, 1),
    );
  }
}
