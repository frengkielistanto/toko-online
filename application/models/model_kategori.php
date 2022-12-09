<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Model_kategori extends CI_Model {
    public function data_wanita()
    {
     return $this->db->get_where("tb_barang",array('kategori' => 'wanita'));//kalau semua get
    }
    public function data_pria()
    {
     return $this->db->get_where("tb_barang",array('kategori' => 'pria'));//kalau semua get
    }
    public function data_anak()
    {
     return $this->db->get_where("tb_barang",array('kategori' => 'anak'));//kalau semua get
    }
    public function data_bayi()
    {
     return $this->db->get_where("tb_barang",array('kategori' => 'bayi'));//kalau semua get
    }
}

/* End of file ModelName.php */
