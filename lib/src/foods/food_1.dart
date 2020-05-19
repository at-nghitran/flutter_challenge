import 'package:flutter/material.dart';

class Foods1Page extends StatefulWidget {
  @override
  _Foods1PageState createState() => _Foods1PageState();
}

class _Foods1PageState extends State<Foods1Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            HomeWidget(),
            HomeBottomWidget(),
          ],
        ),
      ),
    );
  }
}

class HomeBottomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'List Restaurant',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                FlatButton(
                  onPressed: () {},
                  child: Text('View more'),
                ),
              ],
            ),
          ),
          Container(
            height: 160,
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(width: 10),
              itemCount: 10,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  height: 150,
                  width: 150,
                  color: Colors.blue,
                  child: Text('$index'),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 420,
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: ClipBacgroundImage(),
            child: Container(
              height: 370,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0.0, 10.0),
                    blurRadius: 10.0),
              ]),
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image(
                    image: AssetImage('assets/images/restaurant.jpeg'),
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color(0x00000000),
                          const Color(0xD9333333),
                        ],
                        stops: [0.0, 0.9],
                        begin: FractionalOffset(0.0, 0.0),
                        end: FractionalOffset(0.0, 1.0),
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Looking For The Best Restaurant',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 370.0,
            right: -20,
            child: FractionalTranslation(
              translation: Offset(0.0, -0.5),
              child: Row(
                children: <Widget>[
                  FloatingActionButton(
                    backgroundColor: Colors.white,
                    onPressed: () {},
                    child: Icon(
                      Icons.add,
                      color: Colors.purple,
                    ),
                  ),
                  SizedBox(width: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: RaisedButton(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 100,
                      ),
                      onPressed: () {},
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Find',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ClipBacgroundImage extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 100);
    var controllPoint = Offset(35.0, size.height);
    var endPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(
        controllPoint.dx, controllPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => false;
}
