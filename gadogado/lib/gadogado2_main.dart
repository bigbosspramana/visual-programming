import 'package:gadogado/gadogado2.dart';
import 'dart:io';

void main () {
  account myAccount = account(1.0);
  while (true) {
    print('==================');
    print('   BIGBOSS BANK   ');
    print('==================');
    print('========================');
    print('   SALDO : Rp.${myAccount.saldo}   ');
    print('========================');
    print('1. Deposit Saldo');
    print('2. Penarikan Saldo');
    print('3. Check Saldo');
    print('4. Penambahan Bunga');
    print('5. Keluar');

    print('Answer : ');
    String answer = stdin.readLineSync()!;
    switch (answer) {
      case '1':
        print('===================');
        print('   DEPOSIT SALDO   ');
        print('===================');
        stdout.write('Jumlah Deposit Saldo : Rp.');
        double? depositSaldo = double.parse(stdin.readLineSync()!);
        myAccount.deposit(depositSaldo);
        break;

      case '2':
        print('===================');
        print('  PENARIKAN SALDO  ');
        print('===================');
        stdout.write('Jumlah Penarikan Saldo : Rp.');
        double? penarikanSaldo = double.parse(stdin.readLineSync()!);
        myAccount.penarikanSaldo(penarikanSaldo);
        break;

      case '3':
        print('===================');
        print('    CHECK SALDO    ');
        print('===================');
        print(myAccount.saldo);
        break;

      case '4':
        print('===================');
        print('    SALDO BUNGA    ');
        print('===================');
        myAccount.Bunga();
        break;

      case '5':
        print('===================');
        print('    KELUAR AKUN    ');
        print('===================');
        print('Terima kasih telah menggunakan BIGBOSS BANK.'); 
        return;

      default :
        print('Pilihan yang Anda masukkan TIDAK VALID.');
    }
  }
}