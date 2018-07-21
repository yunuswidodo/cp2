<?php
// koneksi database
include 'KoneksiDB.php';


// menangkap data yang di kirim dari form
$Kode_Pelanggan = $_POST['Kode_Pelanggan'];
$Nama_Pelanggan = $_POST['Nama_Pelanggan'];
$Alamat = $_POST['Alamat'];
$No_Telepon = $_POST['No_Telepon'];


// menginput data ke database
mysqli_query($KoneksiDB,"insert into pelanggan values('$Kode_Pelanggan','$Nama_Pelanggan','$Alamat','$No_Telepon')");

// mengalihkan halaman kembali ke index.php
header("location:test.php");

?>
