<?php

if (!defined('BASEPATH'))
    exit('Acesso direto ao script não é permitido');

class usuario extends CI_Controller {

    function __construct() {
        parent::__construct();
        /* Carrega o modelo */
        $this->load->model('usuario_model');
        /* Carrega a biblioteca do CodeIgniter responsável pela validação dos formulários */
        $this->load->library('form_validation');
    }

    function index() {
        $data['titulo'] = "CRUD com CodeIgniter | Cadastro de Pessoas";
        $data['usuario'] = $this->usuario_model->listar();
        $this->load->view('usuario_view.php', $data);
    }

    /**
     * Exibe a versão e configuração do PHP
     */
    public function info() {
        phpinfo();
        exit();
    }

    function inserir() {

        /* Carrega a biblioteca do CodeIgniter responsável pela validação dos formulários */
        //$this->load->library('form_validation');

        /* Define as tags onde a mensagem de erro será exibida na página */
        $this->form_validation->set_error_delimiters('<span>', '</span>');

        /* Define as regras para validação */
        $this->form_validation->set_rules('nome', 'Nome', 'required|max_length[40]');
        $this->form_validation->set_rules('email', 'E-mail', 'trim|required|valid_email|max_length[100]');

        /* Executa a validação e caso houver erro... */
        if ($this->form_validation->run() === FALSE) {
            /* Chama a função index do controlador */
            $this->index();
            /* Senão, caso sucesso na validação... */
        } else {
            /* Recebe os dados do formulário (visão) */
            $data['nome'] = $this->input->post('nome');
            $data['email'] = $this->input->post('email');

            /* Carrega o modelo */
            //$this->load->model('pessoas_model');

            /* Chama a função inserir do modelo */
            if ($this->usuario_model->inserir($data)) {
                redirect('usuario');
            } else {
                log_message('error', 'Erro ao inserir o usuario.');
            }
        }
    }

    function editar($idUsuario) {

        /* Aqui vamos definir o título da página de edição */
        $data['titulo'] = "CRUD com CodeIgniter | Editar usuario";

        /* Carrega o modelo */
        //$this->load->model('pessoas_model');

        /* Busca os dados da pessoa que será editada (id) */
        $data['dados_usuario'] = $this->usuario_model->editar($idUsuario);

        /* Carrega a página de edição com os dados da pessoa */
        $this->load->view('usuario_edit', $data);
    }

    function atualizar() {

        /* Carrega a biblioteca do CodeIgniter responsável pela validação dos formulários */
        //$this->load->library('form_validation');

        /* Define as tags onde a mensagem de erro será exibida na página */
        $this->form_validation->set_error_delimiters('<span>', '</span>');

        /* Aqui estou definindo as regras de validação do formulário, assim como 
          na função inserir do controlador, porém estou mudando a forma de escrita */
        $validations = array(
            array(
                'field' => 'nome',
                'label' => 'Nome',
                'rules' => 'trim|required|max_length[40]'
            ),
            array(
                'field' => 'email',
                'label' => 'E-mail',
                'rules' => 'trim|required|valid_email|max_length[100]'
            )
        );
        $this->form_validation->set_rules($validations);

        /* Executa a validação... */
        if ($this->form_validation->run() === FALSE) {
            /* Caso houver erro chama função editar do controlador novamente */
            $this->editar($this->input->post('idUsuario'));
        } else {
            /* Senão obtém os dados do formulário */
            $data['idUsuario'] = $this->input->post('idUsuario');
            $data['nome'] = ucwords($this->input->post('nome'));
            $data['email'] = strtolower($this->input->post('email'));
            /*colocar mais campos*/

            /* Carrega o modelo */
           // $this->load->model('usuario_model');

            /* Executa a função atualizar do modelo passando como parâmetro os dados obtidos do formulário */
            if ($this->usuario_model->atualizar($data)) {
                /* Caso sucesso ao atualizar, recarrega a página principal */
                redirect('usuario');
            } else {
                /* Senão exibe a mensagem de erro */
                log_message('error', 'Erro ao atualizar o usuario.');
            }
        }
    }

    function deletar($idUsuario) {

        /* Carrega o modelo */
        //$this->load->model('pessoas_model');

        /* Executa a função deletar do modelo passando como parâmetro o id da pessoa */
        if ($this->usuario_model->deletar($idUsuario)) {
            /* Caso sucesso ao atualizar, recarrega a página principal */
            redirect('usuario');
        } else {
            /* Senão exibe a mensagem de erro */
            log_message('error', 'Erro ao deletar o usuario.');
        }
    }

}

/* End of file usuario.php */
/* Location: ./application/controllers/pessoas.php */