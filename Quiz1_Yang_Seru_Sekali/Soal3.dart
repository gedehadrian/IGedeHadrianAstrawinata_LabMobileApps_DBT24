import 'dart:io';
import 'dart:math';

void main() {
  final random = Random();
  final int target = random.nextInt(100) + 1;
  int percobaan = 0;

  print("Tebak angka antara 1 sampai 100!");

  while (true) {
    stdout.write("Masukkan tebakan Anda: ");
    String? input = stdin.readLineSync();
    int? tebakan = int.tryParse(input ?? "");

    if (tebakan == null) {
      print("Masukkan angka yang valid.");
      continue;
    }

    percobaan++;

    if (tebakan == target) {
      print("Selamat! Jawaban benar: $target.");
      print("Total percobaan: $percobaan");
      break;
    } else if (tebakan < target) {
      print("Terlalu rendah!");
    } else {
      print("Terlalu tinggi!");
    }
  }
}
