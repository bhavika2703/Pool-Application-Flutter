import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class RoundedButtonWidget extends StatefulWidget {
  final IconData? buttonIcon;
  final Color? buttonColor;
  final Color textColor;
  final VoidCallback onPressed;
  final bool isLoginScreen;
  final Widget? buttonChildView;

  const RoundedButtonWidget({
    Key? key,
    this.buttonIcon,
    this.buttonColor,
    this.buttonChildView,
    this.textColor = Colors.white,
    this.isLoginScreen = false,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<RoundedButtonWidget> createState() => _RoundedButtonWidgetState();
}

class _RoundedButtonWidgetState extends State<RoundedButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      padding: const EdgeInsets.all(12),
      style: NeumorphicStyle(
        shape: NeumorphicShape.flat,
        boxShape: NeumorphicBoxShape.stadium(),
      ),
      child: widget.isLoginScreen
          ? widget.buttonChildView
          : buildBackIcon(context),
      onPressed: widget.onPressed,
    );
  }

  Icon buildBackIcon(BuildContext context) {
    return Icon(
      widget.buttonIcon,
      size: 20,
      color: NeumorphicTheme.isUsingDark(context)
          ? Colors.white70
          : const Color.fromRGBO(74, 82, 92, 1),
    );
  }
}
