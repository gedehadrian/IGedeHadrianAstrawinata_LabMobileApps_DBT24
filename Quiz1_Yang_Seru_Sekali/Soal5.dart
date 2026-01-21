import 'dart:io';

class Ujian {
  int totalNilai = 0;

  void tambahNilai() {
    for (int i = 0; i < 3; i++) {
      stdout.write("Masukan Nama: ");
      String? nama = stdin.readLineSync();

      stdout.write("Masukan Nilai: ");
      String? inputNilai = stdin.readLineSync();

      int nilaiAngka = int.tryParse(inputNilai ?? "") ?? 0;

      totalNilai += nilaiAngka;
    }
  }

  double rata() {
    return totalNilai / 3;
  }
}

void main() {
  Ujian avg = Ujian();

  avg.tambahNilai();

  print("Total Nilai: ${avg.totalNilai}");
  print("Rata-rata: ${avg.rata().toStringAsFixed(2)}");
}
