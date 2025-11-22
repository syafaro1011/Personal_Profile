# 📱 Personal Profile App

Aplikasi profil pribadi mahasiswa berbasis Flutter yang dikembangkan untuk memenuhi UTS Pemrograman Mobile 2.

## 👤 Informasi Mahasiswa

- **Nama**: Syaiful Fathur Rozaq
- **NIM**: 23552011282
- **Jurusan**: Teknik Informatika
- **Kelas**: TIF K 23A
- **Dosen**: Erryck Norrys, S.Kom.

## 📋 Deskripsi Project

Aplikasi single-page yang menampilkan profil mahasiswa dengan tampilan modern, interaktif, dan responsif. Aplikasi ini menampilkan informasi pribadi, hobi, dan keahlian mahasiswa dengan fitur dark/light mode.

## ✨ Fitur Utama

- 🎨 **Modern UI/UX** - Desain menarik dengan gradient dan animasi smooth
- 🌓 **Dark/Light Mode** - Toggle tema gelap dan terang
- 📊 **Dynamic Data** - Menampilkan hobi dan skill secara dinamis
- 🎯 **Status Indicator** - Badge status mahasiswa (Aktif/Cuti/Lulus)
- ⭐ **Skill Rating** - Rating level keahlian dengan bintang
- 📱 **Responsive Layout** - Tampilan optimal di berbagai ukuran layar
- 🖼️ **Profile Photo Support** - Dukungan foto profil dari assets

## 🏗️ Struktur Project

```
student_profile_app/
├── assets/
│   └── images/
│       └── profile.jpg
├── lib/
│   ├── main.dart                 # Entry point aplikasi
│   ├── models/
│   │   └── profile.dart          # Model data Profile & Skill
│   ├── pages/
│   │   └── profil_page.dart      # Halaman utama profil
│   └── widgets/
│       ├── info_card.dart        # Widget kartu informasi
│       ├── skill_item.dart       # Widget item keahlian
│       └── hobby_item.dart       # Widget item hobi
├── pubspec.yaml
└── README.md
```

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  google_fonts: ^6.1.0           # Custom font (Poppins)
  font_awesome_flutter: ^10.6.0  # Icon library
```

## 🎯 Ketentuan yang Dipenuhi

### ✅ 1. Struktur Proyek & Arsitektur
- [x] Folder terstruktur rapi (models/, widgets/, pages/)
- [x] Pemisahan file yang jelas (main.dart, profil_page.dart)
- [x] Custom widgets (InfoCard, SkillItem, HobbyItem)
- [x] Package eksternal: `google_fonts` dan `font_awesome_flutter`

### ✅ 2. Logika & Pemrograman Dart
- [x] Class `Profile` dengan atribut lengkap
- [x] Enum `StatusMahasiswa` untuk status mahasiswa
- [x] Fungsi manipulasi data (getStatusText, getTotalHobi, getTotalSkill)
- [x] Penggunaan `List<String>` untuk hobi
- [x] Penggunaan `List<Skill>` untuk keahlian

### ✅ 3. Tampilan UI (Widgets & Layout)
- [x] Stack - Untuk overlay di AppBar dan profile header
- [x] Text, Image, Icon - Untuk konten
- [x] Row & Column - Untuk layout
- [x] Container - Untuk styling dan spacing
- [x] Card / ListTile - InfoCard untuk informasi
- [x] ListView.builder - Untuk daftar hobi (horizontal scroll)
- [x] GridView.builder - Untuk grid keahlian (2 kolom)
- [x] Custom Widget - InfoCard, SkillItem, HobbyItem

### ✅ 4. Tema dan Styling
- [x] ThemeData global di MaterialApp
- [x] Palet warna konsisten (blue, blueAccent)
- [x] Google Fonts (Poppins) untuk typography
- [x] UI konsisten dan proporsional

### ✅ 5. State Management
- [x] StatefulWidget untuk ProfilPage
- [x] **BONUS**: setState() untuk toggle Dark/Light Theme
- [x] State management di level page

### ✅ 6. Optimasi & Builder
- [x] ListView.builder untuk list hobi
- [x] GridView.builder untuk grid skill
- [x] Custom widget untuk menghindari duplikasi kode


## 📸 Screenshot

### Light Mode
<div align="center">
  <img src="https://cdn.discordapp.com/attachments/1099859505891790959/1441615932865904660/IMG-20251122-WA0004.jpg?ex=692270f6&is=69211f76&hm=e2dcb20c41368dcebd5d8b759970a410914f440fd359d0b55d59b1ba82124ecd&" alt="Light Mode" width="300"/>
</div>

### Dark Mode
<div align="center">
  <img src="https://cdn.discordapp.com/attachments/1099859505891790959/1441616022703702016/IMG-20251122-WA0001.jpg?ex=6922710b&is=69211f8b&hm=dde6108a916b77d86a3af39a317d35f24e089b6387c878e7b17b5c26f85ee51e&" alt="Dark Mode" width="300"/>
</div>

### Side by Side Comparison
<div align="center">
  <img src="https://cdn.discordapp.com/attachments/1099859505891790959/1441615932865904660/IMG-20251122-WA0004.jpg?ex=692270f6&is=69211f76&hm=e2dcb20c41368dcebd5d8b759970a410914f440fd359d0b55d59b1ba82124ecd&" alt="Light" width="280"/>
  <img src="https://cdn.discordapp.com/attachments/1099859505891790959/1441616022703702016/IMG-20251122-WA0001.jpg?ex=6922710b&is=69211f8b&hm=dde6108a916b77d86a3af39a317d35f24e089b6387c878e7b17b5c26f85ee51e&" alt="Dark" width="280"/>
</div>

## 🎨 Komponen Custom Widget

### 1. InfoCard
Widget untuk menampilkan informasi pribadi dengan icon dan layout yang konsisten.
```dart
InfoCard(
  icon: FontAwesomeIcons.idCard,
  title: 'NIM',
  content: '23552011282',
  iconColor: Colors.blue,
)
```

### 2. SkillItem
Widget untuk menampilkan keahlian dengan rating bintang dan emoji.
```dart
SkillItem(
  skill: Skill(nama: 'Flutter', level: 4, icon: '📱')
)
```

### 3. HobbyItem
Widget untuk menampilkan hobi dengan icon otomatis dan warna berbeda.
```dart
HobbyItem(
  hobby: 'Coding',
  index: 0,
)
```


## 🛠️ Teknologi yang Digunakan

- **Flutter** - Framework UI cross-platform
- **Dart** - Bahasa pemrograman
- **Material Design 3** - Design system
- **Google Fonts** - Typography (Poppins)
- **Font Awesome** - Icon library

## 📝 Catatan Pengembangan

### State Management
Menggunakan `setState()` untuk toggle dark/light mode dengan state yang dikelola di `ProfilPage`. Theme diterapkan menggunakan widget `Theme()` yang membungkus `Scaffold`.

### Data Model
```dart
class Profile {
  final String nama;
  final String nim;
  final String jurusan;
  final String email;
  final String telepon;
  final List<String> hobi;
  final List<Skill> skill;
  final StatusMahasiswa status;
  final String foto;
}
```

### Enum Status
```dart
enum StatusMahasiswa { 
  aktif, 
  cuti, 
  lulus, 
  nonAktif 
}
```

## 🐛 Troubleshooting

### Foto tidak muncul?
- Pastikan folder `assets/images/` sudah dibuat
- Pastikan `pubspec.yaml` sudah include assets
- Run `flutter pub get` setelah menambahkan assets
- Pastikan nama file foto sesuai: `profile.jpg`


### Icon Font Awesome tidak muncul?
- Pastikan `font_awesome_flutter` sudah terinstall
- Import dengan benar: `import 'package:font_awesome_flutter/font_awesome_flutter.dart';`

## 📚 Referensi

- [Flutter Documentation](https://docs.flutter.dev/)
- [Material Design 3](https://m3.material.io/)
- [Google Fonts Package](https://pub.dev/packages/google_fonts)
- [Font Awesome Flutter](https://pub.dev/packages/font_awesome_flutter)


---

**Dibuat dengan ❤️ menggunakan Flutter**

*Last Updated: November 2025*
