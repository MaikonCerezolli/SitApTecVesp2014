

-- -----------------------------------------------------
-- Data for table `sitap`.`usuario`
-- -----------------------------------------------------
START TRANSACTION;
USE `sitap`;
INSERT INTO `sitap`.`usuario` (`idusuario`, `nome`, `senha`, `Email`, `Endereco`, `Telefone`, `Idade`, `foto`, `sexo`) VALUES (1, 'gilbersom silva', '1234', 'gilbert@gmail.com', 'limeira-104', 5783, 21, 'http://lorempixel.com/output/people-q-c-330-330-7.jpg', 'm');
INSERT INTO `sitap`.`usuario` (`idusuario`, `nome`, `senha`, `Email`, `Endereco`, `Telefone`, `Idade`, `foto`, `sexo`) VALUES (2, 'Gustavo lopez', '1234', 'gubomba@gmail.com', 'santa terezinha', 6404, 24, 'http://lorempixel.com/output/people-q-c-330-330-8.jpg', 'm');
INSERT INTO `sitap`.`usuario` (`idusuario`, `nome`, `senha`, `Email`, `Endereco`, `Telefone`, `Idade`, `foto`, `sexo`) VALUES (3, 'admin', '1234', 'admin@gmail.com', 'planalto', -185, 18, NULL, 'f');
INSERT INTO `sitap`.`usuario` (`idusuario`, `nome`, `senha`, `Email`, `Endereco`, `Telefone`, `Idade`, `foto`, `sexo`) VALUES (4, 'anonimo', '1234', 'anonimo@gmail.com', 'stefen', -999, 35, NULL, 'm');
INSERT INTO `sitap`.`usuario` (`idusuario`, `nome`, `senha`, `Email`, `Endereco`, `Telefone`, `Idade`, `foto`, `sexo`) VALUES (5, 'jeffer', '1234', 'jefrei@gmail.com', 'monte serra', -3210, 20, 'http://lorempixel.com/output/people-q-c-330-330-9.jpg', 'm');

COMMIT;

-- -----------------------------------------------------
-- Data for table `sitap`.`artigos`
-- -----------------------------------------------------
START TRANSACTION;
USE `sitap`;
INSERT INTO `sitap`.`artigos` (`idartigos`, `titulo`, `corpo`, `usuario_idusuario`, `like`, `data`) VALUES (1, 'A pizza nossa de cada dia', '<p>Mussum ipsum cacilds, vidis litro abertis. Consetis adipiscings elitis. Pra lá , depois divoltis porris, paradis. Paisis, filhis, espiritis santis. Mé faiz elementum girarzis, nisi eros vermeio, in elementis mé pra quem é amistosis quis leo. Manduma pindureta quium dia nois paga. Sapien in monti palavris qui num significa nadis i pareci latim. Interessantiss quisso pudia ce receita de bolis, mais bolis eu num gostis.</p>', 1, 15, '2014-10-12-16:45');
INSERT INTO `sitap`.`artigos` (`idartigos`, `titulo`, `corpo`, `usuario_idusuario`, `like`, `data`) VALUES (2, 'Dainos o baicom', '<p>Mussum ipsum cacilds, vidis litro abertis. Consetis adipiscings elitis. Pra lá , depois divoltis porris, paradis. Paisis, filhis, espiritis santis. Mé faiz elementum girarzis, nisi eros vermeio, in elementis mé pra quem é amistosis quis leo. Manduma pindureta quium dia nois paga. Sapien in monti palavris qui num significa nadis i pareci latim. Interessantiss quisso pudia ce receita de bolis, mais bolis eu num gostis.</p>', 2, 20, '2014-05-10-16:45');

COMMIT;

-- -----------------------------------------------------
-- Data for table `sitap`.`fotos`
-- -----------------------------------------------------
START TRANSACTION;
USE `sitap`;
INSERT INTO `sitap`.`fotos` (`idfotos`, `idartigos`, `arquivo`) VALUES (1, 1, 'http://lorempizza.com/i/1024/728');
INSERT INTO `sitap`.`fotos` (`idfotos`, `idartigos`, `arquivo`) VALUES (2, 1, 'http://lorempizza.com/i/1024/760');
INSERT INTO `sitap`.`fotos` (`idfotos`, `idartigos`, `arquivo`) VALUES (3, 2, 'http://revistadonna.clicrbs.com.br/wp-content/uploads/2014/10/bacon.jpg');
INSERT INTO `sitap`.`fotos` (`idfotos`, `idartigos`, `arquivo`) VALUES (4, 2, 'http://3.bp.blogspot.com/_gzuK9jsKG-g/R3-mOscnDAI/AAAAAAAADo0/IIW5mESwkRA/s1600/bacon.jpgNEW');

COMMIT;

-- -----------------------------------------------------
-- Data for table `sitap`.`categorias`
-- -----------------------------------------------------
START TRANSACTION;
USE `sitap`;
INSERT INTO `sitap`.`categorias` (`idcategorias`, `nome`, `decricao`) VALUES (1, 'pizza', 'categoria que fala sobre pizza');
INSERT INTO `sitap`.`categorias` (`idcategorias`, `nome`, `decricao`) VALUES (2, 'bacom', 'categoria que fala sobre bacom');

COMMIT;

-- -----------------------------------------------------
-- Data for table `sitap`.`comentario`
-- -----------------------------------------------------
START TRANSACTION;
USE `sitap`;
INSERT INTO `sitap`.`comentario` (`idusuario`, `idartigos`, `corpo`, `idcomentario`, `data`) VALUES (1, 1, 'que pizza gostosa', 1, '2014-10-12-8:56');
INSERT INTO `sitap`.`comentario` (`idusuario`, `idartigos`, `corpo`, `idcomentario`, `data`) VALUES (2, 2, 'bacom dlç', 2, '2014-12-15-8:32');

COMMIT;

-- -----------------------------------------------------
-- Data for table `sitap`.`artigos_has_categorias`
-- -----------------------------------------------------
START TRANSACTION;
USE `sitap`;
INSERT INTO `sitap`.`artigos_has_categorias` (`idartigos`, `idcategorias`) VALUES (1, 1);
INSERT INTO `sitap`.`artigos_has_categorias` (`idartigos`, `idcategorias`) VALUES (2, 2);

COMMIT;
