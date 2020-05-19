import 'package:flutter/material.dart';

class ClipPathWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ClipPath'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 200,
              child: Stack(
                children: <Widget>[
                  ClipPath(
                    clipper: CustomClipPath2(),
                    child: Container(
                      width: double.infinity,
                      height: 200,
                      color: Colors.blue,
                    ),
                  ),
                  Positioned(
                    child: ClipPath(
                      clipper: CustomClipPath(),
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/thiennhien.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ClipPath(
              clipper: CustomClipPath3(),
              child: Container(
                height: 200,
                width: double.infinity,
                color: Colors.red,
              ),
            ),
            ClipPath(
              clipper: CustomClipPath4(),
              child: Container(
                height: 200,
                width: double.infinity,
                color: Colors.yellow,
              ),
            ),
            ClipPath(
              clipper: CustomClipPath5(),
              child: Container(
                height: 200,
                width: double.infinity,
                color: Colors.green,
              ),
            ),
            SizedBox(
              height: 150,
              width: 300,
              child: Stack(
                children: <Widget>[
                  Container(
                    width: 250,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text('This is custom'),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 20,
                    child: ClipPath(
                      clipper: CustomClipPath6(),
                      child: Container(
                        width: 50,
                        height: 50,
                        color: Colors.greenAccent,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(size.width / 2, size.height / 2);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class CustomClipPath2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0, size.height);
    path.arcToPoint(Offset(size.width / 2, size.height),
        radius: Radius.elliptical(30, 10));
    path.lineTo(size.width / 2, size.height);
    path.arcToPoint(Offset(size.width, size.height),
        radius: Radius.elliptical(30, 10));
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class CustomClipPath3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0, size.height / 2);
    path.quadraticBezierTo(
        size.width / 2, size.height / 2 - 50, size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class CustomClipPath4 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 4, size.height - 50, size.width / 2, size.height - 20);
    path.quadraticBezierTo(
        size.width * 3 / 4, size.height, size.width, size.height - 40);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class CustomClipPath5 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(size.width - 3 / 4 * size.width, size.height);
    path.lineTo(size.width / 2, size.height - 40);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class CustomClipPath6 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width, size.height / 2);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
