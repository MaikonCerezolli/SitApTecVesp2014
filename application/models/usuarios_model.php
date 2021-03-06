<?php

if (!defined('BASEPATH'))
    exit('Acesso direto ao script não é permitido');

class Usuarios_model extends CI_Model {

    function __construct() {
        parent::__construct();
    }

    function inserir($data) {
        //Inserção na tabela usuario
        return $this->db->insert('usuario', $data);
    }

    function listar() {
        //Listagem da tabela usuário
        $query = $this->db
                ->order_by('nome','asc') //Ordem alfabética
                ->get('usuario');
        
        return $query->result();
    }

    function editar($idusuario) {
        $this->db->where('idusuario', $idusuario);
        $query = $this->db->get('usuario');
        return $query->result();
    }

    function atualizar($data) {
        $this->db->where('idusuario', $data['idusuario']);
        $this->db->set($data);
        return $this->db->update('usuario');
    }

    function deletar($idusuario) {
        
        //Busca os dados no banco 
        $busca = $this->editar($idusuario);
        
        $caminho = "c:/xampp/htdocs/sitApTecVesp2014/assets/images/";
        $arquivo = $caminho . $busca[0]->foto;
        
        //Exclusão do arquivo de foto
        if(is_file($arquivo)) unlink ($arquivo);
             
        $this->db->where('idusuario', $idusuario);
        return $this->db->delete('usuario');
    }

}

/* End of file usuarios_model.php */
/* Location: ./application/models/usuarios_model.php */