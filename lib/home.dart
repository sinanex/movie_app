import 'package:flutter/material.dart';
import 'package:movie/login.dart';
import 'package:movie/movieDetails.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Map<String, String>> movieList = [
    {"title": "Stranger Things", "subtitle": "series"},
    {"title": "Money Heist", "subtitle": "series"},
    {"title": "interstaller", "subtitle": "movie"},
    {"title": "oppenheimer", "subtitle": "movie"},
    {"title": "dark", "subtitle": "series"},
    {"title": "wednesday", "subtitle": "movie"},
    {"title": "your name", "subtitle":"anime movie"},
    {"title": "lost", "subtitle":"series"},
    {"title":"Game of Thrones","subtitle":"series"},
    {"title":"peaky blinders","subtitle":"series"},
    {"title":"whethering with you","subtitle":"anime movie"},
    {"title":"Green Book","subtitle":"movie"},
    {"title":"manjummal boys","subtitle":"movie"},
    {"title":"premalu","subtitle":"movie"}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: IconButton(onPressed: (){
Navigator.pushAndRemoveUntil(
  context, 
  MaterialPageRoute(builder: (context) => LoginPage()), 
  (Route<dynamic> route) => false,
);

              }, icon: Icon(Icons.logout)),
            )
          ],
          automaticallyImplyLeading: false,
          title:const Text(
            "movies",
            style: TextStyle(
              fontSize: 30,
              color: Colors.red,
            ),
          ),
        ),
        body: Container(
          
          child: ListView.builder(
            scrollDirection: Axis.vertical,
              itemCount: movieList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MovieDetails()));
                  },
                  leading: Icon(Icons.movie),
                  trailing: Icon(Icons.arrow_forward_ios_outlined),
                  title: Text(movieList[index]["title"]!,style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),),
                  subtitle: Text(movieList[index]['subtitle']!,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),),
                );
              }),
        ));
  }
}
