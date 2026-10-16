CREATE DATABASE IF NOT EXISTS ecogarda CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE ecogarda;

CREATE TABLE IF NOT EXISTS admins (
 id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 name VARCHAR(100) NOT NULL,
 email VARCHAR(150) NOT NULL UNIQUE,
 password_hash VARCHAR(255) NOT NULL,
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS tips (
 id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 title VARCHAR(180) NOT NULL,
 category VARCHAR(80) NOT NULL,
 icon VARCHAR(20) NOT NULL DEFAULT '🌱',
 summary VARCHAR(220) NOT NULL,
 body TEXT NOT NULL,
 is_published TINYINT(1) NOT NULL DEFAULT 1,
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS actions (
 id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 title VARCHAR(180) NOT NULL,
 category VARCHAR(80) NOT NULL,
 icon VARCHAR(20) NOT NULL DEFAULT '🌱',
 summary VARCHAR(220) NOT NULL,
 description TEXT NOT NULL,
 duration VARCHAR(80) NOT NULL DEFAULT '15 menit',
 is_published TINYINT(1) NOT NULL DEFAULT 1,
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS reports (
 id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 name VARCHAR(100) NOT NULL,
 email VARCHAR(150) NULL,
 type VARCHAR(80) NOT NULL,
 location VARCHAR(180) NOT NULL,
 description TEXT NOT NULL,
 status ENUM('Baru','Ditinjau','Ditindaklanjuti','Selesai') NOT NULL DEFAULT 'Baru',
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 INDEX idx_reports_status (status),
 INDEX idx_reports_created (created_at)
) ENGINE=InnoDB;

INSERT INTO tips (title,category,icon,summary,body) VALUES
('Mulai Pilah Sampah dari Rumah','Pengelolaan sampah','♻️','Kenali sampah organik, anorganik, dan residu agar lebih mudah dikelola.','Sediakan wadah berbeda untuk sampah organik, anorganik yang dapat didaur ulang, dan residu.\\n\\nSisa sayur dan buah dapat diolah menjadi kompos bila kondisinya sesuai. Botol, kertas, dan kemasan tertentu sebaiknya dibersihkan sebelum disalurkan ke bank sampah atau fasilitas daur ulang. Periksa aturan pemilahan di daerahmu karena fasilitas setiap wilayah bisa berbeda.'),
('Hemat Air dalam Aktivitas Harian','Hemat sumber daya','💧','Kebiasaan kecil dapat membantu mengurangi air bersih yang terbuang.','Matikan keran ketika tidak digunakan, gunakan air secukupnya saat mencuci, dan segera laporkan kebocoran. Tampung air hujan untuk menyiram tanaman jika aman dan sesuai kebutuhan.\\n\\nHindari membuang minyak, cat, atau bahan kimia ke saluran air. Penghematan air membantu menjaga ketersediaan sumber daya dan mengurangi beban pengolahan air.'),
('Kurangi Plastik Sekali Pakai','Gaya hidup berkelanjutan','🛍️','Bawa perlengkapan pakai ulang agar tidak selalu bergantung pada kemasan sekali pakai.','Biasakan membawa botol minum, tas belanja, dan wadah makan yang bisa digunakan berulang kali. Tolak alat makan tambahan jika memang tidak diperlukan.\\n\\nGunakan kembali barang yang masih layak dan pilih produk dengan kemasan lebih sederhana jika tersedia. Tidak semua plastik bisa didaur ulang di setiap daerah, jadi mengurangi penggunaan dari awal merupakan langkah yang baik.'),
('Rawat Ruang Hijau di Sekitar','Keanekaragaman hayati','🌿','Tanaman lokal dan ruang hijau membantu menciptakan lingkungan yang lebih nyaman.','Rawat tanaman di rumah atau sekolah, jaga kebersihan taman, dan pilih tanaman yang sesuai dengan iklim setempat. Hindari merusak habitat atau mengambil satwa liar dari alam.\\n\\nJika ingin menanam pohon, perhatikan ruang tumbuh, kebutuhan air, dan jenis tanaman yang cocok. Ajak teman atau warga menjaga area hijau secara berkala.'),
('Gunakan Listrik Secara Bijak','Hemat sumber daya','⚡','Matikan perangkat yang tidak digunakan dan manfaatkan cahaya alami.','Matikan lampu dan perangkat elektronik saat tidak diperlukan. Cabut pengisi daya setelah selesai digunakan jika aman dilakukan, dan manfaatkan ventilasi serta cahaya alami pada siang hari.\\n\\nPilih perangkat hemat energi ketika perlu mengganti peralatan. Penghematan energi mengurangi biaya dan dapat membantu menekan dampak lingkungan dari produksi listrik.'),
('Pilih Transportasi yang Lebih Ramah Lingkungan','Mobilitas berkelanjutan','🚲','Berjalan kaki, bersepeda, atau berbagi kendaraan untuk perjalanan yang sesuai.','Untuk jarak dekat yang aman, pertimbangkan berjalan kaki atau bersepeda. Jika memungkinkan, gunakan transportasi umum atau berbagi kendaraan agar perjalanan lebih efisien.\\n\\nUtamakan keselamatan, gunakan perlengkapan yang sesuai, dan pilih moda transportasi berdasarkan kondisi jalan serta kemampuan masing-masing. Tidak semua perjalanan cocok dilakukan dengan cara yang sama.'),
('Kompos dari Sisa Organik','Pengelolaan sampah','🌱','Sisa dapur tertentu dapat diolah menjadi kompos dengan cara yang tepat.','Pisahkan sisa buah dan sayur dari sampah lain. Gunakan wadah kompos dengan sirkulasi udara dan campurkan bahan basah dengan bahan kering seperti daun kering.\\n\\nHindari memasukkan daging, minyak, atau makanan berlemak ke komposter rumahan sederhana karena bisa menimbulkan bau dan mengundang hama. Pelajari metode kompos yang sesuai dengan ruang dan kondisi tempat tinggalmu.'),
('Belanja dengan Lebih Bertanggung Jawab','Gaya hidup berkelanjutan','🧺','Rencanakan kebutuhan agar barang dan makanan tidak terbuang sia-sia.','Buat daftar belanja, periksa persediaan di rumah, dan pilih jumlah sesuai kebutuhan. Simpan makanan dengan benar agar lebih awet dan gunakan bahan yang mendekati masa kedaluwarsa lebih dulu selama masih aman dikonsumsi.\\n\\nPertimbangkan memperbaiki, meminjam, atau membeli barang bekas yang masih layak untuk kebutuhan tertentu. Keputusan konsumsi yang bijak dapat mengurangi limbah.'),
('Jaga Kebersihan Sungai dan Saluran Air','Perlindungan air','🌊','Sampah yang masuk saluran air dapat mengganggu aliran dan mencemari lingkungan.','Jangan membuang sampah ke sungai, selokan, atau saluran air. Ikuti kegiatan bersih lingkungan yang dikelola dengan aman dan gunakan perlengkapan pelindung yang sesuai.\\n\\nJika menemukan pencemaran atau kondisi berbahaya, catat lokasi dari tempat aman dan laporkan kepada pihak berwenang setempat. Jangan menyentuh limbah yang tidak dikenal atau memasuki air yang tercemar.'),
('Ajak Teman Melakukan Aksi Hijau','Komunitas peduli lingkungan','🤝','Kebiasaan baik lebih mudah berkembang ketika dilakukan bersama.','Mulai dengan mengajak keluarga atau teman melakukan satu kegiatan sederhana, seperti membawa botol minum sendiri atau memilah sampah kelas. Tetapkan tujuan yang realistis dan evaluasi bersama.\\n\\nGunakan informasi dari sumber tepercaya saat membagikan edukasi. Hindari mempermalukan orang lain; ajakan yang ramah dan contoh nyata biasanya lebih membangun.')
ON DUPLICATE KEY UPDATE title=VALUES(title);

INSERT INTO actions (title,category,icon,summary,description,duration) VALUES
('Bawa Botol Minum Sendiri','Kurangi plastik','🥤','Kurangi kebutuhan botol minum sekali pakai saat beraktivitas.','Siapkan botol minum yang bisa digunakan kembali sebelum berangkat sekolah atau bepergian. Isi ulang di tempat yang menyediakan air minum aman.','Setiap hari'),
('Pilah Sampah di Rumah','Pengelolaan sampah','♻️','Pisahkan sampah sesuai jenis dan fasilitas yang tersedia.','Mulai dengan dua atau tiga kategori yang mudah dikenali. Pastikan sampah daur ulang bersih dan cari informasi bank sampah atau fasilitas lokal.','10–15 menit'),
('Matikan Lampu yang Tidak Dipakai','Hemat energi','💡','Biasakan mematikan lampu ketika meninggalkan ruangan.','Periksa lampu dan perangkat listrik sebelum meninggalkan ruangan. Tetap utamakan keselamatan dan jangan mencabut perangkat penting sembarangan.','1–2 menit'),
('Rawat Satu Tanaman','Ruang hijau','🪴','Rawat tanaman di rumah atau sekolah sesuai kebutuhannya.','Pilih tanaman yang cocok dengan kondisi cahaya dan ruang. Siram secukupnya, amati pertumbuhannya, dan jaga area tanaman tetap bersih.','5–10 menit'),
('Bersihkan Area Sekitar dengan Aman','Aksi komunitas','🧤','Jaga area bersama tetap bersih tanpa mengambil risiko.','Ajak teman membersihkan area yang aman dengan sarung tangan dan alat yang sesuai. Jangan menyentuh benda tajam, limbah medis, atau bahan yang tidak dikenal.','20–30 menit'),
('Rencanakan Belanja Tanpa Boros','Konsumsi bijak','🧺','Buat daftar belanja agar kebutuhan lebih terukur.','Periksa persediaan sebelum berbelanja, tulis kebutuhan utama, dan pilih barang yang benar-benar akan digunakan.','5 menit'),
('Gunakan Tas Pakai Ulang','Kurangi plastik','🛍️','Simpan tas pakai ulang agar siap digunakan saat berbelanja.','Letakkan tas lipat di dalam tas harian atau dekat pintu agar tidak terlupa ketika berbelanja.','Setiap belanja'),
('Ajak Keluarga Hemat Air','Hemat sumber daya','💧','Ajak keluarga mengecek kebiasaan penggunaan air.','Diskusikan cara menghemat air yang realistis di rumah, misalnya memperbaiki keran bocor dan menggunakan air secukupnya.','10 menit'),
('Berbagi Edukasi Lingkungan','Edukasi komunitas','📣','Bagikan satu informasi lingkungan dari sumber tepercaya.','Pilih satu fakta atau tips dari sumber yang dapat dipercaya, tuliskan dengan bahasa sendiri, lalu bagikan tanpa menyebarkan informasi yang belum terverifikasi.','10 menit')
ON DUPLICATE KEY UPDATE title=VALUES(title);
