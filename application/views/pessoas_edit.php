<!DOCTYPE html>
<html lang="pt-br">
<head>
    <title><?php echo $titulo; ?></title>
    <meta charset="UTF-8" />
    <link type="text/css" rel="stylesheet" href="<?php echo base_url(); ?>assets/css/estilo.css"/>
</head>
<body>
	<?php echo form_open('pessoa/atualizar', 'id="form-pessoas'); ?>
 
	<input type="hidden" name="id" value="<?php echo $dados_pessoa[0]->idusuario; ?>"/>
 
	<label for="nome">Nome:</label><br/>
	<input type="text" name="nome" value="<?php echo $dados_pessoa[0]->nome; ?>"/>
	<div class="error"><?php echo form_error('nome'); ?></div>
        
        <label for="senha">Senha:</label><br/>
        <input type="password" name="senha" value="<?php echo $dados_pessoa[0]->senha; ?>"/>
	<div class="error"><?php echo form_error('senha'); ?></div>
 
	<label for="Email">Email:</label><br/>
        <input type="Email" name="Email" value="<?php echo $dados_pessoa[0]->Email; ?>"/>
	<div class="error"><?php echo form_error('Email'); ?></div>
        
        <label for="Endereco">Endereço:</label><br/>
	<input type="text" name="Endereco" value="<?php echo $dados_pessoa[0]->Endereco; ?>"/>
	<div class="error"><?php echo form_error('Endereco'); ?></div>
        
        <label for="Telefone">Telefone:</label><br/>
        <input type="tel" name="Telefone" value="<?php echo $dados_pessoa[0]->Telefone; ?>"/>
	<div class="error"><?php echo form_error('Telefone'); ?></div>
        
        <label for="Idade">Idade:</label><br/>
        <input type="tel" name="Idade" value="<?php echo $dados_pessoa[0]->Idade; ?>"/>
	<div class="error"><?php echo form_error('Idade'); ?></div>
 
	<input type="submit" name="atualizar" value="Atualizar" />
 
	<?php echo form_close(); ?>
</body>
</html>