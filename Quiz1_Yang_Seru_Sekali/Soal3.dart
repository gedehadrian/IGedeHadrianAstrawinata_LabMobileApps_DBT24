import 'dart:io';
import 'dart:math';

void main() {
  var cobaan = 0;
  final random = Random();
  int intFinal = random.nextInt(100) + 1;
  while (true) {
    String? jawaban = stdin.readLineSync();
    if (intFinal == jawaban) {
      print("Jawaban Benar = $intFinal, jumalah percobaan $cobaan");
      break;
    }
    if (intFinal != jawaban) {
      print("Salah");
      cobaan += 1;
      continue;
    }
  }
}
