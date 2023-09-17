import 'package:flutter/material.dart';
void main(){
  runApp(const HomeScreen());
}
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListScreen(



      ),
    );
  }
}

class AFF {
  final String textA;
  final IconData iconk;
  final IconData iconb;

  AFF({required this.textA, required this.iconk,required this.iconb});

}
class ListScreen extends StatelessWidget {
  ListScreen({super.key});

  List<AFF> myList = [

    AFF(
      textA: 'idea',
      iconk: Icons.lightbulb,
      iconb: Icons.label_important_outline_rounded,
    ),
    AFF(
      textA: 'food',
      iconk: Icons.fastfood,
      iconb: Icons.label_important_outline_rounded,
    ),
    AFF(
      textA: 'work',
      iconk: Icons.work,
      iconb: Icons.label_important_outline_rounded,
    ),
    AFF(
      textA: 'sport',
      iconk: Icons.sports_basketball,
      iconb: Icons.label_important_outline_rounded,
    ),
    AFF(
      textA: 'music',
      iconk: Icons.music_video,
      iconb: Icons.label_important_outline_rounded,
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: myList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TextPage(
                    textA: myList[index].textA,
                  );
                }
                ),
                );
              },

              tileColor: Colors.grey,

              leading:
              Icon(
                myList[index].iconk,
                color: Colors.deepPurple,
              ),
              trailing: Icon(
                myList[index].iconb,
                color: Colors.deepPurple,
              ),


              title: Text(

                myList[index].textA,

              ),
            ),
          );
        },
      ),
    );
  }
}

class TextPage extends StatelessWidget {
  final String textA;
  const TextPage({super.key, required this.textA});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          textA,
        ),

      ),
    );

  }
}