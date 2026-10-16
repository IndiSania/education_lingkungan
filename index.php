<?php
require_once __DIR__ . '/includes/bootstrap.php';
$pageTitle = 'Beranda';
$stats = [
  'tips' => (int)$pdo->query("SELECT COUNT(*) FROM tips WHERE is_published=1")->fetchColumn(),
  'actions' => (int)$pdo->query("SELECT COUNT(*) FROM actions WHERE status='Selesai'")->fetchColumn(),
  'reports' => (int)$pdo->query("SELECT COUNT(*) FROM reports")->fetchColumn()
];
$tips = $pdo->query("SELECT * FROM tips WHERE is_published=1 ORDER BY created_at DESC LIMIT 3")->fetchAll();
$actions = $pdo->query("SELECT * FROM actions WHERE is_published=1 ORDER BY created_at DESC LIMIT 3")->fetchAll();
require __DIR__ . '/includes/header.php';
?>
<section class="hero">
  <div class="hero-copy">
    <span class="eyebrow"><span class="dot"></span> MULAI DARI HAL KECIL</span>
    <h1>Bumi yang lebih baik dimulai dari <em>kebiasaan kita.</em></h1>
    <p>EcoGarda adalah ruang edukasi lingkungan untuk belajar, bergerak, dan mengajak lebih banyak orang menjaga bumi bersama.</p>
    <div class="hero-actions"><a class="btn btn-primary" href="aksi.php">Temukan aksi <span>↗</span></a><a class="btn btn-quiet" href="edukasi.php">Jelajahi edukasi</a></div>
    <div class="hero-note"><span class="avatar-stack"><i>🌱</i><i>♻️</i><i>🌎</i></span><span><strong>Setiap langkah berarti.</strong><br>Mulai dari lingkungan terdekatmu.</span></div>
  </div>
  <div class="hero-art" role="img" aria-label="Ilustrasi bumi dan tanaman">
    <div class="art-orbit orbit-one"></div><div class="art-orbit orbit-two"></div>
    <div class="sun"></div><div class="earth"><div class="land land-one"></div><div class="land land-two"></div><div class="land land-three"></div><div class="earth-shine"></div></div>
    <div class="plant plant-left"><i></i><i></i><b></b></div><div class="plant plant-right"><i></i><i></i><b></b></div>
    <div class="floating-card card-water"><span>💧</span><div><b>Hemat air</b><small>Mulai hari ini</small></div></div>
    <div class="floating-card card-recycle"><span>♻️</span><div><b>Pilah sampah</b><small>Lebih bertanggung jawab</small></div></div>
    <span class="spark spark-a">✳</span><span class="spark spark-b">✦</span>
  </div>
</section>
<section class="stats-strip">
  <div><strong><?= number_format($stats['tips']) ?></strong><span>Materi edukasi</span></div>
  <div><strong><?= number_format($stats['actions']) ?></strong><span>Aksi selesai dilaporkan</span></div>
  <div><strong><?= number_format($stats['reports']) ?></strong><span>Laporan komunitas</span></div>
  <div class="stats-message">Perubahan besar tumbuh dari<br><em>langkah sederhana.</em></div>
</section>
<section class="section section-soft">
  <div class="section-heading"><div><span class="eyebrow">BELAJAR BERSAMA</span><h2>Kenali cara menjaga bumi</h2><p>Informasi sederhana yang bisa langsung diterapkan dalam keseharian.</p></div><a class="text-link" href="edukasi.php">Semua edukasi <span>↗</span></a></div>
  <div class="card-grid">
  <?php foreach ($tips as $i => $tip): ?>
    <article class="content-card"><div class="card-visual visual-<?= ($i % 3)+1 ?>"><span><?= e($tip['icon']) ?></span><small><?= e($tip['category']) ?></small></div><div class="card-body"><h3><?= e($tip['title']) ?></h3><p><?= e($tip['summary']) ?></p><a class="text-link" href="edukasi.php#tip-<?= (int)$tip['id'] ?>">Baca selengkapnya <span>↗</span></a></div></article>
  <?php endforeach; ?>
  <?php if (!$tips): ?><div class="empty-state">Materi edukasi akan segera tersedia.</div><?php endif; ?>
  </div>
</section>
<section class="section action-section">
 <div class="action-intro"><span class="eyebrow">AKSI NYATA</span><h2>Jadikan kepedulian sebagai tindakan.</h2><p>Tak perlu menunggu sempurna. Pilih satu aksi yang sesuai dengan lingkungan dan kemampuanmu.</p><a class="btn btn-primary" href="aksi.php">Lihat semua aksi <span>↗</span></a></div>
 <div class="action-list">
 <?php foreach ($actions as $a): ?><a class="action-row" href="aksi.php#aksi-<?= (int)$a['id'] ?>"><span class="action-icon"><?= e($a['icon']) ?></span><span class="action-detail"><b><?= e($a['title']) ?></b><small><?= e($a['category']) ?> · <?= e($a['duration']) ?></small></span><span class="action-arrow">↗</span></a><?php endforeach; ?>
 <?php if (!$actions): ?><p class="muted">Daftar aksi akan segera tersedia.</p><?php endif; ?>
 </div>
</section>
<section class="cta-band"><div><span class="eyebrow">JADI BAGIAN DARI PERUBAHAN</span><h2>Temukan masalah lingkungan di sekitarmu?</h2><p>Laporkan lokasi dan kondisi secara bertanggung jawab agar bisa menjadi perhatian bersama.</p></div><a class="btn btn-light" href="lapor.php">Kirim laporan <span>↗</span></a></section>
<?php require __DIR__ . '/includes/footer.php'; ?>