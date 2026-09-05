```markdown
# 🍧 Es Mambo Lasmi

Aplikasi katalog produk digital untuk *brand* **Es Mambo Lasmi**, dibuat dengan **Flutter** 💙. Aplikasi ini menampilkan produk utama seperti Es Mambo 🧊, Es Jelly 🍮, dan berbagai pilihan kue kering 🍪 serta *hampers* premium 🎁 dengan desain modern yang responsif untuk desktop 💻 dan mobile 📱.

---

## 📌 Ringkasan Proyek

Project ini adalah aplikasi katalog/landing page produk yang berfungsi sebagai media promosi dan katalog *online*. Selain menampilkan produk, aplikasi juga mempermudah pengguna untuk melakukan pemesanan melalui WhatsApp 💬 dengan tombol *order* yang langsung membuka *chat* WhatsApp.

Aplikasi ini dibangun untuk kebutuhan promosi produk kuliner khas rumahan yang menonjolkan tampilan elegan, pengalaman *browsing* produk yang mudah, dan dukungan tema terang/gelap ☀️/🌙.

---

## ✨ Fitur Utama

- 🏠 **Halaman Beranda** yang menampilkan *hero section*, kategori produk, promo, dan produk populer.
- 🗂️ **Katalog Produk** dengan filter kategori: Semua, Es Mambo, Es Jelly, dan Kue Kering.
- 🏷️ **Tampilan Produk** dalam bentuk *card* dengan informasi harga, ukuran, dan gambar produk.
- 🧭 **Fitur Navigasi** antar halaman: *Home*, *Produk*, dan *About*.
- 📲 **Tombol WhatsApp** untuk langsung melakukan pemesanan.
- 🌗 **Tema Terang & Gelap** (*Light/Dark mode*) dengan *state management* menggunakan Riverpod.
- 📱 **Desain Responsif** untuk tampilan layar *desktop* dan *mobile*.
- 🔥 **Integrasi Firebase** untuk konfigurasi aplikasi dan potensi pengembangan *backend* di masa depan.

---

## 🛠️ Stack Teknologi

- 💙 **Flutter** & **Dart** (Framework & Bahasa Pemrograman)
- 🔥 **Firebase Core** (Konfigurasi Backend)
- 🌊 **Riverpod / Hooks Riverpod** (State Management)
- 🅰️ **Google Fonts** (Tipografi)
- 🎠 **carousel_slider** (Brosur/Banner Interaktif)
- 🎨 **font_awesome_flutter** (Ikonografi)
- 🔗 **url_launcher** (Navigasi Link Eksternal / WhatsApp)
- 🖼️ **flutter_svg** (Render Vektor SVG)

---

## 📂 Struktur Proyek

```text
.
├── 🤖 android/
├── 🍎 ios/
├── 🧠 lib/
│   ├── ⚙️ core/
│   │   └── 🔥 firebase_options.dart
│   ├── 🍱 features/
│   │   ├── ℹ️ about/
│   │   ├── 🏠 home/
│   │   └── 🛍️ products/
│   │       ├── 📱 screens/
│   │       └── 🧩 widgets/
│   ├── 🎨 theme/
│   │   ├── 🌗 app_theme.dart
│   │   └── 🌊 theme_provider.dart
│   ├── 🧩 widgets/
│   │   ├── 🏷️ category_card.dart
│   │   ├── 🍔 drawer_menu.dart
│   │   ├── 🦶 footer.dart
│   │   ├── 🦸‍♂️ hero_section.dart
│   │   ├── 🧭 nav_bar.dart
│   │   ├── ⭐ popular_products.dart
│   │   ├── 📝 section_title.dart
│   │   └── 🎁 special_offers.dart
│   └── 🏁 main.dart
├── 📦 assets/
│   ├── 🌄 background/
│   ├── 🎨 icon/
│   └── 🍩 product/
├── 🧪 test/
├── 📋 pubspec.yaml
├── 🔍 analysis_options.yaml
├── 🔥 firebase.json
├── 📜 README.md
└── 🌐 web/

```

---

## 🔄 Alur Aplikasi

Aplikasi dimulai dari `lib/main.dart`, lalu mengeksekusi `MyApp` dan memanggil `HomeScreen` sebagai halaman utama. Pengguna kemudian dapat:

1️⃣ Menjelajahi halaman utama untuk melihat produk unggulan dan kategori.

2️⃣ Membuka halaman katalog produk melalui navigasi menu.

3️⃣ Memilih kategori produk tertentu seperti Es Mambo, Es Jelly, atau Kue Kering.

4️⃣ Mengklik tombol WhatsApp untuk langsung terhubung ke admin pemesanan.

---

## 📱 Halaman Utama

### 🏠 HomeScreen

Halaman utama berisi berbagai *section* menarik:

* 🦸‍♂️ *Hero banner*
* 🏢 Informasi tentang *brand*
* 🗂️ Kategori produk
* 🎠 Carousel produk utama
* 🎁 *Special offers* (Penawaran khusus)
* ⭐ *Popular products* (Produk terlaris)
* 🍪 *Hampers* kue lebaran
* 🕒 Informasi jam operasional

### 🛍️ ProductsScreen

Halaman katalog produk menampilkan seluruh *item* yang dapat difilter berdasarkan kategori. Setiap *item* ditampilkan dalam *grid card* yang memuat gambar, nama, dan detail harga.

### ℹ️ AboutScreen

Halaman ini menampilkan informasi tentang *brand*, produk, dan latar belakang usaha untuk memberikan konteks dan membangun kepercayaan konsumen.

---

## 🎨 Tema Aplikasi

Tema aplikasi didefinisikan di `lib/theme/app_theme.dart` dengan dua mode:

* ☀️ **Light Theme:** Latar belakang *warm cream* dengan sentuhan *earthy tone*.
* 🌙 **Dark Theme:** Nuansa cokelat elegan yang nyaman di mata.

Tema diatur melalui `AppThemeState` dari `lib/theme/theme_provider.dart` menggunakan `hooks_riverpod`.

---

## 🔥 Firebase

Proyek ini sudah memiliki konfigurasi Firebase di `lib/core/firebase_options.dart` dan file `firebase.json`. Konfigurasi ini dibuat untuk mendukung integrasi Firebase pada platform Android, iOS, dan Web.

Jika proyek akan dikembangkan lebih lanjut, langkah yang umum dilakukan adalah:

```bash
flutterfire configure

```

*(Pastikan environment sudah siap dan Firebase project aktif agar konfigurasi dapat diperbarui sesuai kebutuhan).*

---

## 🚀 Pengaturan Lokal

### ⚙️ Prasyarat

* 💙 Flutter SDK version 3.8.1 atau lebih tinggi
* 💻 Android Studio / VS Code dengan ekstensi Dart & Flutter
* 📱 Device emulator atau *browser* untuk menjalankan aplikasi

### 📥 Langkah Instalasi

```bash
git clone [https://github.com/Almubarok044/Katalog-Es-Mambo.git](https://github.com/Almubarok044/Katalog-Es-Mambo.git)
cd Katalog-Es-Mambo
flutter pub get
flutter run

```

### 🌐 Menjalankan di Web

```bash
flutter run -d chrome

```

### 📦 Build Produksi

* **Build APK (Android):**
```bash
flutter build apk

```


* **Build Web:**
```bash
flutter build web

```



---

## 🔧 Penyesuaian dan Konfigurasi

### 💬 Mengubah Nomor WhatsApp

Cari fungsi `openWhatsAppEsMambo()` pada file:

* 📄 `lib/features/home/home_screen.dart`
* 📄 `lib/features/products/screens/products_screen.dart`

Lalu ubah nilai URL WhatsApp sesuai dengan nomor bisnis Anda.

### 🖼️ Mengganti Gambar Produk

Semua aset gambar produk berada di folder `assets/product/`. Anda dapat menambahkan, mengganti, atau menghapus file gambar sesuai kebutuhan katalog Anda.

### 🎨 Mengubah Tema Brand

Sesuaikan warna utama di `lib/theme/app_theme.dart` untuk mengganti tampilan visual keseluruhan aplikasi agar sesuai dengan *branding* Anda.

---

## 🏗️ Catatan Arsitektur

Project ini masih bersifat katalog dan *marketing landing page* yang dibuat dengan pendekatan *UI-first*. Struktur folder sudah dibagi berdasarkan fitur, sehingga sangat mudah dikembangkan ke arah:

* 🛒 Aplikasi *e-commerce* penuh
* 🎛️ Dashboard admin
* 🔗 Integrasi backend / CMS
* ☁️ Penyimpanan data produk ke Firebase Firestore

---

## 📊 Status Proyek

Project ini merupakan aplikasi katalog produk yang sudah memiliki **UI siap pakai** dan berfungsi penuh sebagai media promosi digital untuk produk Es Mambo Lasmi. 🎉

---

## 🤝 Kontribusi

Jika Anda ingin mengembangkan proyek ini lebih lanjut, disarankan untuk:

* 🧱 Menjaga struktur *feature-based* agar kode tetap rapi.
* 📦 Menambahkan model data terpisah dari *widget* jika produk semakin banyak.
* ☁️ Memindahkan data produk ke Firebase atau *backend* terpusat.
* 🧪 Menambahkan *unit/widget test* untuk komponen penting.

---

## 📜 Lisensi

Proyek ini belum ditetapkan dengan lisensi khusus. Jika project ini akan dipublikasikan atau dikembangkan oleh tim, disarankan untuk menambahkan file `LICENSE` secara eksplisit.

---

## 📞 Kontak

🍧 **Brand:** Es Mambo Lasmi

Untuk kebutuhan *update* produk, *branding*, atau pengembangan lanjutan, Anda dapat menyesuaikan nomor kontak dan data yang ada langsung di dalam *source code* aplikasi.

```
