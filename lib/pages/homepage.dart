import 'package:flutter/material.dart';
import 'about.dart';
import 'gratitude.dart';

//Homapage of the app in Stateful to manage its state
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

//State of the homepage
class _HomePageState extends State<HomePage> {

  String howAreYou = "..."; //will contain the answer on the Gratitude page

  //method to open the About page
  void _openPageAbout({required BuildContext context, bool fullscreenDialog = false}) {
    //utilisation de la classe Navigator pour gérer la navigation entre les pages
    Navigator.push(
      context, //Le contexte de l'application, nécessaire pour la navigation.

      //Utilisation de la classe MaterialPageRoute pour spécifier la transition 
      //vers la nouvelle page
      MaterialPageRoute(
        fullscreenDialog: fullscreenDialog, //Indique si la nouvelle page doit être afficher
        //en mode plein écran
        builder: (context) => const About(), //Le constructeur de la nouvelle page, ici
        //une instance de la classe About()
      ),
    );
  }

  //asynchron method to open the gratitude page waiting the value of gratifulReponse
  void _openPageGratitude({required BuildContext context, bool fullscreenDialog = false}) async {
    //Using the Navigator class to manage the navigation between pages
    final String? gratifulReponse = await Navigator.push(
      context, 
      MaterialPageRoute(
        fullscreenDialog: fullscreenDialog,
        builder: (context) => const Gratitude(
          radioGroupValue : -1,
        ),
        ),
      );

      //Update the value of 'howAreYou' with the answer on the gratitude page
      //use an empty string if the answer is null
      if (gratifulReponse != null){
        setState(() {
          howAreYou = gratifulReponse;
        });
      }
  }

  //UI constructor
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigator'),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            onPressed: () => _openPageAbout(
              context : context,
              fullscreenDialog : true, 
            ), 
            icon: const Icon(Icons.info_outline),
            ),
        ],
      ),

      body:  SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Grateful for : $howAreYou', style: const TextStyle(fontSize: 30.0),
          ),
        ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openPageGratitude(context: context),
        tooltip: 'About',
        child: const Icon(Icons.sentiment_satisfied),
      ),
    );
  }
}