import 'dart:io';

class Ujian {
  int totalNilai = 0;

  void tambahNilai() {
    for (var i = 0; i < 3; i++) {
      stdout.write("Masukan Nama: ");
      stdin.readLineSync();

      stdout.write("Masukan Nilai: ");
      var input = stdin.readLineSync() ?? "";
      int nilaiAngka = int.tryParse(input) ?? 0;

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
