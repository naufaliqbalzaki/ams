<?php
//cek session
require 'vendor/autoload.php';

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;


if (empty($_SESSION['admin'])) {
  $_SESSION['err'] = '<center>Anda harus login terlebih dahulu!</center>';
  header("Location: ./");
  die();
} else {
  // include "excel-reader/excel_reader2.php";


  if ($_SESSION['admin'] != 1 and $_SESSION['admin'] != 2) {
    echo '<script language="javascript">
                    window.alert("ERROR! Anda tidak memiliki hak akses untuk membuka halaman ini");
                    window.location.href="./logout.php";
                  </script>';
  } else {

    //proses upload file
    if (isset($_POST['submit'])) {

      $file = $_FILES['file']['tmp_name'];

      if ($file == "") {
        $_SESSION['errEmpty'] = 'ERROR! Form File tidak boleh kosong';
        header("Location: ./admin.php?page=ref&act=imp");
        die();
      } else {

        $x = explode('.', $_FILES['file']['name']);
        $eks = strtolower(end($x));

        if ($eks == 'xls' || $eks == 'xlsx') {

          //jika tidak ingin menghapus data yang sudah ada
          if (isset($_REQUEST['cek'])) {

            //mengosongkan table klasifikasi
            mysqli_query($config, "TRUNCATE TABLE tbl_surat_masuk");

            //upload file
            if (is_uploaded_file($file)) {
              $_SESSION['succUpload'] = 'SUKSES! Data berhasil diimport';
            } else {
              $_SESSION['errUpload'] = 'ERROR! Proses upload data gagal';
              header("Location: ./admin.php?page=ref&act=imp");
              die();
            }

            // $spreadsheet = \PhpOffice\PhpSpreadsheet\IOFactory::load($_FILES['file']['tmp_name']);
            $spreadsheet = \PhpOffice\PhpSpreadsheet\IOFactory::load($_FILES['file']['tmp_name']);
            $data = $spreadsheet->getSheetByName('Sheet2')->toArray();
            // delete first 3 rows
            array_shift($data);
            array_shift($data);
            array_shift($data);
            array_shift($data);
            foreach ($data as $key => $value) {
              if (
                $key > 0
              ) {
                $no_online  = $value[1];
                $pemohon = isset($value[2]) ? $value[2] : null;
                $pemohon_escaped = ($pemohon !== null) ? $mysqli->real_escape_string($pemohon) : null;

                $isi = $value[3];
                $dinas = $value[4];
                $ket_lanjut  = $value[5];
                $ket_perbaikan = $value[6];
                $tgl_diterima  = $value[7] !== null && strtotime($value[7]) ? date('Y-m-d', strtotime($value[7])) : null;
                $jam_diterima  = $value[8];
                $tgl_surat = $value[9] !== null && strtotime($value[9]) ? date('Y-m-d', strtotime($value[9])) : null;
                $jam_surat  = $value[10];
                $keterangan  = $value[11];
                $no_telp = $value[12];

                if ($pemohon !== null) {
                  // Create SQL statement using prepared statements
                  $q = "INSERT INTO tbl_surat_masuk (no_online, pemohon, isi, dinas, ket_lanjut, ket_perbaikan, tgl_diterima, jam_diterima, tgl_surat, jam_surat, keterangan, no_telp) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

                  $stmt = $mysqli->prepare($q);
                  if ($stmt === false) {
                    die('MySQL prepare error: ' . $mysqli->error);
                  }

                  $stmt->bind_param("ssssssssssss", $no_online, $pemohon_escaped, $isi, $dinas, $ket_lanjut, $ket_perbaikan, $tgl_diterima, $jam_diterima, $tgl_surat, $jam_surat, $keterangan, $no_telp);

                  $stmt->execute();
                  if ($stmt->error) {
                    die('Execute error: ' . $stmt->error);
                  }

                  $stmt->close();
                }
              }
            }

            header("Location: ./admin.php?page=ref");
            die();
          } else {



            //upload file
            if (is_uploaded_file($file)) {
              $_SESSION['succUpload'] = 'SUKSES! Data berhasil diimports';
            } else {
              $_SESSION['errUpload'] = 'ERROR! Proses upload data gagal';
              header("Location: ./admin.php?page=ref&act=imp");
              die();
            }


            //membuka file exc
            $data    = new Spreadsheet_Excel_Reader($_FILES['file']['tmp_name'], false);

            $id_user = $_SESSION['id_user'];
            $baris = $data->rowcount($sheet_index = 0);

            for ($i = 2; $i <= $baris; $i++) {
              $data1        = $data->val($i, 1);
              $data2        = $data->val($i, 2);
              $data3        = $data->val($i, 3);
              $data4        = $data->val($i, 4);
              $data5        = $data->val($i, 5);
              $data6        = $data->val($i, 6);
              $data7        = $data->val($i, 7);
              $data8        = $data->val($i, 8);
              $data9        = $data->val($i, 9);
              $data10        = $data->val($i, 10);

              $query = mysqli_query($config, "INSERT into tbl_surat_masuk(id_surat,no_agenda,no_surat,asal_surat,isi,kode,indeks,tgl_surat,tgl_diterima,file,keterangan,id_user) values(null,'$data1','$data2','$data3','$data4','$data5','$data6','$data7','$data8','$data9','$data10','$id_user')");
            }


            header("Location: ./admin.php?page=tsm");
            die();
          }
        } else {
          $_SESSION['errFormat'] = 'ERROR! Format file yang diperbolehkan hanya CSV dan XLS';
          header("Location: ./admin.php?page=ref&act=imp");
          die();
        }
      }
    }

    echo '
                <!-- Row Start -->
                <div class="row">
                    <!-- Secondary Nav START -->
                    <div class="col s12">
                        <div class="z-depth-1">
                            <nav class="secondary-nav">
                            <div class="nav-wrapper" style="background-color: #2C559E;">
                                    <div class="col m12">
                                        <ul class="left">
                                            <li class="waves-effect waves-light"><a href="?page=ref&act=imp" class="judul"><i class="material-icons">bookmark</i> Import Berkas</a></li>
                                            <li class="waves-effect waves-light"><a href="./"><i class="material-icons">arrow_back</i> Kembali</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </nav>
                        </div>
                    </div>
                    <!-- Secondary Nav END -->
                </div>
                <!-- Row END -->';

    if (isset($_SESSION['errFormat'])) {
      $errFormat = $_SESSION['errFormat'];
      echo '<div id="alert-message" class="row">
                            <div class="col m12">
                                <div class="card red lighten-5">
                                    <div class="card-content notif">
                                        <span class="card-title red-text"><i class="material-icons md-36">clear</i> ' . $errFormat . '</span>
                                    </div>
                                </div>
                            </div>
                        </div>';
      unset($_SESSION['errFormat']);
    }
    if (isset($_SESSION['errUpload'])) {
      $errUpload = $_SESSION['errUpload'];
      echo '<div id="alert-message" class="row">
                            <div class="col m12">
                                <div class="card red lighten-5">
                                    <div class="card-content notif">
                                        <span class="card-title red-text"><i class="material-icons md-36">clear</i> ' . $errUpload . '</span>
                                    </div>
                                </div>
                            </div>
                        </div>';
      unset($_SESSION['errUpload']);
    }
    if (isset($_SESSION['errEmpty'])) {
      $errEmpty = $_SESSION['errEmpty'];
      echo '<div id="alert-message" class="row">
                            <div class="col m12">
                                <div class="card red lighten-5">
                                    <div class="card-content notif">
                                        <span class="card-title red-text"><i class="material-icons md-36">clear</i> ' . $errEmpty . '</span>
                                    </div>
                                </div>
                            </div>
                        </div>';
      unset($_SESSION['errEmpty']);
    }

    echo '
                <!-- Row form Start -->
                <div class="row">
                    <div class="col m12">
                        <div class="card">
                            <div class="card-content">
                                <span class="card-title black-text">Import Data Laporan</span>
                                <p class="kata">Silakan Import Data (file excel) lalu klik tombol <strong>"Import"</strong> untuk melakukan import file</p><br/>';

    // download file contoh format csv
    if (isset($_REQUEST['download'])) {

      $dir = "./asset/";
      $file = $dir . "contoh_format.csv";

      if (file_exists($file)) {
        header('Content-Description: File Transfer');
        header('Content-Type: application/octet-stream');
        header('Content-Disposition: attachment; filename="contoh_format.csv"');
        header('Content-Transfer-Encoding: binary');
        header('Expires: 0');
        header('Cache-Control: private');
        header('Pragma: private');
        header('Content-Length: ' . filesize($file));
        ob_clean();
        flush();
        readfile($file);
        exit;
      }
    }
    echo '

                                <p class="kata"><span class="red-text"><i class="material-icons">error_outline</i> <strong>PERINGATAN!</strong></span><br/>Secara default, data yang ada akan diganti dengan data yang baru. Jika tidak ingin menghapus data yang sudah ada, silakan centang checkbox <i class="material-icons">check_box_outline_blank</i> dibawah form file.</p>
                            </div>
                            <div class="card-action">
                                <form method="post" enctype="multipart/form-data">
                                    <div class="file-field input-field col m6 tooltipped" data-position="top" data-tooltip="Format file yang diperbolehkan hanya CSV dan XLS">
                                        <div class="btn light-green darken-1">
                                            <span>File</span>
                                            <input type="file" name="file" accept=".csv, .xls, .xlsx" required>
                                        </div>
                                        <div class="file-path-wrapper">
                                            <input class="file-path validate" placeholder="Upload File Excel Disini" type="text">
                                         </div>
                                    </div>&nbsp;&nbsp;&nbsp;&nbsp;
                                    <div class="col m12" style="margin-bottom: 25px;">
                                    <input type="checkbox" id="cek" name="cek" checked>
                                        <label for="cek" class="kata" style="color: #444;">Centang jika tidak ingin menghapus data yang sudah ada</label>
                                    </div>
                                    <button type="submit" class="btn-large blue waves-effect waves-light" name="submit">IMPORT <i class="material-icons">file_upload</i></button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>';
  }
}
