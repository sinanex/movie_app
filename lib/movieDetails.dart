import 'package:flutter/material.dart';

class MovieDetails extends StatelessWidget {
   MovieDetails({super.key});
 Widget movieIcons(Widget? icons) {
  return IconButton(
    iconSize: 40, 
    color: Colors.white,  
    onPressed: () {},  
    icon: icons!, 
  );
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
    body: ListView(
      children: [
        Container(
          width: double.infinity,
          height: 250,
          child: Image.network('https://qph.cf2.quoracdn.net/main-qimg-0c7dc3e7da219c0f260ce2ec77894f59-pjlq'),
        ),
         Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            movieIcons(Icon(Icons.download_rounded)),
            movieIcons(Icon(Icons.play_circle)),
          ],
         ),
        
        const ListTile(
           title: Text("Money Heist",
           style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
           ),),
           subtitle: Text("Eight thieves take hostages and lock themselves in the Royal Mint of Spain as a criminal mastermind manipulates the police to carry out his plan"),
         ),
      ],
    )
    );
  }
}