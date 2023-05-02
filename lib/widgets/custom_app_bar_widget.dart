import 'package:boilerplate/widgets/header_title_widget.dart';
import 'package:boilerplate/widgets/rounded_button_widget.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final VoidCallback onPressed;
  final String title;

  const CustomAppBar({
    Key? key,
    required this.onPressed,
    required this.title,
  }) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 55);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      leading: Container(
        height: 45,
        width: 45,
        child: RoundedButtonWidget(
          buttonIcon: Icons.arrow_back_ios_outlined,
          onPressed: widget.onPressed,
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Center(
          child: HeaderTitleWidget(
            titleText: widget.title,
          ),
        ),
      ),
    );
  }
}
