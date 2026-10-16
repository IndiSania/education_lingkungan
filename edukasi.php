<?php
require_once __DIR__ . '/includes/bootstrap.php';
$pageTitle='Pusat Edukasi';
$category = trim($_GET['kategori'] ?? '');
$sql = "SELECT * FROM tips WHERE is_published=1"; $params=[];
if ($category !== '') { $sql .= " AND category=?"; $params[]=$category; }
$sql .= " ORDER BY created_at DESC";
$stmt=$pdo->prepare($sql); $stmt->execute($params); $tips=$stmt->fetchAll();
$categories=$pdo->query("SELECT DISTINCT category FROM tips WHERE is_published=1 ORDER BY category")->fetchAll(PDO::FETCH_COLUMN);
require __DIR__ . '/includes/header.php';
?>
<section class="page-hero"><span class="eyebrow">PUSAT PENGETAHUAN</span><h1>Pengetahuan kecil,<br><em>dampak yang besar.</em></h1><p>Pahami isu lingkungan dan temukan kebiasaan sederhana yang bisa kamu mulai sekarang.</p><div class="breadcrumb"><a href="index.php">Beranda</a><span>/</span> Edukasi</div></section>
<section class="section content-section"><div class="filter-bar"><div><span class="eyebrow">ARTIKEL & PANDUAN</span><h2>Belajar menjaga lingkungan</h2></div><form method="get" class="filter-form"><label for="kategori">Kategori</label><select id="kategori" name="kategori" onchange="this.form.submit()"><option value="">Semua topik</option><?php foreach($categories as $c): ?><option value="<?=e($c)?>" <?=$category===$c?'selected':''?>><?=e($c)?></option><?php endforeach;?></select></form></div>
<div class="article-grid"><?php foreach($tips as $i=>$tip): ?><article class="article-card" id="tip-<?= (int)$tip['id'] ?>"><div class="article-art art-<?=($i%4)+1?>"><span><?=e($tip['icon'])?></span><small><?=e($tip['category'])?></small></div><div class="article-content"><div class="meta-line"><span>EDUKASI LINGKUNGAN</span><span><?=date('d M Y',strtotime($tip['created_at']))?></span></div><h3><?=e($tip['title'])?></h3><p><?=e($tip['summary'])?></p><details><summary>Baca panduan lengkap <span>＋</span></summary><div class="detail-copy"><?=nl2br(e($tip['body']))?></div></details></div></article><?php endforeach; ?></div>
<?php if(!$tips): ?><div class="empty-state">Belum ada materi untuk kategori ini. Coba pilih kategori lainnya.</div><?php endif; ?>
</section><section class="quote-strip"><span>“</span><p>Merawat bumi bukan tugas satu orang. Itu kebiasaan yang kita bangun bersama.</p></section>
<?php require __DIR__ . '/includes/footer.php'; ?>