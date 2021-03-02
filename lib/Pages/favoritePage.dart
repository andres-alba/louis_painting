import 'package:flutter/material.dart';
import 'photoupload.dart';
import 'Posts.dart';
import 'package:firebase_database/firebase_database.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<Posts> postList = [];

  @override
  void initState() {
    super.initState();
    DatabaseReference postRef =
        FirebaseDatabase.instance.reference().child("Posts");
    postRef.once().then((DataSnapshot snap) {
      var keys = snap.value.keys;
      var data = snap.value;

      postList.clear();

      for (var individualKey in keys) {
        Posts posts = Posts(
          data[individualKey]['image'],
          data[individualKey]['description'],
          data[individualKey]['date'],
          data[individualKey]['time'],
        );

        postList.add(posts);
      }
      setState(() {
        print('Length: $postList.length');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Painting Blog'),
      ),
      body: Container(
        child: postList.length == 0
            ? Text("No Blog Avaialble")
            : ListView.builder(
                itemCount: postList.length,
                itemBuilder: (_, index) {
                  return postsUI(
                    postList[index].image,
                    postList[index].description,
                    postList[index].date,
                    postList[index].time,
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add_a_photo,
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return PhotoUpload();
          }));
        },
      ),
    );
  }

  Widget postsUI(String image, String description, String date, String time) {
    return Card(
      elevation: 10.0,
      margin: EdgeInsets.all(14.0),
      child: Container(
        padding: EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  date,
                  style: Theme.of(context).textTheme.subtitle2,
                  textAlign: TextAlign.center,
                ),
                Text(
                  time,
                  style: Theme.of(context).textTheme.subtitle2,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Image.network(image, fit: BoxFit.cover),
            SizedBox(height: 10.0),
            Text(
              description,
              style: Theme.of(context).textTheme.subhead,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
