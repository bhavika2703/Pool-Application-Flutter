import 'package:boilerplate/ui/bottom_navigation.dart';
import 'package:boilerplate/ui/home/detalis/timeline2.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

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
                        margin: const EdgeInsets.only(
                          top: 8,
                          left: 12,
                          right: 12,
                        ),
                        child: buildGridView(),
                      ),
                      Container(
                          margin: const EdgeInsets.only(
                              top: 20, bottom: 8, left: 8),
                          child: const Text(
                            '요일별 자유시간 안내',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
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
        bottomNavigationBar: BottomNavigation(),
      ),
    );
  }

  NeumorphicStyle cardViewStyle() {
    return NeumorphicStyle(
      boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(14)),
      depth: 5,
      color: const Color.fromRGBO(236, 240, 243, 0.6),
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
              const Text(
                "역삼청소년수련관 수영장",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
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
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 150,
          mainAxisSpacing: 20,
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

  Container buildFloatingButtonView() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 10.0, // soften the shadow
            spreadRadius: 4.0, //extend the shadow
            offset: const Offset(
              5.0, // Move to right 5  horizontally
              5.0, // Move to bottom 5 Vertically
            ),
          )
        ],
        color: Colors.white,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      height: 70,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          NeumorphicButton(
            onPressed: () {},
            style: NeumorphicStyle(
              shape: NeumorphicShape.concave,
              surfaceIntensity: 0.40,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
              depth: 8,
              lightSource: LightSource.topLeft,
            ),
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/images/home.png', height: 27, width: 27),
          ),
          NeumorphicButton(
            onPressed: () {},
            style: NeumorphicStyle(
              shape: NeumorphicShape.concave,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
              depth: 8,
              lightSource: LightSource.topLeft,
            ),
            padding: const EdgeInsets.all(8.0),
            child:
                Image.asset('assets/images/message.png', height: 27, width: 27),
          ),
          NeumorphicButton(
            onPressed: () {},
            style: NeumorphicStyle(
              shape: NeumorphicShape.concave,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
              depth: 8,
              lightSource: LightSource.topLeft,
            ),
            padding: const EdgeInsets.all(8.0),
            child:
                Image.asset('assets/images/person.png', height: 27, width: 27),
          ),
        ],
      ),
    );
  }

  Color? _iconsColor(BuildContext context) {
    final theme = NeumorphicTheme.of(context);
    if (theme!.isUsingDark) {
      return theme.current!.accentColor;
    } else {
      return null;
    }
  }

  Color _textColor(BuildContext context) {
    if (NeumorphicTheme.isUsingDark(context)) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }
}
