import 'dart:io';

class Node {
  String city;  // Nama kota
  List<Node> neighbors;  // Daftar tetangga dari kota ini
  List<String> connectionHistory;  // Riwayat koneksi antar kota
  List<double> distances;  // Jarak ke setiap tetangga

  // Constructor untuk inisialisasi node dengan kota
  Node(this.city) 
      : neighbors = [],  // Inisialisasi tetangga kosong
        connectionHistory = [],  // Inisialisasi riwayat kosong
        distances = [];  // Inisialisasi jarak kosong

  // Method untuk menambah tetangga dan jaraknya
  void addNeighbor(Node neighbor, double distance) {
    neighbors.add(neighbor);  // Menambah tetangga
    connectionHistory.add("Connected to: ${neighbor.city}");  // Menyimpan riwayat koneksi
    distances.add(distance);  // Menyimpan jarak ke tetangga tersebut
  }
}

// Kelas Vertice merepresentasikan kota dengan tetangganya dan jarak
class Vertice {
  String name; 
  Map<String, double> neighbors;

  Vertice(this.name, this.neighbors);
  
  @override
  String toString() => name;  // Override toString untuk menampilkan nama kota
}

// Kelas PathFinder untuk mencari jalur antar kota
class PathFinder {
  Map<String, Vertice> vertices;

  PathFinder(this.vertices); 

  // Fungsi untuk menghitung total jarak jalur yang diberikan
  double calculatePathDistance(List<String> path) {
    double totalDistance = 0;
    for (int i = 0; i < path.length - 1; i++) {
      totalDistance += vertices[path[i]]!.neighbors[path[i + 1]]!;  // Menjumlahkan jarak antar kota
    }
    return totalDistance;
  }

  // Fungsi untuk mencari semua jalur dari startCity ke endCity
  void findPath(String startCity, String endCity) {
    List<String> citiesToVisit = vertices.keys.where((city) => city != startCity).toList(); 
    List<List<String>> allPaths = [];  // Menyimpan semua jalur yang ditemukan
    
    // Jika kota awal dan tujuan sama, cari jalur sirkular (kembali ke kota awal)
    if (startCity == endCity) {
      _findAllPathsHelper([startCity], citiesToVisit, allPaths, true);  // Memulai pencarian jalur sirkular
    } else {
      _findAllPathsHelper([startCity], citiesToVisit, allPaths, false);  // Pencarian jalur biasa
    }

    // Menyaring jalur yang valid
    List<List<String>> validPaths;
    if (startCity == endCity) {
      validPaths = allPaths.where((path) => 
        path.length == vertices.length + 1 && 
        path.first == startCity && 
        path.last == startCity  // Pastikan jalur dimulai dan berakhir di kota awal
      ).toList();
    } else {
      validPaths = allPaths.where((path) =>
        path.isNotEmpty &&
        path.first == startCity &&
        path.last == endCity  // Jalur harus dimulai dari startCity dan berakhir di endCity
      ).toList();
    }

    // Menampilkan hasil pencarian jalur
    print("+====================+");
    print("+  Kota $startCity -> Kota $endCity  +");
    print("+====================+");

    // Jika tidak ada jalur yang valid
    if (validPaths.isEmpty) {
      print("No valid paths found from $startCity to $endCity");
      return;
    }

    // Menyimpan jalur berdasarkan jarak
    Map<double, List<List<String>>> distanceToPaths = {};
    
    // Looping melalui semua jalur valid
    for (var path in validPaths) {
      double distance = calculatePathDistance(path);  // Menghitung total jarak untuk setiap jalur
      print("Path: $path - Total Distance: $distance");
      
      // Menyimpan jalur berdasarkan jaraknya
      if (!distanceToPaths.containsKey(distance)) {
        distanceToPaths[distance] = [];
      }
      distanceToPaths[distance]!.add(path);
    }

    // Mencari jarak terpendek
    double shortestDistance = distanceToPaths.keys.reduce((a, b) => a < b ? a : b);  // Mengambil jarak terpendek
    List<List<String>> shortestPaths = distanceToPaths[shortestDistance]!;  // Mendapatkan jalur dengan jarak terpendek

    // Menampilkan jalur terpendek
    print("+====================+");
    print("+   Jarak Tercepat   +");
    print("+====================+");
    
    if (shortestPaths.length == 1) {
      print("Shortest Path: ${shortestPaths[0]} with Distance: $shortestDistance");
    } else {
      print("Found ${shortestPaths.length} paths with shortest distance $shortestDistance:");
      for (int i = 0; i < shortestPaths.length; i++) {
        print("Path ${i + 1}: ${shortestPaths[i]}");
      }
    }
  }

  // Fungsi rekursif untuk menemukan semua jalur dari currentPath
  void _findAllPathsHelper(List<String> currentPath, List<String> citiesToVisit, 
                          List<List<String>> allPaths, bool isCircular) {
    // Jika pencarian sirkular, cari jalur yang kembali ke kota awal
    if (isCircular) {
      if (currentPath.length == vertices.length + 1) {
        if (currentPath.first == currentPath.last) {
          allPaths.add(List.from(currentPath));  // Tambahkan jalur sirkular yang valid ke allPaths
        }
        return;
      }
    } else {
      // Jalur biasa: tambahkan ke allPaths jika sudah lebih dari satu kota
      if (currentPath.length > 1) {
        allPaths.add(List.from(currentPath));
      }
      if (citiesToVisit.isEmpty) return;  // Jika semua kota sudah dikunjungi, hentikan
    }

    // Lanjutkan pencarian dari kota saat ini
    String currentCity = currentPath.last;
    for (String nextCity in citiesToVisit) {
      if (vertices[currentCity]!.neighbors.containsKey(nextCity)) {
        currentPath.add(nextCity);  // Tambahkan kota berikutnya ke jalur
        List<String> remainingCities = List.from(citiesToVisit)..remove(nextCity);  // Hapus kota dari daftar kunjungan
        
        // Jika sirkular dan sudah mendekati akhir, cek jika bisa kembali ke kota awal
        if (isCircular && currentPath.length == vertices.length) {
          if (vertices[nextCity]!.neighbors.containsKey(currentPath.first)) {
            currentPath.add(currentPath.first);  // Tambahkan kota awal ke jalur
            _findAllPathsHelper(currentPath, remainingCities, allPaths, isCircular);  // Rekursi untuk melanjutkan pencarian
            currentPath.removeLast();  // Hapus kota awal setelah pencarian
          }
        } else {
          _findAllPathsHelper(currentPath, remainingCities, allPaths, isCircular);  // Lanjutkan pencarian
        }
        
        currentPath.removeLast();  // Hapus kota terakhir setelah pencarian selesai
      }
    }
  }
}

// Fungsi main untuk menjalankan program
void main() {
  // Data kota dan tetangganya beserta jaraknya
  Map<String, Vertice> cities = {
    'A': Vertice('A', {'B': 8, 'C': 3, 'D': 4, 'E': 10}),
    'B': Vertice('B', {'A': 8, 'C': 5, 'D': 2, 'E': 7}),
    'C': Vertice('C', {'A': 3, 'B': 5, 'D': 1, 'E': 6}),
    'D': Vertice('D', {'A': 4, 'B': 2, 'C': 1, 'E': 3}),
    'E': Vertice('E', {'A': 10, 'B': 7, 'C': 6, 'D': 3}),
  };

  bool continueProgram = true;

  // Loop untuk menjalankan program berulang kali
  while (continueProgram) {
    print("\nKota yang tersedia: ${cities.keys.join(', ')}");
    stdout.write("Masukkan kota awal : "); 
    String? startCity = stdin.readLineSync()?.toUpperCase();
    stdout.write("Masukkan kota tujuan : "); 
    String? endCity = stdin.readLineSync()?.toUpperCase();

    // Jika input valid, jalankan pencarian jalur
    if (startCity != null && endCity != null && 
        cities.containsKey(startCity) && cities.containsKey(endCity)) {
      PathFinder pathFinder = PathFinder(cities);
      pathFinder.findPath(startCity, endCity);  // Cari jalur antara kota awal dan tujuan
    } else {
      print("Kota yang dimasukkan tidak valid. Silakan coba lagi.");
    }

    stdout.write("\nApakah Anda ingin mencari rute lain? (IYA/TIDAK): ");
    String? answer = stdin.readLineSync()?.toUpperCase();
    continueProgram = answer == 'IYA';
  }
}
