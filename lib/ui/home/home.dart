import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/constants/text_style.dart';
import 'package:boilerplate/ui/bottom_navigation.dart';
import 'package:boilerplate/ui/home/time_table_view.dart';
import 'package:boilerplate/utils/device/device_utils.dart';
import 'package:boilerplate/widgets/rounded_button_widget.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    /* SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      showModalBottomSheet<void>(
        context: context,
        enableDrag: true,
        useSafeArea: true,
        useRootNavigator: true,
        isScrollControlled: true,
        isDismissible: false,
        builder: (BuildContext context) {
          return buildBottomSheet(context);
          //Your builder code
        },
      );
    });*/
    return Scaffold(
      body: _buildBody(context),
      bottomSheet: buildBottomSheet(context),
      bottomNavigationBar: BottomNavigation(),
    );
  }

  Container buildBottomSheet(BuildContext context) {
    return Container(
      height: DeviceUtils.getDeviceHeight(context) / 2,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: ResourceViewBuilder(),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: <Widget>[
        Image.asset(Assets.homeMapImg,
            fit: BoxFit.fill, width: double.infinity),
        Positioned(
            top: DeviceUtils.getDeviceHeight(context) / 3,
            left: DeviceUtils.getDeviceWidth(context) / 2.1,
            child: Image.asset(
              Assets.mapLocationIconImg,
              height: 28,
              width: 28,
            )),
        searchView(),
        Positioned(
          top: DeviceUtils.getDeviceHeight(context) / 2.4,
          left: 8,
          child: RoundedButtonWidget(
            onPressed: () {},
            buttonChildView: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.asset(Assets.sentIconImg, width: 19, height: 19),
            ),
            isLoginScreen: true,
          ),
        )
      ],
    );
  }

  Neumorphic searchView() {
    return Neumorphic(
      margin: EdgeInsets.only(left: 8, right: 8, top: 50, bottom: 4),
      style: NeumorphicStyle(
          depth: NeumorphicTheme.embossDepth(context),
          boxShape: NeumorphicBoxShape.stadium()),
      child: TextField(
        controller: searchController,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: '검색해보세요',
          hintStyle: Styles.body2MediumTextStyle(),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset(Assets.searchIconImg, height: 7, width: 7),
          ),
          errorBorder: InputBorder.none,
          border: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
        ),
      ),
    );
  }

  modelBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
        context: context,
        builder: (context) {
          return Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: new Icon(Icons.photo),
                  title: new Text('Photo'),
                  onTap: () {},
                ),
              ],
            ),
          );
        });
  }
}
