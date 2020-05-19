import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_challenge/src/auth/login.dart';
import 'package:flutter_challenge/src/clip_path/clip_path.dart';
import 'package:flutter_challenge/src/foods/food_1.dart';
import 'package:flutter_challenge/src/list/list_1.dart';
import 'package:flutter_challenge/src/video_play/play_video.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:flutter_challenge/src/profiles/profile_1.dart';
import 'package:flutter_challenge/src/profiles/profile_2.dart';

class SmartHomeSlide extends StatelessWidget {
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final data = [
      new OrdinalSales('1', 5),
      new OrdinalSales('2', 25),
      new OrdinalSales('3', 100),
      new OrdinalSales('4', 75),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }

  _buildChart() {
    return charts.BarChart(_createSampleData(), animate: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        // leading: IconButton(icon: Icon(Icons.dehaze), onPressed: ,),
        title: Text('Home Page'),
      ),
      drawer: ClipPath(
        clipper: OvalRightBorderClipper(),
        child: Drawer(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.blue,
                  Colors.black54,
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildMenuItem(context, Profile1Page(), 'Profile 1'),
                  Divider(),
                  _buildMenuItem(context, Profile2Page(), 'Profile 2'),
                  Divider(),
                  _buildMenuItem(context, Login1Page(), 'Login'),
                  Divider(),
                  _buildMenuItem(context, Foods1Page(), 'Food 1'),
                  Divider(),
                  _buildMenuItem(context, ClipPathWidget(), 'Clip Path'),
                  Divider(),
                  _buildMenuItem(context, List1Page(), 'List 1'),
                  Divider(),
                  _buildMenuItem(context, PlayVideoPage(), 'Play video'),
                  Divider(),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.7),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Dashboard',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/bg_dog.jpg'),
                        ),
                      )
                    ],
                  ),
                  Text(
                    'Jonh Smith',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '43 JohnSon, California',
                    style: TextStyle(fontSize: 17, color: Colors.black54),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 8,
              ),
              child: Text(
                'Appointments',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        height: 100,
                        width: 100,
                        child: _buildChart(),
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            'Today',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '18 Patients',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        height: 100,
                        width: 100,
                        child: _buildChart(),
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            'Canceled',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '7 Patients',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            StaggeredGridView.countBuilder(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
              ),
              crossAxisCount: 4,
              itemCount: 8,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) => new Container(
                  color: Colors.blue,
                  child: new Center(
                    child: new CircleAvatar(
                      backgroundColor: Colors.white,
                      child: new Text('$index'),
                    ),
                  )),
              staggeredTileBuilder: (int index) =>
                  new StaggeredTile.count(2, index.isEven ? 2 : 1),
              mainAxisSpacing: 5.0,
              crossAxisSpacing: 10.0,
            )
          ],
        ),
      ),
    );
  }

  FlatButton _buildMenuItem(BuildContext context, Widget child, String text,
      {double space = 160}) {
    return FlatButton(
      onPressed: () {
        Navigator.of(context).pop();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => child,
          ),
        );
      },
      child: Row(
        children: <Widget>[
          Text(
            text,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(width: space),
          Icon(
            Icons.arrow_forward_ios,
            size: 17,
          )
        ],
      ),
    );
  }
}

class OvalRightBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width - 40, 0);
    path.quadraticBezierTo(
        size.width, size.height / 4, size.width, size.height / 2);
    path.quadraticBezierTo(size.width, size.height - (size.height / 4),
        size.width - 40, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
