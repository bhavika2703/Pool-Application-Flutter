import 'package:boilerplate/constants/text_style.dart';
import 'package:boilerplate/ui/login/join_membership.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:boilerplate/widgets/app_theme_button.dart';
import 'package:boilerplate/widgets/custom_app_bar_widget.dart';
import 'package:boilerplate/widgets/textfield_widget.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class FindEmail extends StatefulWidget {
  const FindEmail({Key? key}) : super(key: key);

  @override
  _FindEmailState createState() => _FindEmailState();
}

class _FindEmailState extends State<FindEmail> {
  TextEditingController nameController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  ValueNotifier<bool> isMaleSelected = ValueNotifier<bool>(true);
  ValueNotifier<bool> isFemaleSelected = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: 12, right: 8, left: 8, bottom: 12),
          child: Column(
            children: [
              CustomAppBar(
                title: '회원가입',
                onPressed: () {},
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: CommonTextField(
                  controller: nameController,
                  label: '이름',
                  hint: '홍길동',
                  onChanged: (value) {},
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: CommonTextField(
                  controller: birthDateController,
                  label: '생년월일',
                  hint: '921105',
                  onChanged: (value) {},
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: genderView(
                  onChanged: (value) {},
                  context: context,
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: AppThemeButton(
                    text: '확인',
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed(Routes.findEmailResults);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column genderView({
    required BuildContext context,
    Gender? gender,
    required ValueChanged<Object> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
          child: Text(
            "성별",
            style: Styles.cap2MediumTextStyle(),
          ),
        ),
        neumorphicGenderButton(
          context: context,
        ),
      ],
    );
  }

  Widget neumorphicGenderButton({required BuildContext context}) {
    return ValueListenableBuilder<bool>(
      valueListenable: isMaleSelected,
      builder: (context, bool value, child) {
        return Neumorphic(
          style: NeumorphicStyle(
            depth: NeumorphicTheme.embossDepth(context),
            boxShape: NeumorphicBoxShape.stadium(),
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: genderViewButtons(
                  title: '남자',
                  onButtonPressed: () {
                    isMaleSelected.value = true;
                    isFemaleSelected.value = false;
                  },
                  showBackground: value,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: genderViewButtons(
                  onButtonPressed: () {
                    isMaleSelected.value = false;
                    isFemaleSelected.value = true;
                  },
                  showBackground: !value,
                  title: '여자',
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  NeumorphicButton genderViewButtons({
    required String title,
    required VoidCallback onButtonPressed,
    required bool showBackground,
  }) {
    return NeumorphicButton(
      style: showBackground
          ? NeumorphicStyle(
              depth: NeumorphicTheme.depth(context),
              boxShape: NeumorphicBoxShape.stadium())
          : NeumorphicStyle(depth: 0, boxShape: NeumorphicBoxShape.rect()),
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
      margin: EdgeInsets.only(right: 4, left: 4, bottom: 4, top: 4),
      child: Center(child: buildButtonTextView(title)),
      onPressed: onButtonPressed,
    );
  }

  Text buildButtonTextView(String title) {
    return Text(
      title,
      style: Styles.body2TextStyle(),
    );
  }
}
