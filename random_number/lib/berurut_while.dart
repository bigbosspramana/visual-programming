import 'package:random_number/berurut_while1.dart';
import 'package:random_number/berurut_while2.dart';

piramid_while(numbers) {
  int arrayLength = numbers.length;
      int i = 0;
      while (i < 7) {
        var stars = '';

        int j = (7 - i);
        
        stars = berurut_while1(arrayLength, i, j, numbers);

        var row = berurut_while2(i, j, numbers, arrayLength);
        print(stars + row.trim());
        i++;
      }
}