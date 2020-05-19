import 'package:flutter/material.dart';

class Profile1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 450,
                ),
                Positioned(
                    child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/bg_appbar.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
                Positioned(
                  top: 70,
                  left: 30,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  top: 260,
                  left: 20,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width - 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          'Little Bufterfly',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Product Design',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Kathmandu',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Text(
                                  '285',
                                  style: TextStyle(
                                    color: Colors.redAccent,
                                  ),
                                ),
                                Text(
                                  'Like',
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  '205',
                                  style: TextStyle(
                                    color: Colors.redAccent,
                                  ),
                                ),
                                Text(
                                  'Follow',
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  '300',
                                  style: TextStyle(
                                    color: Colors.redAccent,
                                  ),
                                ),
                                Text(
                                  'Share',
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 215,
                  left: 40,
                  child: Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/bg_appbar.jpg'),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
              ],
            ),
            Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      'Infomation',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    height: 1,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.date_range),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Birthday',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Text('03/02/1990'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    height: 1,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.email),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Email',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Text('abcd@gmail.com'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    height: 1,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.streetview),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Address',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Text('Son Tra, Da Nang'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    height: 1,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.phone),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Phone',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Text('0905847653'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    height: 1,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.web),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Website',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Text('abcdef.com'),
                          ],
                        ),
                      ],
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
