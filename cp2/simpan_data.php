<?php

require_once 'KoneksiDB.php';

if (isset($_POST['submit'])) {
  // code...

$Kode_Barang = $_POST['Kode_Barang'];
$Nama_barang  = $_POST['Nama_Barang'];
$Satuan       = $_POST['Satuan'];
$Harga_Distributor = $_POST['Harga_Distributor'];
$Harga_Retail = $_POST['Harga_Retail'];
$Stok         = $_POST['Stok'];

$con= mysqli_query($KoneksiDB, "INSERT INTO Barang (Kode_Barang, Nama_Barang, Satuan, Harga_Distributor, Harga_Retail, Stok) values ('$Kode_Barang','$Nama_barang','$Satuan','$Harga_Distributor','$Harga_Retail','$Stok')");

if ($con) {
  echo "berhasil";
}else {
  echo "belum";
}

}
 ?>
