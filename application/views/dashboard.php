<div class="container-fluid">
    <div class="row text-center mt-4">
        <?php foreach ($barang as $brg) : ?>
            <div class="card ml-3 mb-3" style="width: 16rem;">
                <img style="height: 200px" src="<?php echo base_url().'/uploads/'.$brg->gambar ?>" class="card-img-top" alt="..."> <!--menampilkan gambar dari folder upload -->
                <div class="card-body">
                    <h5 class="card-title mb-1"><?php echo $brg->nama_brg ?></h5> <!-- menampilkan nama pada card dan nama_brg itu sesuaikan sama di database-->
                    <small><?php echo $brg->keterangan ?></small><br>
                    <span class="badge badge-warning mb-3">Rp.<?php echo number_format($brg->harga, 0,',','.') ?></span>
                    <?php echo anchor('dashboard/tambah_ke_keranjang/'.$brg->id_brg, '<div class="btn btn-sm btn-primary">Tambah Ke Keranjang</div>')  ?>
                    <?php echo anchor('dashboard/detail/'.$brg->id_brg, '<div class="btn btn-sm btn-success">Detail</div>')  ?>
                </div>
            </div>

        <?php endforeach; ?>
    </div>
</div>