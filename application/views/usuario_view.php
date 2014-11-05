<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <title><?php echo $titulo; ?></title>
        <meta charset="UTF-8" />
        <link type="text/css" rel="stylesheet" href="<?php echo base_url(); ?>assets/css/estilo.css"/>
    </head>
    <body>
        <?php echo form_open('usuario/inserir', 'id="form-pessoas"'); ?>

        <label for="nome">Nome:</label><br/>
        <input type="text" name="nome" value="<?php echo set_value('nome'); ?>"/>
        <div class="error"><?php echo form_error('nome'); ?></div>
        
        <label for="senha">Senha:</label><br/>
        <input type="text" name="senha" value="<?php echo set_value('senha'); ?>"/>
        <div class="error"><?php echo form_error('senha'); ?></div>
        
        <label for="foto">Foto:</label><br/>
        <input type="text" name="foto" value="<?php echo set_value('foto'); ?>"/>
        <div class="error"><?php echo form_error('foto'); ?></div>
        
        <label for="telefone">Telefone:</label><br/>
        <input type="text" name="telefone" value="<?php echo set_value('telefone'); ?>"/>
        <div class="error"><?php echo form_error('telefone'); ?></div>
        
        <label for="email">Email:</label><br/>
        <input type="text" name="email" value="<?php echo set_value('email'); ?>"/>
        <div class="error"><?php echo form_error('email'); ?></div>
        
        <input type="submit" name="cadastrar" value="Cadastrar" />

        <?php echo form_close(); ?>

        <!-- Lista as Pessoas Cadastradas -->
        <div id="grid-pessoas">
            <ul>
                <?php foreach ($usuario as $usuario): ?>
                    <li>
                        <a title="Deletar" href="<?php echo base_url() . 'usuario/deletar/' . $usuario->idUsuario; ?>" onclick="return confirm('Confirma a exclusão deste registro?')">
                        <img src="<?php echo base_url(); ?>assets/img/lixo.png" />
                        </a>
                        <span> - </span>
                        <a title="Editar" href="<?php echo base_url() . 'usuario/editar/' . $usuario->idUsuario; ?>"><?php echo $usuario->nome; ?></a>
                        <span> - </span>
                        <span><?php echo $usuario->senha; ?></span>
                        <span> - </span>
                        <span><img src="<?php echo base_url(); ?>assets/img/<?php echo $usuario->foto; ?>"/></span>
                        <span> - </span>
                        <span><?php echo $usuario->telefone; ?></span>
                        <span> - </span>
                        <span><?php echo $usuario->email; ?></span>
                    </li>
                <?php endforeach ?>
            </ul>
        </div>
        <!-- Fim Lista -->


    </body>
</html>
