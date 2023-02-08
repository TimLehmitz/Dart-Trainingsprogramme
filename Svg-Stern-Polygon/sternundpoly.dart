import 'dart:io';
import 'dart:math' as math;

void main() {
  print('Polygon oder Stern?(polygon/stern)');
  String? Aufgabe = stdin.readLineSync();

  if (Aufgabe!.toLowerCase() == 'polygon') {
    PrintPolygon();
  } else if (Aufgabe.toLowerCase() == 'stern') {
    PrintStern();
  } else {
    print('ungueltige Eingabe');
  }
}

PrintPolygon() {
  /*um 5, 8, 10, 15, 18 und 30 Ecken zu erzeugen einfach die gewuenschte
   eckenzahl bei "Eckenzahl:" angeben  */

  //liste der koordinaten des polygons
  var polylist = [];

  //Eingabe Parameter
  print('Eckenzahl:');
  int ecken = int.parse(stdin.readLineSync()!);

  print('X-position:');
  int xposi = int.parse(stdin.readLineSync()!);

  print('Y-position:');
  int yposi = int.parse(stdin.readLineSync()!);

  print('Radius:');
  double radius = double.parse(stdin.readLineSync()!);

  //Winkelvariabelen festlegen
  double winkel = 360 / ecken;
  double drehwinkel = winkel;

  // Polygon
  //dreht sich einmal erzeugt somit alle koordinaten
  for (int i = 0; i < ecken; i++) {
    double xout = (math.sin((drehwinkel / 360) * 2 * math.pi) * radius) + xposi;
    double yout = (math.cos((drehwinkel / 360) * 2 * math.pi) * radius) + yposi;

    polylist.add(xout);
    polylist.add(yout);

    drehwinkel = drehwinkel + winkel;
  }
  String polydaten =
      polylist.join(','); // macht das keine [] beim print auftauchen

  //Ausgabe
  String polystring =
      '<polygon points= "$polydaten" style="fill:red;stroke:black;stroke-width:2" />';
  print(polystring);
}

PrintStern() {
  //liste der koordinaten des sterns
  var sternlist = [];

  //Eingabe Parameter
  print('Spitzenanzahl:');
  int spitzen = int.parse(stdin.readLineSync()!);

  print('X-position:');
  int xposi = int.parse(stdin.readLineSync()!);

  print('Y-position:');
  int yposi = int.parse(stdin.readLineSync()!);

  print('Radius:');
  double radius = double.parse(stdin.readLineSync()!);

  print('Verhältnis Innenecken(zwischen 0 und 1 z.B.: 0.5):');
  double innenscale = double.parse(stdin.readLineSync()!);

  //Winkelvariabelen festlegen
  double winkel = 360 / spitzen;
  double outdrehwinkel = winkel;
  double inndrehwinkel = winkel / 2;

  //  Stern
  //dreht sich einmal erzeugt somit alle koordinaten
  // ausssen und innen ()innen verschoben um winkel/2
  for (int i = 0; i < spitzen; i++) {
    double xinn = (math.sin((inndrehwinkel / 360) * 2 * math.pi) *
            (radius * innenscale)) +
        xposi;
    double yinn = (math.cos((inndrehwinkel / 360) * 2 * math.pi) *
            (radius * innenscale)) +
        yposi;

    sternlist.add(xinn);
    sternlist.add(yinn);

    double xout =
        (math.sin((outdrehwinkel / 360) * 2 * math.pi) * radius) + xposi;
    double yout =
        (math.cos((outdrehwinkel / 360) * 2 * math.pi) * radius) + yposi;

    sternlist.add(xout);
    sternlist.add(yout);

    outdrehwinkel = outdrehwinkel + winkel;
    inndrehwinkel = inndrehwinkel + winkel;
  }

  String sterndaten =
      sternlist.join(','); // macht das keine [] beim print auftauchen

  //Ausgabe
  String sternstring =
      '<polygon points= "$sterndaten" style="fill:gold;stroke:yellow;stroke-width:2" />';
  print(sternstring);
}
