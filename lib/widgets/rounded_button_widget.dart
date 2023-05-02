import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class RoundedButtonWidget extends StatelessWidget {
  final IconData buttonIcon;
  final Color? buttonColor;
  final Color textColor;
  final VoidCallback onPressed;

  const RoundedButtonWidget({
    Key? key,
    required this.buttonIcon,
    this.buttonColor,
    this.textColor = Colors.white,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      //margin: const EdgeInsets.only(top: 8, bottom: 6),
      padding: const EdgeInsets.all(12),
      style: NeumorphicStyle(
        shape: NeumorphicShape.flat,
        boxShape: NeumorphicBoxShape.stadium(),
      ),
      child: buildBackIcon(context),
      onPressed: onPressed,
    );
  }

  Icon buildBackIcon(BuildContext context) {
    return Icon(
      buttonIcon,
      size: 20,
      color: NeumorphicTheme.isUsingDark(context)
          ? Colors.white70
          : const Color.fromRGBO(74, 82, 92, 1),
    );
  }
}
