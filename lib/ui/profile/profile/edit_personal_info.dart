import 'package:flutter/material.dart';

import '../../../widgets/custom_app_bar_widget.dart';

class EditPersonalInfo extends StatefulWidget {
  const EditPersonalInfo({Key? key}) : super(key: key);

  @override
  State<EditPersonalInfo> createState() => _EditPersonalInfoState();
}

class _EditPersonalInfoState extends State<EditPersonalInfo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBar(
              title: '개인정보 수정',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
