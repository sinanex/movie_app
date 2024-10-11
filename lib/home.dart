import 'package:flutter/material.dart';
import 'package:movie/login.dart';
import 'package:movie/splashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';



class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Map<String, String>> movieList = [
    {"title": "Stranger Things", "subtitle": "series"},
    {"title": "Money Heist", "subtitle": "series"},
    {"title": "interstaller", "subtitle": "movie"},
    {"title": "oppenheimer", "subtitle": "movie"},
    {"title": "dark", "subtitle": "series"},
    {"title": "wednesday", "subtitle": "movie"},
    {"title": "your name", "subtitle": "anime movie"},
    {"title": "lost", "subtitle": "series"},
    {"title": "Game of Thrones", "subtitle": "series"},
    {"title": "peaky blinders", "subtitle": "series"},
    {"title": "whethering with you", "subtitle": "anime movie"},
    {"title": "Green Book", "subtitle": "movie"},
    {"title": "manjummal boys", "subtitle": "movie"},
    {"title": "premalu", "subtitle": "movie"}
  ];
  Future<void> getname()async{
  SharedPreferences pref = await SharedPreferences.getInstance();
 String? name = pref.getString('userId');


}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: IconButton(
                  onPressed: () {
                    clearPref();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                      (Route<dynamic> route) => false,
                    );
                  },
                  icon: const Icon(Icons.logout)),
            )
          ],
          automaticallyImplyLeading: false,
          title: const Text(
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
                  onTap: () {
                    Navigator.pushNamed(context, '/movie');
                  },
                  leading: const Icon(Icons.movie),
                  trailing: const Icon(Icons.arrow_forward_ios_outlined),
                  title: Text(
                    movieList[index]["title"]!,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    movieList[index]['subtitle']!,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }),
        ));
  }

  Future<void> clearPref() async {
    SharedPreferences clearData = await SharedPreferences.getInstance();
    clearData.remove(key_login);
  }
}
