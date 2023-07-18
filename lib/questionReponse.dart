import 'package:flutter/material.dart';

class Question {
  String question;
  String img_question;
  List<Reponse> propotionList;
  //constructeur
  Question(this.question, this.img_question, this.propotionList);
}

class Reponse {
  String porposition;
  bool isCorrect;
  Reponse(this.porposition, this.isCorrect);
}

List<Question> getQuestionList() {
  List<Question> liste = [];
  liste.add(Question(
    "Comment nomme-t-on le Président du TOGO.",
    "assets/images/prego.jpg",
    [
      Reponse('Dodzi Komla Kokoroko', false),
      Reponse('Faure Gnassingbé', true),
      Reponse('Victoire Tomegah Dogbé', false),
      Reponse('Joe Biden', false),
    ]
  ));
  liste.add(Question(
    "Quelle nation a ce drapeau ?",
    "assets/images/togo.jpg",
    [
      Reponse('Cameroun', false),
      Reponse('Ghana', false),
      Reponse('Togo', true),
      Reponse('Benin', false),
    ]
  ));
  liste.add(Question(
    "Quel est l'entreprise qui a développé l'application MIABE CAMPUS ?",
    "assets/images/campus.jpg",
    [
      Reponse('SOCIAL INFORMATIC', true),
      Reponse('GOOGLE', false),
      Reponse('OTR', false),
      Reponse('UL', false),
    ]
  ));
  liste.add(Question(
    "Quelle communauté possède ce logo ?",
    "assets/images/Tdev.jpg",
    [
      Reponse('MICROSOFT', false),
      Reponse('Ancy', false),
      Reponse('TDEV', true),
      Reponse('MAP', false),
    ]
  ));
  liste.add(Question(
    "Comment appelle-t-on l'application mobile pour ce logo ?",
    "assets/images/gozem.png",
    [
      Reponse('WhatsApp', false),
      Reponse('Uber', false),
      Reponse('GOZEM', true),
      Reponse('GOOGLE MAP', false),
    ]
  ));
  liste.add(Question(
    "Comment appelez-vous les téléphones intelligents possédant cette marque ?",
    "assets/images/iphone.png",
    [
      Reponse('Iphone', true),
      Reponse('Itel', false),
      Reponse('Samsung', false),
      Reponse('Google Pixels', false),
    ]
  ));
  liste.add(Question(
    "Définition d'IAI ?",
    "assets/images/iai.jpg",
    [
      Reponse('Institut Africain d\'Informatique', true),
      Reponse('Institut Americaine d\'Informatique', false),
      Reponse('Institut Africain d\'Information', false),
      Reponse('Information Africain d\'Informatique', false),
    ]
  ));
  liste.add(Question(
    "Quel langage Informatique a cette syntaxe ?",
    "assets/images/html.jpg",
    [
      Reponse('JAVA', false),
      Reponse('PYTHON', false),
      Reponse('DART', false),
      Reponse('HTML', true),
    ]
  ));
  liste.add(Question(
    "Quel est le nom du projet qui apparaît sur l'écran de l'image ?",
    "assets/images/amesiam.jpg",
    [
      Reponse('Amesiamé', true),
      Reponse('ALFA', false),
      Reponse('BETA', false),
      Reponse('DELTA', false),
    ]
  ));
  liste.add(Question(
    "comment s'appelle cette application mobile ?",
    "assets/images/link.png",
    [
      Reponse('Telegram', false),
      Reponse('Twitter', false),
      Reponse('LinkedIn', true),
      Reponse('Instagram', false),
    ]
  ));
  return liste;
}
