import 'package:boilerplate/constants/text_style.dart';
import 'package:boilerplate/widgets/custom_app_bar_with_search_view.dart';
import 'package:boilerplate/widgets/rounded_button_widget.dart';
import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  bool isRecentSearchEmpty = false;

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
              CustomAppBarWithSearchView(
                searchHint: '검색해보세요',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                margin: EdgeInsets.only(top: 10, left: 15),
                child: Text('최근검색', style: Styles.body1TextStyle()),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 10, left: 15),
                  child: isRecentSearchEmpty
                      ? Center(
                          child: Text(
                            '최근검색 내역이 없습니다.',
                            style: Styles.body2SemiBoldTextStyle(),
                          ),
                        )
                      : ListView.separated(
                          separatorBuilder: (context, index) => Divider(
                            color: Colors.grey,
                          ),
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(
                                '우성스포츠센터 수영장 센터 수영장센터 수영장 수영장',
                                style: Styles.body2SemiBoldTextStyle(),
                              ),
                              subtitle: Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Text(
                                  '85m',
                                  style: Styles.cap2MediumTextStyle(),
                                ),
                              ),
                              leading: RoundedButtonWidget(
                                size: 25,
                                buttonIcon: Icons.location_on,
                                onPressed: () {},
                              ),
                            );
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
}
