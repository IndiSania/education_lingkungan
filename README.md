# EcoGarda — Platform Edukasi dan Aksi Lingkungan

EcoGarda adalah aplikasi web edukasi lingkungan menggunakan **PHP Native, MySQL, HTML, CSS, dan JavaScript**. Antarmuka responsif, memakai bahasa Indonesia, dan dapat dijalankan secara lokal dengan XAMPP.

## Fitur utama
- Beranda dengan ringkasan materi, aksi, dan laporan komunitas.
- Pusat edukasi dengan filter kategori dan detail materi.
- Katalog aksi nyata dengan fitur komitmen interaktif.
- Formulir laporan masalah lingkungan dengan validasi server.
- Dashboard admin untuk mengelola materi edukasi dan aksi (CRUD).
- Dashboard admin untuk melihat laporan dan memperbarui status.
- Keamanan dasar: PDO prepared statements, output escaping, CSRF token pada form POST, password hashing, session regeneration, dan validasi input.

## Teknologi
- PHP 8.1+ (disarankan PHP 8.2+)
- MySQL/MariaDB
- HTML5, CSS3, JavaScript
- Google Fonts (memerlukan internet untuk font; situs tetap berfungsi jika offline)

## Instalasi menggunakan XAMPP
1. Ekstrak folder `EcoGarda` ke `C:\\xampp\\htdocs\\EcoGarda`.
2. Jalankan Apache dan MySQL dari XAMPP Control Panel.
3. Buka `http://localhost/phpmyadmin`.
4. Pilih menu **Import**, pilih file `database.sql`, lalu jalankan import. File ini membuat database `ecogarda`, tabel, dan konten contoh.
5. Buka `config/config.php`. Sesuaikan host, nama database, username, dan password MySQL jika berbeda dari konfigurasi XAMPP standar.
6. Buka `http://localhost/EcoGarda/setup_admin.php`.
7. Buat akun admin menggunakan email sendiri dan kata sandi minimal 12 karakter.
8. **Hapus file `setup_admin.php` setelah akun berhasil dibuat**, terutama sebelum aplikasi dipublikasikan ke internet.
9. Buka `http://localhost/EcoGarda` untuk situs publik.
10. Login admin melalui `http://localhost/EcoGarda/admin/login.php`.

## Struktur folder
```text
EcoGarda/
├── admin/                 # Login, dashboard, CRUD, laporan
├── assets/
│   ├── css/style.css      # Desain responsif
│   └── js/app.js          # Interaksi antarmuka
├── config/config.php      # Konfigurasi database
├── includes/
│   ├── bootstrap.php      # Koneksi, session, helper, CSRF
│   ├── header.php
│   └── footer.php
├── database.sql           # Skema dan data contoh
├── index.php
├── edukasi.php
├── aksi.php
├── lapor.php
├── tentang.php
└── setup_admin.php        # Hapus setelah setup
```

## Alur admin
1. Admin membuat akun sekali melalui `setup_admin.php`.
2. Admin login.
3. Admin mengelola materi edukasi dan aksi: tambah, edit, hapus, serta mengatur publikasi.
4. Admin memeriksa laporan masuk dan mengubah status: Baru, Ditinjau, Ditindaklanjuti, atau Selesai.

## Catatan sebelum hosting
- Jangan unggah `setup_admin.php` setelah setup selesai.
- Gunakan kata sandi database yang kuat dan batasi hak akses database.
- Pastikan hosting mendukung PHP dan MySQL/MariaDB; sesuaikan konfigurasi database.
- Gunakan HTTPS saat aplikasi dipublikasikan.
- Form laporan belum mengunggah foto dan belum mengirim notifikasi email.
- Status laporan hanya dikelola admin di dalam platform; aplikasi tidak otomatis meneruskan laporan ke instansi pemerintah.
- Data statistik pada beranda dihitung dari isi database, bukan klaim dampak lingkungan yang telah diverifikasi.

## Pengembangan berikutnya
- Unggah foto laporan dengan pemeriksaan tipe dan ukuran berkas.
- Peta lokasi dan integrasi laporan ke layanan resmi daerah.
- Pencarian artikel, pagination, serta log aktivitas admin.
- Sistem moderasi konten dan pembatasan percobaan login.

## Lisensi
Proyek pembelajaran yang dapat dikembangkan kembali. Periksa lisensi aset pihak ketiga jika menambahkan aset baru.
