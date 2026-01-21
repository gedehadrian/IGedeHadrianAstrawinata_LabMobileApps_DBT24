void main() {
  perfect(28);
  perfect(6);
  perfect(21);
}

void perfect(nilai) {
  int initial = 0;
  for (int i = 1; i < nilai; i++) {
    if (nilai % i == 0) {
      initial += i;
    }
  }
  if (initial == nilai) {
    print("True");
  } else
    print("False");
}
