import 'package:boilerplate/constants/assets.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
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
            child: Image.asset(Assets.homeNavigationIconImg,
                height: 27, width: 27),
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
            child: Image.asset(Assets.messageNavigationIconImg,
                height: 27, width: 27),
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
            child: Image.asset(Assets.personNavigationIconImg,
                height: 27, width: 27),
          ),
        ],
      ),
    );
  }
}
