import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/constants/text_style.dart';
import 'package:boilerplate/widgets/custom_app_bar_widget.dart';
import 'package:flutter/material.dart';

class PostView extends StatefulWidget {
  const PostView({Key? key}) : super(key: key);

  @override
  _PostViewState createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  TextEditingController subjectController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  ValueNotifier<bool> enablePostView = ValueNotifier<bool>(false);

  @override
  void initState() {
    // TODO: implement initState
    subjectController.addListener(() {
      enablePostView.value = subjectController.text.isNotEmpty &&
          detailsController.text.isNotEmpty;
    });

    detailsController.addListener(() {
      enablePostView.value = subjectController.text.isNotEmpty &&
          detailsController.text.isNotEmpty;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: 12, right: 8, left: 8, bottom: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildCustomHeader(context),
              SizedBox(
                height: 12,
              ),
              Divider(
                color: AppColors.lightGrayColor,
                height: 0.5,
              ),
              _buildSubjectView(),
              _buildDetailsView(),
              _buildGalleryPost(),
            ],
          ),
        ),
      ),
    );
  }

  Expanded _buildGalleryPost() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 10, bottom: 10),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            children: [
              Image.asset(
                Assets.galleryPostIcon,
                height: 25,
                width: 25,
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  '사진추가 (최대 10장)',
                  style: Styles.cap2MediumTextStyle(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container _buildDetailsView() {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 10),
      child: TextField(
        onChanged: (value) {},
        controller: detailsController,
        keyboardType: TextInputType.text,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '내용을 상세하게 입력해주세요',
          hintStyle: Styles.body2MediumTextStyle(),
        ),
      ),
    );
  }

  Container _buildSubjectView() {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 10),
      child: TextField(
        onChanged: (value) {},
        controller: subjectController,
        keyboardType: TextInputType.text,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: '제목을 입력해주세요',
          hintStyle: Styles.body2MediumTextStyle(),
        ),
      ),
    );
  }

  Row _buildCustomHeader(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomAppBar(
            title: '글쓰기',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        ValueListenableBuilder<bool>(
          valueListenable: enablePostView,
          builder: (context, bool value, child) {
            return Container(
              child: Text(
                '등록',
                style: Styles.body1TextStyle().copyWith(
                  color: value ? AppColors.themeColor : Color(0xFFC5D1D9),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
