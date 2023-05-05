import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/utils/routes/routes.dart';
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
            color: Color(0xffB6C6D0),
            blurRadius: 10.0,
            spreadRadius: 4.0,
            offset: const Offset(
              5.0,
              5.0,
            ),
          )
        ],
        color: Color(0xffECF0F3),
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      height: 70,
      width: double.infinity,
      child: ValueListenableBuilder(
        valueListenable: isButton3OnTap,
        builder: (context, bool button3Value, child) {
          return ValueListenableBuilder(
            valueListenable: isButton2OnTap,
            builder: (context, bool button2Value, child) {
              return ValueListenableBuilder(
                valueListenable: isButton1OnTap,
                builder: (context, bool button1Value, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      NeumorphicButton(
                        style: buttonStyleView(button1Value, context),
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          Assets.homeNavigationIconImg,
                          height: 27,
                          width: 27,
                          color: button2Value == true ? Colors.black : null,
                        ),
                        onPressed: () {
                          isButton2OnTap.value = false;
                          isButton3OnTap.value = false;
                          isButton1OnTap.value = true;
                          Navigator.of(context)
                              .pushReplacementNamed(Routes.home);
                        },
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      NeumorphicButton(
                        onPressed: () {
                          isButton1OnTap.value = false;
                          isButton3OnTap.value = false;
                          isButton2OnTap.value = true;
                          Navigator.of(context)
                              .pushReplacementNamed(Routes.community);
                        },
                        style: buttonStyleView(button2Value, context),
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          Assets.messageNavigationIconImg,
                          height: 27,
                          width: 27,
                          color: button2Value == true ? Colors.black : null,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      NeumorphicButton(
                        onPressed: () {
                          isButton1OnTap.value = false;
                          isButton2OnTap.value = false;
                          isButton3OnTap.value = true;

                          Navigator.of(context)
                              .pushReplacementNamed(Routes.profile);
                        },
                        style: buttonStyleView(button3Value, context),
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          Assets.personNavigationIconImg,
                          height: 27,
                          width: 27,
                          color: button3Value == true ? Colors.black : null,
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  NeumorphicStyle buttonStyleView(bool buttonOnTapValue, BuildContext context) {
    return buttonOnTapValue
        ? NeumorphicStyle(
        color: Color(0xffECF0F3),
            depth: NeumorphicTheme.embossDepth(context),
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)))
        : NeumorphicStyle(
      shape: NeumorphicShape.flat,
            color: Color(0xffECF0F3),
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
            depth: 4,
            lightSource: LightSource.topLeft,
          );
  }
}
