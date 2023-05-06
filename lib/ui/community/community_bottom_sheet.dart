import 'package:boilerplate/constants/text_style.dart';
import 'package:boilerplate/utils/device/device_utils.dart';
import 'package:boilerplate/widgets/app_theme_button.dart';
import 'package:boilerplate/widgets/custom_check_box.dart';
import 'package:boilerplate/widgets/rounded_button_widget.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

void bottomSheetView(BuildContext context) {
  bool isExpanded = false;
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    isScrollControlled: true,
    enableDrag: true,
    useSafeArea: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(25.0),
      ),
    ),
    builder: (BuildContext context) {
      ValueNotifier<bool> checkBoxValue = ValueNotifier<bool>(false);
      ValueNotifier<bool> selectedCheckBoxValue = ValueNotifier<bool>(true);
      ValueNotifier<int> isFirstCheckboxCalledDuringBuild =
          ValueNotifier<int>(0);
      ValueNotifier<int> isSecondCheckboxCalledDuringBuild =
          ValueNotifier<int>(0);
      return DraggableScrollableSheet(
        expand: false,
        initialChildSize: .5,
        maxChildSize: 1,
        minChildSize: 0.40,
        builder: (context, scrollController) {
          return Wrap(
            children: [
              buildHeaderWidget(context),
              SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    buildLineView(
                        context: context,
                        height: 0.75,
                        width: DeviceUtils.getDeviceWidth(context)),
                    Container(
                      margin: EdgeInsets.only(
                          top: 8, left: 0, right: 0, bottom: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: bottomListOnePadding(),
                                    child: Text('서울',
                                        style: Styles.body1TextStyle().copyWith(
                                            color: Color(0xff212529))),
                                  ),
                                  Container(
                                    width: 130,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      padding: EdgeInsets.zero,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: bottomSheet1stList.length,
                                      itemBuilder: (context, index) {
                                        var name = bottomSheet1stList[index];
                                        return Container(
                                          padding: bottomListOnePadding(),
                                          child: Text(name,
                                              style: Styles.body1TextStyle()
                                                  .copyWith(
                                                      color:
                                                          Color(0xffB6C6D0))),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 12),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        ValueListenableBuilder(
                                          builder: (context, value, child) {
                                            return CustomCheckbox(
                                              value:
                                              value == 0 ? true : checkBoxValue.value,
                                              onChanged: (value) {
                                                isFirstCheckboxCalledDuringBuild
                                                    .value = 1;
                                                checkBoxValue.value = value;
                                              },
                                              isEnabled: true,
                                              padding: EdgeInsets.all(2),
                                              margin: EdgeInsets.all(8),
                                              style: CustomCheckboxStyle(),
                                            );
                                          },
                                          valueListenable: isFirstCheckboxCalledDuringBuild,
                                        ),
                                        Text('서울 전체',
                                            style: Styles.body1TextStyle()
                                                .copyWith(
                                                    color: Color(0xff212529))),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 250,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      padding: EdgeInsets.zero,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: bottomSheet2ndList.length,
                                      itemBuilder: (context, index) {
                                        var name = bottomSheet2ndList[index];
                                        return Row(
                                          children: [
                                            ValueListenableBuilder(
                                              builder: (context, value, child) {
                                                return CustomCheckbox(
                                                  value:
                                                  value == 0 ? true : selectedCheckBoxValue.value,
                                                  onChanged: (value) {
                                                    isSecondCheckboxCalledDuringBuild
                                                        .value = 1;
                                                    selectedCheckBoxValue.value = value;
                                                  },
                                                  isEnabled: true,
                                                  padding: EdgeInsets.all(2),
                                                  margin: EdgeInsets.all(8),
                                                  style: CustomCheckboxStyle(),
                                                );
                                              },
                                              valueListenable: isSecondCheckboxCalledDuringBuild,
                                            ),
                                            Container(
                                              padding: bottomListOnePadding(),
                                              child: Text(name,
                                                  style: Styles.body2TextStyle()
                                                      .copyWith(
                                                          color: Color(
                                                              0xff212529))),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 12),
                child: AppThemeButton(
                  onTap: () {},
                  text: '필터선택 완료',
                ),
              ),
            ],
          );
        },
      );
    },
  );
}

Widget buildHeaderWidget(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 8, top: 8),
      child: Row(
        children: [
          Spacer(),
          Text('지역', style: Styles.body1TextStyle()),
          Spacer(),
          RoundedButtonWidget(
            onPressed: () {
              Navigator.pop(context);
            },
            buttonIcon: Icons.close,
            size: 23,
          )
        ],
      ),
    ),
  );
}

Container buildLineView(
    {required BuildContext context,
    required double height,
    required double width}) {
  return Container(
    margin: EdgeInsets.only(bottom: 8, top: 8),
    child: Neumorphic(
      style: NeumorphicStyle(
          color: Colors.transparent,
          depth: NeumorphicTheme.depth(context),
          boxShape: NeumorphicBoxShape.rect()),
      child: Container(
          margin: EdgeInsets.only(top: 2, bottom: 2),
          height: height,
          width: width),
    ),
  );
}


EdgeInsets bottomListOnePadding() =>
    EdgeInsets.only(top: 4, bottom: 12, left: 12, right: 8);

List<String> bottomSheet1stList = [
  '경기',
  '인천',
  '부산',
  '대구',
  '대전',
  '광주',
  '울산',
  '충남/세종',
  '충북',
  '전남',
  '전북',
  '경남',
  '경북',
  '강원',
  '제주',
];

List<String> bottomSheet2ndList = [
  '서울 전체',
  '강남구',
  '송파구/강동구',
  '종로구/성북구',
  '중구',
  '용산구',
  '마포구',
  '서대문구/은평구',
  '성동구/광진구',
  '영등포구/구로구',
  '동작구/관악구/금천구',
  '강서구/양천구',
  '노원구/도봉구/강북구',
  '동대문구/중랑구',
];
