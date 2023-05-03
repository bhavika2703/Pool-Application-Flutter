import 'package:boilerplate/ui/home/time_table_view.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class FullScreenTimeTableView extends StatefulWidget {
  const FullScreenTimeTableView({Key? key}) : super(key: key);

  @override
  State<FullScreenTimeTableView> createState() =>
      _FullScreenTimeTableViewState();
}

class _FullScreenTimeTableViewState extends State<FullScreenTimeTableView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.only(top: 8, bottom: 10),
          child: ResourceViewBuilder(isFullScreenView: true),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(
              Routes.home,
            );
          },
          backgroundColor: Color(0xff212529),
          label:
              Text('지도보기', style: TextStyle(color: Colors.white, fontSize: 12)),
          icon: Icon(Icons.map_outlined, color: Colors.white, size: 16),
        ),
      ),
    );
  }
}
