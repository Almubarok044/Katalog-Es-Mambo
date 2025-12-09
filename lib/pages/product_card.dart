import 'package:flutter/material.dart';

Widget productCard(String name, String icon, String desc, String img) {
  return Container(
    width: 260,
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: Colors.white,
      boxShadow: const [
        BoxShadow(color: Colors.black12, blurRadius: 6, spreadRadius: 2),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // ==== GAMBAR TINGGI (TIDAK TERPOTONG) ====
        SizedBox(
          height: 250, // Tinggi cukup untuk gambar es mambo
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              img,
              fit: BoxFit.contain, // Tidak memotong gambar
            ),
          ),
        ),

        const SizedBox(height: 12),

        // ==== JUDUL ====
        Text(
          "$icon $name",
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),

        const SizedBox(height: 6),

        // ==== DESKRIPSI ====
        Text(
          desc,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 13, color: Colors.black87),
        ),
      ],
    ),
  );
}
