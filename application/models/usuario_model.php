
<?php

if (!defined('BASEPATH'))
    exit('Acesso direto ao script não é permitido');

class usuario_model extends CI_Model {

    function __construct() {
        parent::__construct();
    }

    function inserir($data) {
        return $this->db->insert('usuario', $data);
    }

    function listar() {
        $query = $this->db->get('usuario');
        return $query->result();
    }

    function editar($idUsuario) {
        $this->db->where('idUsuario', $idUsuario);
        $query = $this->db->get('usuario');
        return $query->result();
    }

    function atualizar($data) {
        $this->db->where('idUsuario', $data['idUsuario']);
        $this->db->set($data);
        return $this->db->update('usuario');
    }

    function deletar($idUsuario) {
        $this->db->where('idUsuario', $idUsuario);
        return $this->db->delete('usuario');
    }

}

/* End of file usuario_model.php */
/* Location: ./application/models/pessoas_model.php */