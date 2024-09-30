class ATM {
  double _saldo = 0.0;

  double get balance => _saldo;

  set balance(double tambahSaldo) {
    if (tambahSaldo >= 0) {
      _saldo = tambahSaldo;
    } else {
      print("Saldo tidak bisa negatif.");
    }
  }

  void deposit(double tambahSaldo) {
    if (tambahSaldo > 0) {
      _saldo += tambahSaldo;
      print("Anda telah menyetor: \$${tambahSaldo}. Saldo sekarang: \$${balance}");
    } else {
      print("Jumlah setoran harus lebih dari nol.");
    }
  }

  void penarikanSaldo(double tambahSaldo) {
    if (tambahSaldo > 0 && tambahSaldo <= _saldo) {
      _saldo -= tambahSaldo;
      print("Anda telah menarik: \$${tambahSaldo}. Saldo sekarang: \$${balance}");
    } else {
      print("Jumlah penarikan tidak valid.");
    }
  }
}
