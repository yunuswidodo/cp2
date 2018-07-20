<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="tugas.css">

  </head>
  <body>
    <nav class="navbar navbar-inverse">
      <div class="container-fluid">
        <div class="navbar-header">
          <a class="navbar-brand" href="#">WebSiteName</a>
        </div>
        <ul class="nav navbar-nav">
          <li class="active"><a href="#">Home</a></li>
          <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">barang <span></span></a>
          <li><a href="#">Page 2</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
          <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
          <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
        </ul>
      </div>
    </nav>

    <h2> Data Pelanggan </h2>
    <br>
    <a href="tamabah.php"> +Tambah Mahasiswa</a>
    <br>
    <br>
    <table border="1" >
      <tr>
        <th>  Kode Pelanggan </th>
        <th> Nama Pelanggan </th>
        <th> Alamat </th>
        <th> No Telepon </th>
        <th> Opsi </th>
      </tr>
      <?php
  include 'KoneksiDB.php';
  $no = 1;
  $data = mysqli_query($KoneksiDB, "select * from Pelanggan");
  while($d = mysqli_fetch_array($data)){
    ?>
    <tr>

      <td><?php echo $d['Kode_Pelanggan']; ?></td>
      <td><?php echo $d['Nama_Pelanggan']; ?></td>
      <td><?php echo $d['Alamat']; ?></td>
      <td><?php echo $d['No_Telepon']; ?></td>
      <td>
        <a href="edit.php?id=<?php echo $d['id']; ?>">EDIT</a>
        <a href="hapus.php?id=<?php echo $d['id']; ?>">HAPUS</a>
      </td>
    </tr>
    <?php
  }
  ?>
</table>


  </body>
</html>
