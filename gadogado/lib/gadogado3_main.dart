import 'dart:io';
import 'package:gadogado/gadogado3.dart';

void main() {
  ATM atmacc = ATM();

  while (true) {
    print('==================');
    print('   BIGBOSS BANK   ');
    print('==================');
    print('========================');
    print('   SALDO : Rp.${atmacc.balance}   ');
    print('========================');
    print('1. Deposit Saldo');
    print('2. Penarikan Saldo');
    print('3. Check Saldo');
    print('4. Keluar');

    print('Answer : ');
    String answer = stdin.readLineSync()!;
    switch (answer) {
      case '1':
        print('===================');
        print('   DEPOSIT SALDO   ');
        print('===================');
        stdout.write('Jumlah Deposit Saldo : Rp.');
        double? depositSaldo = double.parse(stdin.readLineSync()!);
        atmacc.deposit(depositSaldo);
        break;

      case '2':
        print('===================');
        print('  PENARIKAN SALDO  ');
        print('===================');
        stdout.write('Jumlah Penarikan Saldo : Rp.');
        double? penarikanSaldo = double.parse(stdin.readLineSync()!);
        atmacc.penarikanSaldo(penarikanSaldo);
        break;

      case '3':
        print('===================');
        print('    CHECK SALDO    ');
        print('===================');
        print(atmacc.balance);
        break;

      case '4':
        print('===================');
        print('    KELUAR AKUN    ');
        print('===================');
        print('Terima kasih telah menggunakan BIGBOSS BANK.');
        return;

      default:
        print('Pilihan yang Anda masukkan TIDAK VALID.');
    }
  }
}
