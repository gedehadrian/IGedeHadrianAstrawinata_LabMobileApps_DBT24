import 'dart:io';
import 'dart:math';

void main() {
  final random = Random();
  List<String> pilihan = ["gunting", "batu", "kertas"];

  while (true) {
    stdout.write("\nMasukan (gunting, batu, kertas) atau 'exit': ");
    String? input = stdin.readLineSync()?.toLowerCase();

    if (input == "exit") break;
    if (input == null || !pilihan.contains(input)) {
      print("Pilihan tidak valid!");
      continue;
    }

    String bot = pilihan[random.nextInt(3)];
    print("Komputer memilih: $bot");

    if (input == bot) {
      print("Hasil: SERI!");
    } else if ((input == "gunting" && bot == "kertas") ||
        (input == "batu" && bot == "gunting") ||
        (input == "kertas" && bot == "batu")) {
      print("Hasil: KAMU MENANG! Kamu Keren Brody");
    } else {
      print("Hasil: KAMU KALAH! Coba lagi ya.");
    }
  }
}
