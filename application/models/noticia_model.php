<?php

if (!defined('BASEPATH'))
    exit('Acesso direto ao script não é permitido');

class noticia_model extends CI_Model {

    function __construct() {
        parent::__construct();
    }
function listar() {
        //Listagem da tabela usuário
        $query = $this->db
                ->order_by('titulo','asc') //Ordem alfabética
                ->get('artigo');
        
        return $query->result();
    }
}

