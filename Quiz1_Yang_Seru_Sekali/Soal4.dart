import 'dart:io';

void main() {
  prima();
}

void prima() {
  int? angka = stdin.readByteSync();
  var condition = true;

  for (int i = 0; i <= angka; i++) {
    if (angka % i == 0 && i != angka) {
      condition = false;
    }
  }

  if (condition == false) {
    print("Prima");
  } else {
    print("Bukan Prima");
  }
}
