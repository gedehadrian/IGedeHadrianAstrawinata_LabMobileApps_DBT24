import 'dart:ffi';
import 'dart:io';

void main() {
  Account a = Account();
  a.depo(100);
  a.wd(110);
}

class Account {
  double saldo = 0;
  void depo(nilai) {
    saldo += nilai;
    print("saldo sekarang $saldo ");
  }

  void wd(nilai) {
    if (saldo - nilai < 0) {
      print("Saldo Kurang");
    } else
      saldo = saldo - nilai;

    print("saldo sekarang $saldo ");
  }
}
