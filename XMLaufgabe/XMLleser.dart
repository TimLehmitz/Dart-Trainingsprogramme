// https://pub.dev/packages/xml

import 'package:xml/xml.dart';
import 'dart:io';

void main(List<String> args) {
  final file = new File('mondial-europe.xml');
  final document = XmlDocument.parse(file.readAsStringSync());
  // einlesen der XML datei

  print('Car-Code bitte:');
  String? carCode = stdin.readLineSync();
  // abfrage des Car-codes

  var country = document.descendants
      .where((element) => element.getAttribute('car_code') == carCode)
      .first;
  // country wird bestimmt --> ist das erste kind
  // welches den angegebenen car-code als attribute besitzt

// infos

// Staat
  print('Staatname:');
  String staat = country.getElement('name')!.text;
  print(staat);
  // name der country

//Carcode
  print('Car_code:');
  String? car_code = country.getAttribute('car_code');
  print(car_code);
  // attribute car_code der country

// Sprachen
  print('Sprachen:');
  String sprachen = '';
  var spracheniter = country.findElements('language');
  for (int i = 0; i < spracheniter.length; i++) {
    if (i == 0) {
      sprachen = sprachen + spracheniter.elementAt(i).text;
    } // das erste element
    else {
      sprachen = sprachen + ', ' + spracheniter.elementAt(i).text;
    } // fuer jedes weitere element
  }
  print(sprachen);

// Area
  print('Fläche:');
  String area = country.getAttribute('area')!;
  print(area + 'km²');
  // area attribut der country

// Hauptstadt
  print('Hauptstadt:');
  String capitalid = country.getAttribute('capital')!;
  // capital id aus den attributen der country

  String capital = country
      .findAllElements('city')
      .where((element) => element.getAttribute('id') == capitalid)
      .first
      .getElement('name')!
      .text;
  print(capital);
  // das erste element city welches das attribute id mit der captitalid hat

//elvation citys
  String maxEleCity = '';
  int maxEle = -1000;
  // variabeln festlegen

  var cityiter = country.findAllElements('city');
  // iterator der alle citys der country enthaelt

  for (int i = 0; i < cityiter.length; i++) {
    int elvation;

    String city = cityiter.elementAt(i).getElement('name')!.text;

    if (cityiter.elementAt(i).findElements('elevation').isNotEmpty) {
      // wenn die city das evelation element besitzt

      elvation = int.parse(cityiter.elementAt(i).getElement('elevation')!.text);
    } else {
      // falls nicht kann die city nicht bewertet werden
      elvation = -1000;
    }
    if (elvation > maxEle) {
      // wenn die elevation groeßer ist
      // als das bisherige max dann wird das max auf diese stadt gesetzt
      maxEleCity = city;
      maxEle = elvation;
    } else if (elvation > maxEle) {
      // falls es citys mit gleicch grßer elevation gibt
      maxEleCity = maxEleCity + ' und ' + city;
    }
  }
  print('Hoechste Stadt: ' + maxEleCity + ' mit ' + maxEle.toString() + 'm');
  // ausgabe der city mit dazugehoerigen elevation
}
/*
CarCode                attribut car_code
Name                   country--> name
Fläche des Landes      attribut area
Name der Hauptstadt    attribut capital
Sprachen               country--> language
höchstgelegene Stadt (größte elevation) --> city elevation
*/
