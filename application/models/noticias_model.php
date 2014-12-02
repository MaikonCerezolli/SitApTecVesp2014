<?php

if (!defined('BASEPATH'))
    exit('Acesso direto ao script não é permitido');

class Noticias_model extends CI_Model {

    function __construct() {
        parent::__construct();
    }

    function inserir($data) {
        //Inserção na tabela usuario
        return $this->db->insert('artigo', $data);
    }

    function listar() {
        //Listagem da tabela usuário
        $query = $this->db
                ->order_by('data','desc') //Ordem de data da maior para a menor
                ->get('artigo');
        return $query->result();
    }

    function editar($idartigo) {
        $this->db->where('idartigo', $idartigo);
        $query = $this->db->get('artigo');
        return $query->result();
    }

    function atualizar($data) {
        $this->db->where('idartigo', $data['idartigo']);
        $this->db->set($data);
        return $this->db->update('artigo');
    }

    function deletar($idartigo) {
        $this->db->where('idartigo', $idartigo);
        return $this->db->delete('artigo');
    }

}

/* End of file usuarios_model.php */
/* Location: ./application/models/usuarios_model.php */