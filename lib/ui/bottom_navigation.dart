import 'package:boilerplate/constants/assets.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  ValueNotifier<bool> isButton1OnTap = ValueNotifier<bool>(true);
  ValueNotifier<bool> isButton2OnTap = ValueNotifier<bool>(false);
  ValueNotifier<bool> isButton3OnTap = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 10.0,
            spreadRadius: 4.0,
            offset: const Offset(
              5.0,
              5.0,
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
          ValueListenableBuilder(
            valueListenable: isButton1OnTap,
            builder: (context, bool value, child) {
              return NeumorphicButton(
                style: buttonStyleView(value, context),
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  Assets.homeNavigationIconImg,
                  height: 27,
                  width: 27,
                ),
                onPressed: () {
                  isButton1OnTap.value = true;
                  isButton2OnTap.value = false;
                  isButton3OnTap.value = false;
                },
              );
            },
          ),
          ValueListenableBuilder(
            valueListenable: isButton2OnTap,
            builder: (context, bool value, child) {
              return NeumorphicButton(
                onPressed: () {
                  isButton1OnTap.value = false;
                  isButton3OnTap.value = false;
                  isButton2OnTap.value = true;
                },
                style: buttonStyleView(value, context),
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  Assets.messageNavigationIconImg,
                  height: 27,
                  width: 27,
                ),
              );
            },
          ),
          ValueListenableBuilder(
            valueListenable: isButton3OnTap,
            builder: (context, bool value, child) {
              return NeumorphicButton(
                onPressed: () {
                  isButton1OnTap.value = false;
                  isButton2OnTap.value = false;
                  isButton3OnTap.value = true;
                },
                style: buttonStyleView(value, context),
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  Assets.personNavigationIconImg,
                  height: 27,
                  width: 27,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  NeumorphicStyle buttonStyleView(bool buttonOnTapValue, BuildContext context) {
    return buttonOnTapValue
        ? NeumorphicStyle(
            color: Colors.white,
            depth: NeumorphicTheme.embossDepth(context),
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)))
        : NeumorphicStyle(
            shape: NeumorphicShape.flat,
            color: Colors.white,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
            depth: 4,
            lightSource: LightSource.topLeft,
          );
  }
}
