import 'package:dynamic_list_element/read_more_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

import 'custom_icons_icons.dart';

class ListDisplay extends StatefulWidget {
  @override
  _ListDisplayState createState() => _ListDisplayState();
}

class _ListDisplayState extends State<ListDisplay> {

  String _date = "31-08-2019";
  int _clapCount = 24;
  int _commentCount = 15;
  int _viewCount = 150;
  String _paragraph = "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.";


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Dynamic list"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: StaggeredGridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          staggeredTiles: [
            StaggeredTile.fit(4),
            StaggeredTile.count(3, 2),
            StaggeredTile.count(1, 1),
            StaggeredTile.count(1, 1),
            StaggeredTile.count(1, 1),
            StaggeredTile.fit(3),
            StaggeredTile.fit(3),
            StaggeredTile.fit(3),
          ],
          children: <Widget>[
            _profileView(),
            _myPhotoList(
                "https://images.unsplash.com/photo-1542998967-692be9110b46?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
            _myPhotoList(
                "https://images.unsplash.com/photo-1550496913-b1a19c3779e9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
            _myPhotoList(
                "https://images.unsplash.com/photo-1525344387229-da3782d11618?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
            _myPhotoList(
                "https://images.unsplash.com/photo-1531496074234-6db4f0226092?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
            _buttonRow(),
            _reactionText(_clapCount, _commentCount, _viewCount),
            _myPara(_paragraph, width, _date),

          ],
        ),
      ),
    );
  }
}

//Reaction button row
Widget _buttonRow() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      IconButton(icon: Icon(CustomIcons.clapping), onPressed: () {}),
      IconButton(
        icon: Icon(OMIcons.message),
        onPressed: () {},
      ),
      IconButton(icon: Icon(OMIcons.shoppingCart), onPressed: () {}),
    ],
  );
}

//Reaction Text
Widget _reactionText(int claps, int comments, int views) {
  return Row(
    children: <Widget>[
      Text("$claps Claps\t\t."),
      Text("\t\t$comments Comments\t\t."),
      Text("\t\t$views Views")
    ],
  );
}

//Paragraph
Widget _myPara(String para, double width, String date) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      SizedBox(height: 8.0),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: width*0.80,
            child: ReadMoreText(
              '$para',
              trimLines: 3,
              colorClickableText: Colors.grey,
              trimMode: TrimMode.Line,
              trimCollapsedText: '...Show more',
              trimExpandedText: ' show less',
            ),
          ),
          _circleImage(null)
        ],
      ),
      Text("$date", style: TextStyle(fontSize: 11),) //
    ],
  );
}

//ProfileView
Widget _profileView() {
  return Card(
    elevation: 0,
    child: Column(
      children: <Widget>[
        Container(
          child: ListTile(
            leading: _circleImage(null),
            title: Text("Rangana Udara"),
            subtitle: Text("Vegitables"),
          ),
        ),
      ],
    ),
  );
}

//Circular image component
Widget _circleImage(String url) {
  Widget image;

  if (url == null) {
    image = CircleAvatar(
      child: Image(image: AssetImage('assets/images/user.png')),
      maxRadius: 25.0,
      minRadius: 5.0,
      backgroundColor: Colors.transparent,
    );
  } else {
    image = CircleAvatar(
      backgroundImage: NetworkImage(url),
    );
  }

  return image;
}

//Image
Widget _myPhotoList(String imageUrl) {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.fill,
        image: NetworkImage(imageUrl),
      ),
    ),
  );
}
