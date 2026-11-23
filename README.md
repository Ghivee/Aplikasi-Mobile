# Mobile Application Coursework

Lab report projects for the Mobile Application course: four small, separate Flutter apps, each focused on a different Flutter fundamental rather than one combined project.

[Baca dalam Bahasa Indonesia di bawah](#bahasa-indonesia)

## Projects

| Folder | What it is | What it practices |
| --- | --- | --- |
| `kalkulator_bmi` | BMI calculator | multi-screen navigation and passing a computed value between screens |
| `news_app` | A news headline list from NewsAPI (set `NEWS_API_KEY` with `--dart-define` before running) | calling a REST API and rendering the response as a list |
| `listview_sharedpreferences` | A ListView backed by SharedPreferences | persisting simple data locally between app launches |
| `id_card_flutter` | A digital ID card layout | static layout and styling with widgets |

Each folder is a separate, independent Flutter project: `cd` into the one you want, then run `flutter pub get` followed by `flutter run`. There is no single top-level project tying all four together.

---

## Bahasa Indonesia

Proyek laporan praktikum mata kuliah Aplikasi Mobile: empat aplikasi Flutter kecil yang berdiri sendiri, masing-masing berfokus pada satu dasar Flutter yang berbeda, bukan satu proyek gabungan.

### Proyek

| Folder | Isi | Yang dilatih |
| --- | --- | --- |
| `kalkulator_bmi` | Kalkulator BMI | navigasi multi-layar dan mengoper nilai hasil hitung antar layar |
| `news_app` | Daftar judul berita dari NewsAPI (isi `NEWS_API_KEY` lewat `--dart-define` sebelum menjalankan) | memanggil REST API dan menampilkan hasilnya sebagai daftar |
| `listview_sharedpreferences` | ListView yang didukung SharedPreferences | menyimpan data sederhana secara lokal antar peluncuran aplikasi |
| `id_card_flutter` | Tampilan kartu identitas digital | tata letak statis dan styling dengan widget |

Setiap folder adalah proyek Flutter tersendiri yang berdiri sendiri: masuk ke folder yang dituju, lalu jalankan `flutter pub get` diikuti `flutter run`. Tidak ada satu proyek tingkat atas yang menyatukan keempatnya.
