<?php
    //cek session
    if(!empty($_SESSION['admin'])){
?>

<nav style="background-color: #2C559E;">
    <div class="nav-wrapper" id="screen_view_container">
        <a href="./" class="brand-logo center hide-on-large-only"><i class="material-icons md-36">school</i>DPMPTSP</a>
        <ul id="slide-out" class="side-nav" data-simplebar-direction="vertical">
        <li class="no-padding custom-bg">
            <style>
    .custom-bg {
        background-color: #2C559E !important;
    }
</style>

<div class="logo-side center custom-bg" style="background-color: #2C559E;">
                    <?php
                        $query = mysqli_query($config, "SELECT * FROM tbl_instansi");
                        while($data = mysqli_fetch_array($query)){
                            if(!empty($data['logo'])){
                                echo '<img class="logoside" src="./upload/'.$data['logo'].'"/>';
                            } else {
                                echo '<img class="logoside" src="./asset/img/logo.png"/>';
                            }
                            if(!empty($data['nama'])){
                                echo '<h5 class="smk-side">'.$data['nama'].'</h5>';
                            } else {
                                echo '<h5 class="smk-side">DPMPTSP SURABAYA</h5>';
                            }
                            if(!empty($data['alamat'])){
                                echo '<p class="description-side">'.$data['alamat'].'</p>';
                            } else {
                                echo '<p class="description-side">Jl. Tunjungan No. 1-3 Genteng, Surabaya 60275</p>';
                            }
                        }
                    ?>
                </div>
            </li>
            <li class="custom-bg">
                <ul class="collapsible collapsible-accordion">
                    <li>
                        <a class="collapsible-header"><i class="material-icons">account_circle</i><?php echo $_SESSION['nama']; ?></a>
                        <div class="collapsible-body">
                            <ul>
                                <li><a href="?page=pro">Profil</a></li>
                                <li><a href="?page=pro&sub=pass">Ubah Password</a></li>
                                <li><a href="logout.php">Logout</a></li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </li>
            <li><a href="./"><i class="material-icons middle">dashboard</i> Beranda</a></li>
            <li class="no-padding custom-bg">
                <?php
                    if($_SESSION['admin'] == 1 || $_SESSION['admin'] == 3){ ?>
                <ul class="collapsible collapsible-accordion">
                    <li>
                        <a class="collapsible-header"><i class="material-icons">repeat</i>Rekap Berkas</a>
                        <div class="collapsible-body">
                            <ul>
                                <li><a href="?page=tsm">Data Berkas Kantor Pusat</a></li>
                                <li><a href="?page=tsk">Data Berkas Kantor Timur</a></li>
                            </ul>
                        </div>
                   </li>
                </ul>
                <?php
                    }
                ?>
            </li>
            <li class="no-padding custom-bg">
                <ul class="collapsible collapsible-accordion">
                    <li>
                        <a class="collapsible-header"><i class="material-icons">assignment</i>Buku Agenda Kantor</a>
                        <div class="collapsible-body">
                            <ul>
                                <li><a href="?page=asm">Buku Agenda Kantor Pusat</a></li>
                                <li><a href="?page=ask">Buku Agenda Kantor Timur</a></li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </li>
            <li class="no-padding custom-bg">
                <ul class="collapsible collapsible-accordion">
                    <li>
                        <a class="collapsible-header"><i class="material-icons">image</i> Galeri File</a>
                        <div class="collapsible-body">
                            <ul>
                                <li><a href="?page=gsm">Surat Masuk</a></li>
                                <li><a href="?page=gsk">Surat Keluar</a></li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </li>
            <li><a href="?page=ref"><i class="material-icons middle">class</i> Referensi</a></li>
            <li class="no-padding custom-bg">
            <?php
                if($_SESSION['admin'] == 1){ ?>
                <ul class="collapsible collapsible-accordion">
                    <li>
                        <a class="collapsible-header"><i class="material-icons">settings</i> Pengaturan</a>
                        <div class="collapsible-body">
                            <ul>
                                <li><a href="?page=sett">Instansi</a></li>
                                <li><a href="?page=sett&sub=usr">User</a></li>
                                <li><a href="?page=sett&sub=back">Backup Database</a></li>
                                <li><a href="?page=sett&sub=rest">Restore Database</a></li>
                            </ul>
                        </div>
                    </li>
                </ul>
            <?php
                }
            ?>
            <?php
                if($_SESSION['admin'] == 2){ ?>
                <ul class="collapsible collapsible-accordion">
                    <li>
                        <a class="collapsible-header"><i class="material-icons">settings</i> Pengaturan</a>
                        <div class="collapsible-body">
                            <ul>
                                <li><a href="?page=sett">Instansi</a></li>
                                <li><a href="?page=sett&sub=usr">User</a></li>
                            </ul>
                        </div>
                    </li>
                </ul>
            <?php
                }
            ?>
            </li>
        </ul>
        <!-- Menu on medium and small screen END -->

        <!-- Menu on large screen START -->
        <ul class="center hide-on-med-and-down" id="nv">
        <li style="display: flex; align-items: center;">
    <a href="./" class="ams hide-on-med-and-down" style="display: flex; align-items: center;">
        <img src="./upload/dpmptsp.jpg" class="logo" style="width: 50px; height: auto; margin-top: 3%;">
        <span style="margin-left: 0%;">DPM-PTSP</span>
    </a>
</li>


            <li><div class="grs"></></li>
            <li><a href="./"><i class="material-icons"></i>&nbsp; Beranda</a></li>
            <?php
                if($_SESSION['admin'] == 1 || $_SESSION['admin'] == 3){ ?>
            <li><a class="dropdown-button" href="#!" data-activates="transaksi">Rekap Berkas<i class="material-icons md-18">arrow_drop_down</i></a></li>
                <ul id='transaksi' class='dropdown-content' style="background-color: #DAA520;"> 
                    <li><a href="?page=tsm">Data Berkas Kantor Pusat</a></li>
                    <li><a href="?page=tsk">Data Berkas Kantor Timur</a></li>
                </ul>
            <?php
                }
            ?>
            <li><a class="dropdown-button" href="#!" data-activates="agenda">Buku Agenda <i class="material-icons md-18">arrow_drop_down</i></a></li>
                <ul id='agenda' class='dropdown-content' style="background-color: #DAA520;">
                    <li><a href="?page=asm">Buku Agenda Kantor Pusat</a></li>
                    <li><a href="?page=ask">Buku Agenda Kantor Timur</a></li>
                </ul>
            <?php
                if($_SESSION['admin'] == 1){ ?>
            <li><a class="dropdown-button" href="#!" data-activates="pengaturan">Pengaturan <i class="material-icons md-18">arrow_drop_down</i></a></li>
                <ul id='pengaturan' class='dropdown-content' style="background-color: #DAA520;">
                    <li><a href="?page=sett">Instansi</a></li>
                    <li><a href="?page=sett&sub=usr">User</a></li>
                    <li class="divider"></li>
                    <li><a href="?page=sett&sub=back">Backup Database</a></li>
                    <li><a href="?page=sett&sub=rest">Restore Database</a></li>
                </ul>
            <?php
                }
            ?>
            <?php
                if($_SESSION['admin'] == 2){ ?>
            <li><a class="dropdown-button" href="#!" data-activates="pengaturan">Pengaturan <i class="material-icons md-18">arrow_drop_down</i></a></li>
                <ul id='pengaturan' class='dropdown-content'>
                    <li><a href="?page=sett">Instansi</a></li>
                    <li><a href="?page=sett&sub=usr">User</a></li>
                </ul>
            <?php
                }
            ?>
            <li class="right" style="margin-right: 10px;"><a class="dropdown-button" href="#!" data-activates="logout"><i class="material-icons">account_circle</i> <?php echo $_SESSION['nama']; ?><i class="material-icons md-18">arrow_drop_down</i></a></li>
                <ul id='logout' class='dropdown-content' style="background-color: #DAA520;">
                    <li><a href="?page=pro">Profil</a></li>
                    <li><a href="?page=pro&sub=pass">Ubah Password</a></li>
                    <li class="divider"></li>
                    <li><a href="logout.php"><i class="material-icons">settings_power</i> Logout</a></li>
                </ul>
        </ul>
        <!-- Menu on large screen END -->
        <a href="#" data-activates="slide-out" class="button-collapse" id="menu"><i class="material-icons">menu</i></a>
    </div>
</nav>

<?php
    } else {
        header("Location: ../");
        die();
    }
?>
