import 'dart:io';

void main() {
  prima();
}

void prima() {
  stdout.write("Masukkan angka: ");
  String? angka = stdin.readLineSync();
  int angkaInt = int.tryParse(angka ?? "") ?? 0;
  var condition = true;

  if (angkaInt <= 1) {
    condition = false;
  } else {
    for (int i = 2; i < angkaInt; i++) {
      if (angkaInt % i == 0) {
        condition = false;
        break;
      }
    }
  }

  if (condition) {
    print("Prima");
  } else {
    print("Bukan Prima");
  }
}
