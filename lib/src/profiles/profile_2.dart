import 'package:flutter/material.dart';

class Profile2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 400,
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          height: 270,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.blue,
                                  Colors.red,
                                ],
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(70),
                                bottomRight: Radius.circular(70),
                              )),
                        ),
                      ),
                      Positioned(
                        top: 30,
                        left: 0,
                        right: 20,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.notifications,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 20),
                                    Icon(
                                      Icons.dehaze,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 140,
                        left: (MediaQuery.of(context).size.width - 250) / 2,
                        child: Container(
                          width: 250,
                          height: 250,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/bg_dog.jpg'),
                                fit: BoxFit.fill,
                              ),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                      Positioned(
                        top: 80,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Text(
                              'Date master',
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 130,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 20,
                          child: Center(
                            child: Container(
                              width: 80,
                              padding: const EdgeInsets.all(5),
                              child: Center(
                                child: Text(
                                  '3.7mi away',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontStyle: FontStyle.italic,
                                    height: 1,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.yellow,
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Shaha - 22',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.place, color: Colors.grey),
                          Text(
                            'San Diego, California, USA',
                            style: TextStyle(fontSize: 17, color: Colors.grey),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Wrap(
                        children: <Widget>[
                          Icon(
                            Icons.phone,
                            color: Colors.grey,
                            size: 27,
                          ),
                          SizedBox(width: 10),
                          Icon(Icons.place, color: Colors.grey),
                          SizedBox(width: 10),
                          Icon(Icons.share, color: Colors.grey),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: 170,
                        width: MediaQuery.of(context).size.width,
                      ),
                      Positioned(
                        bottom: 20,
                        left: 0,
                        right: 0,
                        child: Container(
                          margin: const EdgeInsets.only(left: 15, right: 15),
                          padding: const EdgeInsets.all(15),
                          height: 80,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Colors.purple,
                                Colors.orange,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Wrap(
                                children: <Widget>[
                                  Icon(
                                    Icons.person_outline,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 15),
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                              Wrap(
                                children: <Widget>[
                                  Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 15),
                                  Icon(
                                    Icons.message,
                                    color: Colors.white,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 65,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(-1, -1),
                                        blurRadius: 0.5),
                                    BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(1, 1),
                                        blurRadius: 0.5),
                                  ]),
                              child: Icon(
                                Icons.mood,
                                size: 25,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
