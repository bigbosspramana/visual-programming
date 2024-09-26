import 'package:random_number/piramida_while1.dart';
import 'package:random_number/piramida_while2.dart';

piramid_while(List<int> numbers) {
  int arrayLength = numbers.length;
      int i = 0;
      while (i < 7) {
        var stars = '';

        int j = (7 - i);
        
        stars = piramid_while1(arrayLength, i, j, numbers);

        var row = piramid_while2(i, j, numbers, arrayLength);
        print(stars + row.trim());
        i++;
      }
}