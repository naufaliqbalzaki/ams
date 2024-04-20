<?php
    ob_start();
    //cek session
    session_start();

    if(empty($_SESSION['admin'])){
        $_SESSION['err'] = '<center>Anda harus login terlebih dahulu!</center>';
        header("Location: ./");
        die();
    } else {
?>

<!doctype html>
<html lang="en">

<!-- Include Head START -->
<?php include('include/head.php'); ?>
<!-- Include Head END -->

<!-- Body START -->
<body class="bg">

<!-- Header START -->
<header>

<!-- Include Navigation START -->
<?php include('include/menu.php'); ?>
<!-- Include Navigation END -->

</header>
<!-- Header END -->

<!-- Main START -->
<main>

    <!-- container START -->
    <div class="container">

    <?php
        if(isset($_REQUEST['page'])){
            $page = $_REQUEST['page'];
            switch ($page) {
                case 'tsm':
                    include "transaksi_surat_masuk.php";
                    break;
                case 'ctk':
                    include "cetak_disposisi.php";
                    break;
                case 'tsk':
                    include "transaksi_surat_keluar.php";
                    break;
                case 'asm':
                    include "agenda_surat_masuk.php";
                    break;
                case 'ask':
                    include "agenda_surat_keluar.php";
                    break;
                case 'ref':
                    include "referensi.php";
                    break;
                case 'sett':
                    include "pengaturan.php";
                    break;
                case 'pro':
                    include "profil.php";
                    break;
                case 'gsm':
                    include "galeri_sm.php";
                    break;
                case 'gsk':
                    include "galeri_sk.php";
                    break;
            }
        } else {
    ?>
        <!-- Row START -->
        <div class="row">

            <!-- Include Header Instansi START -->
            <?php include('include/header_instansi.php'); ?>
            <!-- Include Header Instansi END -->

            <!-- Welcome Message START -->
            <div class="col s12">
    <div class="card">
        <div class="card-content center-align">
            <h4>Selamat Datang <?php echo $_SESSION['nama']; ?></h4>
            <div class="marquee">
                <p class="description">
                    Anda login sebagai
                    <?php
                    if($_SESSION['admin'] == 1){
                        echo "<strong>Super Admin</strong>. Anda memiliki akses penuh terhadap sistem.";
                    } elseif($_SESSION['admin'] == 2){
                        echo "<strong>Administrator</strong>. Berikut adalah statistik data yang tersimpan dalam sistem.";
                    } else {
                        echo "<strong>Admin</strong>. Berikut adalah statistik data yang tersimpan dalam sistem.";
                    }
                    ?>
                </p>
            </div>
        </div>
    </div>
</div>

<style>
    .marquee {
        width: 100%;
        overflow: hidden;
    }

    .marquee p {
        display: inline-block;
        white-space: nowrap;
        animation: marquee 20s linear infinite; /* Sesuaikan durasi animasi sesuai kebutuhan */
    }

    @keyframes marquee {
        0% {
            transform: translateX(100%);
        }
        100% {
            transform: translateX(-100%);
        }
    }
</style>
            <!-- Welcome Message END -->

            <?php
                //menghitung jumlah surat masuk
                $count1 = mysqli_num_rows(mysqli_query($config, "SELECT * FROM tbl_surat_masuk"));

                //menghitung jumlah surat masuk
                $count2 = mysqli_num_rows(mysqli_query($config, "SELECT * FROM tbl_surat_keluar"));

                //menghitung jumlah surat masuk
                $count3 = mysqli_num_rows(mysqli_query($config, "SELECT * FROM tbl_disposisi"));

                //menghitung jumlah klasifikasi
                $count4 = mysqli_num_rows(mysqli_query($config, "SELECT * FROM tbl_klasifikasi"));

                //menghitung jumlah pengguna
                $count5 = mysqli_num_rows(mysqli_query($config, "SELECT * FROM tbl_user"));
            ?>

            <!-- Info Statistic START -->
            <div class="col s12 m4">
            <div class="card" style="background-color: #DAA520; color: white;">
                    <div class="card-content">
                        <span class="card-title white-text"><i class="material-icons md-36">mail</i> Berkas Masuk Kantor Pusat</span>
                        <?php echo '<h5 class="white-text link">'.$count1.' Berkas Masuk Kantor Pusat</h5>'; ?>
                    </div>
                </div>
            </div>

            <div class="col s12 m4">
            <div class="card" style="background-color: #DAA520; color: white;">
                    <div class="card-content">
                        <span class="card-title white-text"><i class="material-icons md-36">drafts</i> Berkas Masuk Kantor Timur</span>
                        <?php echo '<h5 class="white-text link">'.$count2.' Berkas Masuk Kantor Timur</h5>'; ?>
                    </div>
                </div>
            </div>

            <div class="col s12 m4">
            <div class="card" style="background-color: #DAA520; color: white;">
                    <div class="card-content">
                        <span class="card-title white-text"><i class="material-icons md-36">description</i> Berkas Pusat Dikembalikan</span>
                        <?php echo '<h5 class="white-text link">'.$count3.' Dikembalikan</h5>'; ?>
                    </div>
                </div>
            </div>

            <div class="col s12 m4">
            <div class="card" style="background-color: #DAA520 ; color: white;">
                    <div class="card-content">
                        <span class="card-title white-text"><i class="material-icons md-36">class</i> Berkas Timur Dikembalikan</span>
                        <?php echo '<h5 class="white-text link">'.$count4.' Belum Tau</h5>'; ?>
                    </div>
                </div>
            </div>

        <?php
            if($_SESSION['id_user'] == 1 || $_SESSION['admin'] == 2){?>
            <div class="col s12 m4">
            <div class="card" style="background-color: #DAA520 ; color: white;">
                    <div class="card-content">
                        <span class="card-title white-text"><i class="material-icons md-36">people</i> Jumlah Pengguna</span>
                        <?php echo '<h5 class="white-text link">'.$count5.' Pengguna</h5>'; ?>
                    </div>
                </div>
            </div>
            <!-- Info Statistic START -->
        <?php
            }
        ?>

        </div>
        <!-- Row END -->
    <?php
        }
    ?>
    </div>
    <!-- container END -->

</main>
<!-- Main END -->

<!-- Include Footer START -->
<?php include('include/footer.php'); ?>
<!-- Include Footer END -->

</body>
<!-- Body END -->

</html>

<?php
    }
?>
