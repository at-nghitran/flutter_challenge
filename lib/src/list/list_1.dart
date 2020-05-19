import 'package:flutter/material.dart';
import 'package:flutter_challenge/src/custom_page_router/custom_page_transition.dart';
import 'package:flutter_challenge/src/list/item.dart';

class List1Page extends StatefulWidget {
  @override
  _List1PageState createState() => _List1PageState();
}

class _List1PageState extends State<List1Page> {
  var _listItem = [
    {
      'id': '1',
      'name': 'Name 1',
      'description': 'This is name 1',
      'image': 'https://loremflickr.com/320/240',
    },
    {
      'id': '2',
      'name': 'Name 2',
      'description': 'This is name 2',
      'image': 'https://loremflickr.com/320/240',
    },
    {
      'id': '3',
      'name': 'Name 3',
      'description': 'This is name 3',
      'image': 'https://loremflickr.com/320/240',
    },
    {
      'id': '4',
      'name': 'Name 4',
      'description': 'This is name 4',
      'image': 'https://loremflickr.com/320/240',
    },
    {
      'id': '5',
      'name': 'Name 5',
      'description': 'This is name 5',
      'image': 'https://loremflickr.com/320/240',
    },
    {
      'id': '6',
      'name': 'Name 6',
      'description': 'This is name 6',
      'image': 'https://loremflickr.com/320/240',
    },
    {
      'id': '7',
      'name': 'Name 7',
      'description': 'This is name 7',
      'image': 'https://loremflickr.com/320/240',
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.green,
              child: Center(
                child: Text('This is List Item'),
              ),
            ),
            ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(createRouteFaceIn(
                        ListItemPage(
                          id: _listItem[index]['id'],
                          name: _listItem[index]['name'],
                          description: _listItem[index]['description'],
                          image: _listItem[index]['image'],
                        ),
                      ));
                    },
                    child: Card(
                      child: Row(
                        children: <Widget>[
                          Hero(
                            tag: '${_listItem[index]['id']}',
                            child: Container(
                              height: 100,
                              width: 100,
                              child: Image(
                                image: NetworkImage(_listItem[index]['image']),
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(_listItem[index]['name']),
                              Text(_listItem[index]['description'])
                            ],
                          )
                        ],
                      ),
                      elevation: 10,
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 15);
                },
                itemCount: _listItem.length)
          ],
        ),
      ),
    );
  }
}
