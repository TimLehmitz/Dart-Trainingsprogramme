import 'dart:io';

void main(List<String> args) {
  // map zum einfachewn uebersetzen der buchstaben in morse code
  Map morsemap = {
    ' ': ' ', // Pause nach Wortende
    'a': '•-',
    'b': '-•••',
    'c': '-•-•',
    'd': '-••',
    'e': '•',
    'f': '••-•',
    'g': ' --•',
    'h': '••••',
    'i': '••',
    'j': '•---',
    'k': '-•-',
    'l': '•-••',
    'm': '--',
    'n': '-•',
    'o': '---',
    'p': '•--•',
    'q': '--•-',
    'r': '•-•',
    's': '•••',
    't': '-',
    'u': '••-',
    'v': '•••-',
    'w': '•--',
    'x': '-••-',
    'y': '-•--',
    'z': '--••',
    '0': '-----',
    '1': '•----',
    '2': '••---',
    '3': '•••--',
    '4': '••••-',
    '5': '•••••',
    '6': '-••••',
    '7': '--•••',
    '8': '---••',
    '9': '----•',
  };

  while (true) {
    String text = eingabe();
    String Ausgabestring = verarbeitung(morsemap, text);

    // Ausgabe
    print('Dein Klartext war: ' + text); // Klartext
    print('Morsecode: ' + Ausgabestring); // Morsecode
  }
}

String eingabe() {
  //Eingabe
  print('Bitte Text eingeben(a-z und 1-9)(* to exit)');
  String? text = stdin.readLineSync();

  if (text == '*') {
    print('Programm beendet');
    exit(0);
  }

  //Text aufbereitung
  text = text!.toLowerCase();
  if (text.length > 200) {
    print('Text ist zu lang bitte nicht mehr als 200 Zeichen eingeben!');
    return '';
  }

  return text;
}

String verarbeitung(Map morsemap, String text) {
  //Verarbeitung
  String morsestring = '';
  for (int i = 0; i < text.length; i++) {
    morsestring = morsestring + morsemap[text[i]] + ' ';
  }
  // der buchstabe wird durchgenommen
  // morsestring wird erweitert um den Morseecode des Buchstaben sowie einem leerzeichen
  // wenn ein leerzeichen im text auftaucht wird dies als ' ' *doppeltes Leerzeichen geschrieben
  // --> damit ist nach jewdem Buchstaben 1Pause und nach Wortende 3Pausen

  return morsestring;
}

// morsemap mit . und -

/*
  Map morsemap = {
    ' ': ' ', // Pause nach Wortende
    'a': '.-',
    'b': '-...',
    'c': '-.-.',
    'd': '-..',
    'e': '.',
    'f': '..-.',
    'g': ' --.',
    'h': '....',
    'i': '..',
    'j': '.---',
    'k': '-.-',
    'l': '.-..',
    'm': '--',
    'n': '-.',
    'o': '---',
    'p': '.--.',
    'q': '--.-',
    'r': '.-.',
    's': '...',
    't': '-',
    'u': '..-',
    'v': '...-',
    'w': '.--',
    'x': '-..-',
    'y': '-.--',
    'z': '--..',
    '0': '-----',
    '1': '.----',
    '2': '..---',
    '3': '...--',
    '4': '....-',
    '5': '.....',
    '6': '-....',
    '7': '--...',
    '8': '---..',
    '9': '----.',
  };
  */