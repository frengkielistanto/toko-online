<?php
class Kategori extends CI_Controller {

    public function wanita()
    {
        //$data['wanita'] = $this->model_kategori->data_wanita();  
        $data['wanita'] = $this->model_kategori->data_wanita()->result();  
        $this->load->view('templates/header');
        $this->load->view('templates/sidebar');
        $this->load->view('wanita',$data);
        $this->load->view('templates/footer');
    }
    public function pria()
    {
        //$data['wanita'] = $this->model_kategori->data_wanita();  
        $data['pria'] = $this->model_kategori->data_pria()->result();  
        $this->load->view('templates/header');
        $this->load->view('templates/sidebar');
        $this->load->view('pria',$data);
        $this->load->view('templates/footer');
    }
    public function anak()
    {
        //$data['wanita'] = $this->model_kategori->data_wanita();  
        $data['anak'] = $this->model_kategori->data_anak()->result();  
        $this->load->view('templates/header');
        $this->load->view('templates/sidebar');
        $this->load->view('anak',$data);
        $this->load->view('templates/footer');
    }
    public function bayi()
    {
        //$data['wanita'] = $this->model_kategori->data_wanita();  
        $data['bayi'] = $this->model_kategori->data_bayi()->result();  
        $this->load->view('templates/header');
        $this->load->view('templates/sidebar');
        $this->load->view('bayi',$data);
        $this->load->view('templates/footer');
    }

}

/* End of file Controllername.php */
