import 'dart:io';
import 'dart:math';

void main() {
  final random = Random();
  List<String> pilihan = ["gunting", "batu", "kertas"];

  int randChoice = random.nextInt(3) - 1;

  while (true) {
    stdout.write("Masukan ( Gunting, Batu, Kertas) : ");
    String? input = stdin.readLineSync();

    if (input == null) continue;

    if (input == "exit") {
      break;
    }
    if (input == pilihan[randChoice]) {
      print("Kamu Keren Benar Sekali Brody");
      break;
    } else {
      print("Salah Bro");
    }
  }
}
