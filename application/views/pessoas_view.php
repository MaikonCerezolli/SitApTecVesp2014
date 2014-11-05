<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <title><?php echo $titulo; ?></title>
        
        <link type="text/css" rel="stylesheet" href="<?php echo base_url(); ?>assets/css/estilo.css"/>
    </head>
    <body>
        <?php echo form_open('pessoas/inserir', 'id="pessoas-pessoas"'); ?>

        <label for="nome">Nome:</label><br/>
        <input type="text" name="nome" value="<?php echo set_value('nome'); ?>"/>
        <div class="error"><?php echo form_error('nome'); ?></div>
        
        <label for="nome">Senha:</label><br/>
        <input type="password" name="senha" value="<?php echo set_value('senha'); ?>"/>
        <div class="error"><?php echo form_error('senha'); ?></div>
        
        <label for="Email">E_mail:</label><br/>
        <input type="text" name="Email" value="<?php echo set_value('Email'); ?>"/>
        <div class="error"><?php echo form_error('Email'); ?></div>
        
        <label for="Endereco">Endereco:</label><br/>
        <input type="text" name="Endereco" value="<?php echo set_value('Endereco'); ?>"/>
        <div class="error"><?php echo form_error('Endereco'); ?></div>
        
        <label for="Telefone">Telefone:</label><br/>
        <input type="tel" name="Telefone" value="<?php echo set_value('Telefone'); ?>"/>
        <div class="error"><?php echo form_error('Telefone'); ?></div>
        
        <label for="Idade">Idade:</label><br/>
        <input type="tel" name="Idade" value="<?php echo set_value('Idade'); ?>"/>
        <div class="error"><?php echo form_error('Idade'); ?></div>

        <input type="submit" name="cadastrar" value="Cadastrar" />
        <?php echo form_close(); ?>

        <!-- Lista as Pessoas Cadastradas -->
        <div id="grid-pessoas">
            <ul>
                <?php foreach ($pessoas as $pessoa): ?>
                    <li>
                        <a title="Deletar" href="<?php echo base_url() . 'pessoas/deletar/' . $pessoa->idusuario; ?>" onclick="return confirm('Confirma a exclusão deste registro?')"><img src="<?php echo base_url(); ?>assets/img/lixo.png"/></a>
                        <span> - </span>
                        <a title="Editar" href="<?php echo base_url() . 'pessoas/editar/' . $pessoa->idusuario; ?>"><?php echo $pessoa->nome; ?></a>
                        <span> - </span>
                        <span><?php echo $pessoa->email; ?></span>
                    </li>
                <?php endforeach ?>
            </ul>
        </div>
        <!-- Fim Lista -->
    </body>
</html>