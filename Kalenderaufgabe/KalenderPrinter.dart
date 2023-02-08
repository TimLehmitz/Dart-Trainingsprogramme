import 'dart:io';

void main() {
  // input Zeug
  print('Monat bitte(1-12): ');
  int monat = int.parse(stdin.readLineSync()!); // eingabe monat als int
  print('Starttag(1-7): ');
  int startTag = int.parse(stdin.readLineSync()!); // eingabe startTag als int
  printCalendar(startTag, monat); //Kalender erzeugen und Ausgeben
}

void printCalendar(int startTag, int monat) {
  //  uebergebende Variabelen sind der Starttag und der Monat

  //  variablen festlegen
  String monatString = ''; // leerer String wird spaeter gefuellt
  int tagZahl; // zahl der Tage wird spater festgelegt
  int tag = 2 - startTag;
  /*  der tag mit dem beim erzeugen des zeile-Strings
      ist "2 - startTag"
    starttag = 6
    tag = 2 - startTag
    tag --> -4
    
     -4 -3 -2 -1  0
    |MO|DI|MI|DO|FR|SA|SO|
    |  |  |  |  |  | 1| 2|
    | 3| 4| 5| 6| 7| 8| 9|
    |10|11|12|13|14|15|16|
    |17|18|19|20|21|22|23|
    |24|25|26|27|28|29|30|
    somit wird die 1 beim gewählten starttag von 6 auf den 6.Tag(Samstag gelegt) 
  */

  // bestimmung der Monatslänge anhand des angegebenen Monats
  // Tage mit 31/28/30 unterscheiden
  if (monat == 1 ||
      monat == 3 ||
      monat == 5 ||
      monat == 7 ||
      monat == 8 ||
      monat == 10 ||
      monat == 12) {
    // Monate mit 31 tagen --> Januar, März, Mai, Juli, August, Oktober, Dezember

    tagZahl = 31;
  } else if (monat == 2) {
    // Monate mit 28 tagen --> Februar

    tagZahl = 28;
  } else {
    // Monate mit 30 tagen --> April, Juni, September, November
    tagZahl = 30;
  }

  // Schleifen
  for (int j = 0; j < 6; j++) {
    // Schleifen für die maximal erreichbare Wochenanzahl von 6 wochen
    /*|MO|DI|MI|DO|FR|SA|SO|
      |  |  |  |  |  | 1| 2| <--1
      | 3| 4| 5| 6| 7| 8| 9| <--2
      |10|11|12|13|14|15|16| <--3
      |17|18|19|20|21|22|23| <--4
      |24|25|26|27|28|29|30| <--5
      |31|  |  |  |  |  |  | <--6
    
    */

    for (int i = 0; i < 7; i++) {
      // Schleifen für 7tage pro woche
      /*
      |MO|DI|MI|DO|FR|SA|SO|
      | 1| 2| 3| 4| 5| 6| 7|
      */

      if (tag > 0 && tag < 10) {
        // für die tag 1 bis 9  wird ein Leerzeichen eingefügt damit
        //die Trennlinien immer an der gleichen Zeile sind

        monatString = '$monatString|'; // trennline einfuegen
        monatString = '$monatString $tag';
        /* 
          den Tag anfuegen mit Leerzeichen
          damit die Trennzeichen immer in der gleichen Spalte sind
          Damit folgendes NICHT entsteht:
          |1|2|3|4|5|6|7|
          |8|9|10|11|12|13|14|

        */

        tag++; // einen Tag weiterspringen
      } else if (tag <= tagZahl && tag > 9) {
        // für alle tage von 10 bis Monatsende(z.B Januar -->Tag 31)

        monatString = '$monatString|'; // trennline einfuegen
        monatString = '$monatString$tag'; // den Tag anfuegen
        tag++; //  einen Tag weiterspringen
      } else {
        // falls der tag nicht zwischen 1 bis Monatsende liegt

        monatString = '$monatString|'; // trennline einfuegen
        monatString = '$monatString  '; // 2 Leerzeichen einfügen
        tag++; // tag weiterspringen
      }
    }
    // zeilenende
    monatString = '$monatString|'; // schließt zeile mit | ab
    monatString = '$monatString\n'; // \n erzeugt zeilenumbruch
    // damit kann der gesamte Monat in einem String gespeichert werden

    if (tag > tagZahl) {
      // bricht ab wenn die zeile mit dem monatsendtag erreicht ist

      break;
    }
  }

  // Ausgabe
  print('|MO|DI|MI|DO|FR|SA|SO|'); // Kopf der immer gleich ist
  print(monatString); // erzeugter Monat
}
