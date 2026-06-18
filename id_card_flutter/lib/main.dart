import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 200, 225, 255), // Biru muda
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Foto Profil
              CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage("images/foto_ghifar.jpg"),
              ),
              const SizedBox(height: 10),
              // Nama
              Text(
                "Galang Ahmad Ghifari",
                style: GoogleFonts.ebGaramond(
                  fontSize: 40,
                  color: const Color.fromARGB(255, 10, 50, 120), // Biru tua
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Peran / Role
              Text(
                "Mobile Developer",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: const Color.fromARGB(255, 20, 80, 180), // Biru sedang
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.5,
                ),
              ),
              const SizedBox(height: 20),
              // Garis Pemisah
              SizedBox(
                height: 20,
                width: 150,
                child: Divider(
                  color: const Color.fromARGB(255, 30, 100, 200),
                  thickness: 2,
                ),
              ),
              // Kontak Telepon
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                margin: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 25,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.phone,
                      color: const Color.fromARGB(255, 20, 80, 180),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "+62 812-3456-7890",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              // Alamat Email
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                margin: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 25,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.email,
                      color: const Color.fromARGB(255, 20, 80, 180),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "ghifariahmad212@gmail.com",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
