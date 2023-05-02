import 'package:boilerplate/constants/text_style.dart';
import 'package:boilerplate/widgets/app_theme_button.dart';
import 'package:boilerplate/widgets/custom_app_bar_widget.dart';
import 'package:boilerplate/widgets/textfield_widget.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

enum Gender { MALE, FEMALE }

class JoinMemberShip extends StatefulWidget {
  const JoinMemberShip({Key? key}) : super(key: key);

  @override
  State<JoinMemberShip> createState() => _JoinMemberShipState();
}

class _JoinMemberShipState extends State<JoinMemberShip> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController verifyPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  Gender? gender;
  ValueNotifier<bool> isMaleSelected = ValueNotifier<bool>(true);
  ValueNotifier<bool> isFemaleSelected = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: 12, right: 8, left: 8),
          child: Column(
            children: [
              CustomAppBar(
                title: '회원가입',
                onPressed: () {},
              ),
              SizedBox(
                height: 12,
              ),
              CommonTextField(
                controller: emailController,
                label: '이메일 주소',
                hint: 'abc@gmail.com',
                onChanged: (value) {},
              ),
              CommonTextField(
                controller: passwordController,
                label: '비밀번호',
                hint: '영문 대소문자,숫자,특수문자 포함 8자리 이상',
                onChanged: (value) {},
              ),
              CommonTextField(
                controller: verifyPasswordController,
                label: '비밀번호 확인',
                hint: '비밀번호 재 입력',
                onChanged: (value) {},
              ),
              CommonTextField(
                controller: nameController,
                label: '이름',
                hint: '홍길동',
                onChanged: (value) {},
              ),
              CommonTextField(
                controller: birthDateController,
                label: '생년월일',
                hint: '921105',
                onChanged: (value) {},
              ),
              genderView(
                onChanged: (value) {},
                context: context,
              ),
              SizedBox(height: 18),
              AppThemeButton(
                text: '확인',
                onTap: () {},
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
