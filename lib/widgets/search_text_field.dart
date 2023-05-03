import 'package:boilerplate/constants/text_style.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class SearchTextField extends StatefulWidget {
  final TextInputType? textInputType;
  final String hint;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  final IconData leadingIcon;
  final IconData? trailIcon;

  SearchTextField({
    required this.hint,
    required this.onChanged,
    required this.leadingIcon,
    this.trailIcon,
    this.textInputType,
    required this.controller,
  });

  @override
  _SearchTextFieldState createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  ValueNotifier<bool> showCloseIcon = ValueNotifier<bool>(false);

  @override
  void initState() {
    widget.controller.addListener(
      () {
        showCloseIcon.value = widget.controller.text.isNotEmpty;
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Neumorphic(
          margin: EdgeInsets.only(left: 5, top: 2, bottom: 4),
          style: NeumorphicStyle(
            depth: NeumorphicTheme.embossDepth(context),
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),
          ),
          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 45,
                width: 45,
                child: Icon(widget.leadingIcon),
              ),
              Expanded(
                child: TextField(
                  onChanged: this.widget.onChanged,
                  controller: widget.controller,
                  keyboardType: widget.textInputType ?? TextInputType.text,
                  cursorColor: Colors.black,
                  style: Styles.body2MediumTextStyle().copyWith(
                    color: Color(0xFF212529)
                  ),
                  decoration: InputDecoration.collapsed(
                    hintText: this.widget.hint,
                    hintStyle: Styles.body2MediumTextStyle()
                        .copyWith(color: Color(0xFF8195A0)),
                  ),
                ),
              ),
              widget.trailIcon != null
                  ? ValueListenableBuilder<bool>(
                      builder: (context, bool value, child) {
                        return value
                            ? GestureDetector(
                                onTap: () {
                                  widget.controller.text = '';
                                },
                                child: Container(
                                  height: 45,
                                  width: 45,
                                  child: Icon(widget.trailIcon),
                                ),
                              )
                            : SizedBox();
                      },
                      valueListenable: showCloseIcon,
                    )
                  : SizedBox(),
            ],
          ),
        )
      ],
    );
  }
}
