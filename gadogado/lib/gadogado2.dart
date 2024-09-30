class BankAccount {
  double _saldo = 0.0;

  double get balance => _saldo;

  set balance(double tambahSaldo) {
    if (tambahSaldo >= 0) {
      _saldo = tambahSaldo;
    } else {
      print("Saldo tidak bisa negatif.");
    }
  }

  void deposit (double tambahSaldo) {
    if (tambahSaldo > 0) {
      _saldo += tambahSaldo;
      print('Deposit Senilai Rp.$_saldo');
    } else {
      print ('Saldo yang Anda tambahkan Rp.$tambahSaldo');
    }
  }

  void penarikanSaldo (double tambahSaldo) {
    if (tambahSaldo >= 0 && tambahSaldo <= _saldo  ) {
      _saldo -= tambahSaldo;
      print('Sisa Saldo Senilai Rp.$_saldo');
    } else {
      print ('Saldo yang Anda tambahkan Rp.$tambahSaldo');
    }
  }

  double get saldo {
    return _saldo;
  }
}

class account extends BankAccount {
  double sukuBunga;

  account(this.sukuBunga);

  void Bunga() {
    double hasilBunga = saldo * (sukuBunga / 100);
    deposit(hasilBunga); 
    print('Interest applied: ${hasilBunga}');
  }
}

