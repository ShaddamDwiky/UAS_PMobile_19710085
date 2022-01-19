import 'package:flutter/material.dart';
import 'package:app_uas_19710085/components/customListTile.dart';
import 'package:app_uas_19710085/model/article_model.dart';
import 'package:app_uas_19710085/services/api_service.dart';
import 'package:app_uas_19710085/profile/profile.dart';
import 'dart:async';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: new HomePage(),
);
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.amberAccent.shade100,
        appBar: new AppBar(
          backgroundColor: Colors.deepOrangeAccent.shade400,
          title: new Text('Home view'),
        ),
      body: Container(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: [
              IconButton(
                icon: new Icon(Icons.science, color: Colors.black54),
                onPressed: () {
                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new HomePage2()));
                },
                iconSize: 100.0,
              ),
              Text("Berita Science")
            ],
          ),
          Column(
            children: [
              IconButton(
                icon: new Icon(Icons.sports, color: Colors.red),
                onPressed: () {
                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new HomePage3()));
                },
                iconSize: 100.0,
              ),
              Text("Berita Olahraga")
            ],
          ),
          Column(
            children: [
              IconButton(
                icon: new Icon(Icons.contact_mail_outlined, color: Colors.black),
                onPressed: () {
                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new profile()));
                },
                iconSize: 100.0,
              ),
              Text("Profile")
            ],
          )
        ],
      )),
      ),
      initialRoute: "/",
      );
  }
}


 class HomePage2 extends StatefulWidget {
  @override
  _berita_bisnis createState() => new _berita_bisnis();
}


class _berita_bisnis extends State<HomePage2> {
  ApiService_bisnis client = ApiService_bisnis();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text("Berita Science", style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white),
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            List<Article> articles = snapshot.data;
            return ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) =>
                    customListTile(articles[index], context));
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class HomePage3 extends StatefulWidget {
  @override
  _berita_olahraga createState() => new _berita_olahraga();
}

class _berita_olahraga extends State<HomePage3> {
  ApiService_sport client = ApiService_sport();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text("Berita Olahraga", style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white),
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            List<Article> articles = snapshot.data;
            return ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) =>
                    customListTile(articles[index], context));
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}