<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Model_barang extends CI_Model {
    public function tampil_data(){
        return $this->db->get('tb_barang'); //memanggil dari database
    }
    public function tambah_barang($data,$table){
        $this->db->insert($table,$data);
    }
    public function edit_barang($where, $table){
        return $this->db->get_where($table,$where); // menjalankan data yang akan diedit
    }
    public function update_data($where,$data,$table){
        $this->db->where($where);
        $this->db->update($table,$data);
    }  
    public function hapus_data($where, $table){
        $this->db->where($where);
        $this->db->delete($table);
    }
    public function find($id){
        $result = $this->db->get_where('tb_barang', ['id_brg' =>  $id]);
        // $this->db->select('*')->where('id_brg', $id)->limit(1, 1)->get('tb_barang');
        if($result->num_rows() > 0){
            return $result->row();
        }else{
            return array();
        }
    }

    public function detail_brg($id_brg)
    {
        $result = $this->db->where('id_brg',$id_brg)->get('tb_barang');
        if($result->num_rows() > 0){
            return $result->result();
        }else {
            return false;
        }
    }
    

}

/* End of file ModelName.php */

