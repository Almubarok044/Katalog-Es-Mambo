# Es Mambo Lasmi

Aplikasi katalog produk digital untuk brand Es Mambo Lasmi, dibuat dengan Flutter. Aplikasi ini menampilkan produk utama seperti Es Mambo, Es Jelly, dan berbagai pilihan kue kering serta hampers premium dengan desain modern yang responsif untuk desktop dan mobile.

## Ringkasan Proyek

Project ini adalah aplikasi katalog/landing page produk yang berfungsi sebagai media promosi dan katalog online. Selain menampilkan produk, aplikasi juga mempermudah pengguna untuk melakukan pemesanan melalui WhatsApp dengan tombol order yang langsung membuka chat WhatsApp.

Aplikasi ini dibangun untuk kebutuhan promosi produk kuliner khas rumahan yang menonjolkan tampilan elegan, pengalaman browsing produk yang mudah, dan dukungan theme light/dark mode.

## Fitur Utama

- Halaman beranda yang menampilkan hero section, kategori produk, promo, dan popular products
- Katalog produk dengan filter kategori: Semua, Es Mambo, Es Jelly, dan Kue Kering
- Tampilan produk dalam bentuk card dengan informasi harga, ukuran, dan gambar produk
- Fitur navigasi antar halaman: Home, Produk, dan About
- Tombol WhatsApp untuk langsung melakukan pemesanan
- Tema terang dan gelap dengan state management menggunakan Riverpod
- Responsif untuk tampilan desktop dan mobile
- Integrasi Firebase untuk konfigurasi aplikasi dan potensi pengembangan backend di masa depan

## Stack Teknologi

- Flutter
- Dart
- Firebase Core
- Riverpod / Hooks Riverpod
- Google Fonts
- carousel_slider
- font_awesome_flutter
- url_launcher
- flutter_svg

## Struktur Proyek

```text
.
├── android/
├── ios/
├── lib/
│   ├── core/
│   │   └── firebase_options.dart
│   ├── features/
│   │   ├── about/
│   │   ├── home/
│   │   └── products/
│   │       ├── screens/
│   │       └── widgets/
│   ├── theme/
│   │   ├── app_theme.dart
│   │   └── theme_provider.dart
│   ├── widgets/
│   │   ├── category_card.dart
│   │   ├── drawer_menu.dart
│   │   ├── footer.dart
│   │   ├── hero_section.dart
│   │   ├── nav_bar.dart
│   │   ├── popular_products.dart
│   │   ├── section_title.dart
│   │   └── special_offers.dart
│   └── main.dart
├── assets/
│   ├── background/
│   ├── icon/
│   └── product/
├── test/
├── pubspec.yaml
├── analysis_options.yaml
├── firebase.json
├── README.md
└── web/
```

## Alur Aplikasi

Aplikasi dimulai dari `lib/main.dart`, lalu mengeksekusi `MyApp` dan memanggil `HomeScreen` sebagai halaman utama. Pengguna kemudian dapat:

1. Menjelajahi halaman utama untuk melihat produk unggulan dan kategori
2. Membuka halaman katalog produk melalui navigasi menu
3. Memilih kategori produk tertentu seperti Es Mambo, Es Jelly, atau Kue Kering
4. Mengklik tombol WhatsApp untuk langsung terhubung ke nomor pemesanan yang sudah ditentukan

## Halaman Utama

### HomeScreen
Halaman utama berisi:

- hero banner
- section tentang brand
- kategori produk
- carousel produk utama
- special offers
- popular products
- hampers kue lebaran
- kajian jam operasional

### ProductsScreen
Halaman katalog produk menampilkan seluruh item yang dapat difilter berdasarkan kategori. Setiap item ditampilkan dalam grid card dengan tampilkan gambar, nama, dan detail harga.

### AboutScreen
Halaman ini menampilkan informasi tentang brand, produk, dan latar belakang usaha untuk memberikan konteks kepada user.

## Tema Aplikasi

Tema aplikasi didefinisikan di `lib/theme/app_theme.dart` dengan dua mode:

- Light theme dengan background warm cream dan sentuhan earthy tone
- Dark theme dengan nuansa cokelat elegan

Tema diatur melalui `AppThemeState` dari `lib/theme/theme_provider.dart` menggunakan `hooks_riverpod`.

## Firebase

Proyek ini sudah memiliki konfigurasi Firebase di `lib/core/firebase_options.dart` dan file `firebase.json`. Konfigurasi ini dibuat untuk mendukung integrasi Firebase pada platform Android, iOS, dan Web.

Jika proyek akan dikembangkan lebih lanjut, langkah yang umum dilakukan adalah:

```bash
flutterfire configure
```

Pastikan environment sudah siap dan Firebase project aktif agar konfigurasi dapat diperbarui sesuai kebutuhan.

## Pengaturan Lokal

### Prasyarat

- Flutter SDK version 3.8.1 atau lebih tinggi
- Android Studio / VS Code dengan ekstensi Dart & Flutter
- Device emulator atau browser untuk menjalankan aplikasi

### Langkah Instalasi

```bash
git clone https://github.com/Almubarok044/Katalog-Es-Mambo.git
cd Katalog-Es-Mambo
flutter pub get
flutter run
```

### Menjalankan di Web

```bash
flutter run -d chrome
```

### Build APK

```bash
flutter build apk
```

### Build Web

```bash
flutter build web
```

## Penyesuaian dan Konfigurasi

### Mengubah nomor WhatsApp

Cari fungsi `openWhatsAppEsMambo()` pada file:

- `lib/features/home/home_screen.dart`
- `lib/features/products/screens/products_screen.dart`

Lalu ubah nilai URL WhatsApp sesuai nomor bisnis Anda.

### Mengganti gambar produk

Semua asset produk berada di folder `assets/product/`. Anda dapat menambahkan, mengganti, atau menghapus file gambar sesuai kebutuhan katalog Anda.

### Mengubah tema brand

Sesuaikan warna utama di `lib/theme/app_theme.dart` untuk mengganti tampilan visual keseluruhan aplikasi.

## Catatan Arsitektur

Project ini masih bersifat katalog dan marketing landing page yang dibuat dengan pendekatan UI-first. Struktur folder sudah dibagi berdasarkan fitur, sehingga mudah dikembangkan ke arah:

- aplikasi e-commerce penuh
- dashboard admin
- integrasi backend / CMS
- penyimpanan data produk ke Firebase Firestore

## Status Proyek

Project ini merupakan aplikasi katalog produk yang sudah memiliki UI siap pakai dan berfungsi sebagai media promosi digital untuk produk Es Mambo Lasmi.

## Kontribusi

Jika Anda ingin mengembangkan proyek ini lebih lanjut, disarankan:

- menjaga struktur feature-based agar kode tetap rapi
- menambahkan model data terpisah dari widget jika produk semakin banyak
- memindahkan data produk ke Firebase atau backend terpusat
- menambahkan unit/widget test untuk komponen penting

## Lisensi

Proyek ini belum ditetapkan dengan lisensi khusus. Jika project ini akan dipublikasikan atau dikembangkan tim, disarankan untuk menambahkan file `LICENSE` secara eksplisit.

## Kontak

Brand: Es Mambo Lasmi

Untuk kebutuhan update produk, branding, atau pengembangan lanjutan, Anda dapat menyesuaikan nomor kontak dan data yang ada di aplikasi.
