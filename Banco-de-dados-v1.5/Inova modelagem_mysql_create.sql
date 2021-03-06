CREATE TABLE `USUARIO` (
	`id_usuario` INT NOT NULL AUTO_INCREMENT,
	`nome_completo` INT NOT NULL AUTO_INCREMENT,
	`sexo` INT NOT NULL AUTO_INCREMENT,
	`CPF` INT,
	`Email` INT NOT NULL AUTO_INCREMENT,
	`telefone` INT NOT NULL AUTO_INCREMENT,
	`pernissao` INT NOT NULL AUTO_INCREMENT,
	`ultimo_acesso` DATETIME NOT NULL AUTO_INCREMENT,
	`login` INT NOT NULL AUTO_INCREMENT,
	`senha` INT NOT NULL AUTO_INCREMENT,
	`senha` INT UNIQUE,
	`descricao_perfil` varchar(255) NOT NULL,
	PRIMARY KEY (`id_usuario`)
);

CREATE TABLE `ALUNO` (
	`id_aluno` INT NOT NULL AUTO_INCREMENT,
	`curso` INT NOT NULL,
	`projeto` INT NOT NULL,
	`turno` INT NOT NULL,
	`periodo` INT NOT NULL,
	`status` INT NOT NULL,
	`comentario` INT NOT NULL,
	PRIMARY KEY (`id_aluno`)
);

CREATE TABLE `PROFESSOR` (
	`id_professor` INT NOT NULL AUTO_INCREMENT,
	`nome_completo` INT NOT NULL,
	`graduacao` INT NOT NULL,
	`mestrado` INT NOT NULL,
	`doutorado` INT NOT NULL,
	`curso` INT NOT NULL,
	`comentario` varchar(255) NOT NULL,
	PRIMARY KEY (`id_professor`)
);

CREATE TABLE `COORDENADOR` (
	`id_coordenador` INT NOT NULL AUTO_INCREMENT,
	`nome_completo` INT NOT NULL,
	`graduação` INT NOT NULL,
	`mestrado` INT NOT NULL,
	`doutorado` INT NOT NULL,
	`validar_projeto` BOOLEAN NOT NULL,
	`curso` INT NOT NULL,
	`comentario` varchar(255) NOT NULL,
	PRIMARY KEY (`id_coordenador`)
);

CREATE TABLE `PERMISSAO` (
	`id_permissao` INT NOT NULL AUTO_INCREMENT,
	`administrador` INT NOT NULL,
	`aluno` INT NOT NULL,
	`professor` INT NOT NULL,
	`coodenador` INT NOT NULL,
	`visitante` INT NOT NULL,
	`usuario` INT NOT NULL,
	PRIMARY KEY (`id_permissao`)
);

CREATE TABLE `OPERACAO` (
	`id_operacao` INT NOT NULL,
	`incluir` INT NOT NULL,
	`alterar` INT NOT NULL,
	`excluir` INT NOT NULL,
	`visualizar` INT NOT NULL,
	`notifica` INT NOT NULL,
	`busca_filtrar` INT NOT NULL
);

CREATE TABLE `INSTITUICAO` (
	`id_instituicao` INT NOT NULL AUTO_INCREMENT,
	`endereço` varchar(255) NOT NULL,
	`reitor` INT NOT NULL,
	`reitor` INT NOT NULL,
	`CNPJ` INT NOT NULL,
	`nome_fantasia` INT NOT NULL,
	`razao_social` INT NOT NULL,
	PRIMARY KEY (`id_instituicao`)
);

CREATE TABLE `PROJETO` (
	`id_projeto` INT NOT NULL AUTO_INCREMENT,
	`tema` varchar(255) NOT NULL,
	`descricao` varchar(255) NOT NULL,
	`cometario` varchar(255) NOT NULL,
	`status` INT(255) NOT NULL,
	`resumo` varchar(255) NOT NULL,
	PRIMARY KEY (`id_projeto`)
);

CREATE TABLE `AVALIACAO` (
	`id_avaliacao` INT NOT NULL AUTO_INCREMENT,
	`id_projeto` INT NOT NULL,
	`nota` FLOAT NOT NULL,
	`cometario` varchar(255) NOT NULL,
	PRIMARY KEY (`id_avaliacao`)
);

CREATE TABLE `ALUNO_INSTITUIÇÃO` (
	`id_aluno` INT NOT NULL,
	`id_instituicao` INT NOT NULL
);

CREATE TABLE `ALUNO_PROJETO` (
	`id_projeto` INT NOT NULL,
	`id_aluno` INT NOT NULL
);

CREATE TABLE `CORRDENADOR_PROJETO` (
	`id_cordenador` INT NOT NULL,
	`id_projeto` INT NOT NULL
);

CREATE TABLE `COODENADOR_INSTITUIÇÃO` (
	`id_coordenador` INT NOT NULL,
	`id_instituicao` INT NOT NULL
);

CREATE TABLE `COORDENADOR_AVALIACAO` (
	`id_coordenador` INT NOT NULL,
	`id_avaliacao` INT NOT NULL
);

CREATE TABLE `PROFESSOR_PROJETO` (
	`id_professor` INT NOT NULL,
	`id_projeto` INT NOT NULL
);

CREATE TABLE `PROFESSOR_AVALIACAO` (
	`id_professor` INT NOT NULL,
	`id_avaliacao` INT NOT NULL
);

CREATE TABLE `PROFESSOR_INSTITUICAO` (
	`id_professor` INT NOT NULL,
	`id_avaliacao` INT NOT NULL
);

CREATE TABLE `DISCIPLINA` (
	`id_disciplina` INT NOT NULL AUTO_INCREMENT,
	`Instrutor` INT NOT NULL,
	`sala` INT NOT NULL,
	`carga_horaria` TIMESTAMP NOT NULL,
	`projeto` INT NOT NULL,
	PRIMARY KEY (`id_disciplina`)
);

CREATE TABLE `ALUNO_DISCIPLINA` (
	`id_aluno` INT NOT NULL,
	`id_disciplina` INT NOT NULL
);

CREATE TABLE `PROFESSOR_DISCIPLINA` (
	`id_professor` INT NOT NULL,
	`id_disciplina` INT NOT NULL
);

CREATE TABLE `COODENADOR_DISCIPLINA` (
	`id_coordenador` INT NOT NULL,
	`id_disciplina` INT NOT NULL
);

ALTER TABLE `ALUNO` ADD CONSTRAINT `ALUNO_fk0` FOREIGN KEY (`id_aluno`) REFERENCES `USUARIO`(`id_usuario`);

ALTER TABLE `PROFESSOR` ADD CONSTRAINT `PROFESSOR_fk0` FOREIGN KEY (`id_professor`) REFERENCES `USUARIO`(`id_usuario`);

ALTER TABLE `COORDENADOR` ADD CONSTRAINT `COORDENADOR_fk0` FOREIGN KEY (`id_coordenador`) REFERENCES `USUARIO`(`id_usuario`);

ALTER TABLE `PERMISSAO` ADD CONSTRAINT `PERMISSAO_fk0` FOREIGN KEY (`id_permissao`) REFERENCES `USUARIO`(`id_usuario`);

ALTER TABLE `OPERACAO` ADD CONSTRAINT `OPERACAO_fk0` FOREIGN KEY (`id_operacao`) REFERENCES `PERMISSAO`(`id_permissao`);

ALTER TABLE `AVALIACAO` ADD CONSTRAINT `AVALIACAO_fk0` FOREIGN KEY (`id_projeto`) REFERENCES `PROJETO`(`id_projeto`);

ALTER TABLE `ALUNO_INSTITUIÇÃO` ADD CONSTRAINT `ALUNO_INSTITUIÇÃO_fk0` FOREIGN KEY (`id_aluno`) REFERENCES `ALUNO`(`id_aluno`);

ALTER TABLE `ALUNO_INSTITUIÇÃO` ADD CONSTRAINT `ALUNO_INSTITUIÇÃO_fk1` FOREIGN KEY (`id_instituicao`) REFERENCES `INSTITUICAO`(`id_instituicao`);

ALTER TABLE `ALUNO_PROJETO` ADD CONSTRAINT `ALUNO_PROJETO_fk0` FOREIGN KEY (`id_projeto`) REFERENCES `PROJETO`(`id_projeto`);

ALTER TABLE `ALUNO_PROJETO` ADD CONSTRAINT `ALUNO_PROJETO_fk1` FOREIGN KEY (`id_aluno`) REFERENCES `ALUNO`(`id_aluno`);

ALTER TABLE `CORRDENADOR_PROJETO` ADD CONSTRAINT `CORRDENADOR_PROJETO_fk0` FOREIGN KEY (`id_cordenador`) REFERENCES `COORDENADOR`(`id_coordenador`);

ALTER TABLE `CORRDENADOR_PROJETO` ADD CONSTRAINT `CORRDENADOR_PROJETO_fk1` FOREIGN KEY (`id_projeto`) REFERENCES `PROJETO`(`id_projeto`);

ALTER TABLE `COODENADOR_INSTITUIÇÃO` ADD CONSTRAINT `COODENADOR_INSTITUIÇÃO_fk0` FOREIGN KEY (`id_coordenador`) REFERENCES `COORDENADOR`(`id_coordenador`);

ALTER TABLE `COODENADOR_INSTITUIÇÃO` ADD CONSTRAINT `COODENADOR_INSTITUIÇÃO_fk1` FOREIGN KEY (`id_instituicao`) REFERENCES `INSTITUICAO`(`id_instituicao`);

ALTER TABLE `COORDENADOR_AVALIACAO` ADD CONSTRAINT `COORDENADOR_AVALIACAO_fk0` FOREIGN KEY (`id_coordenador`) REFERENCES `USUARIO`(`id_usuario`);

ALTER TABLE `COORDENADOR_AVALIACAO` ADD CONSTRAINT `COORDENADOR_AVALIACAO_fk1` FOREIGN KEY (`id_avaliacao`) REFERENCES `AVALIACAO`(`id_avaliacao`);

ALTER TABLE `PROFESSOR_PROJETO` ADD CONSTRAINT `PROFESSOR_PROJETO_fk0` FOREIGN KEY (`id_professor`) REFERENCES `PROFESSOR`(`id_professor`);

ALTER TABLE `PROFESSOR_PROJETO` ADD CONSTRAINT `PROFESSOR_PROJETO_fk1` FOREIGN KEY (`id_projeto`) REFERENCES `PROJETO`(`id_projeto`);

ALTER TABLE `PROFESSOR_AVALIACAO` ADD CONSTRAINT `PROFESSOR_AVALIACAO_fk0` FOREIGN KEY (`id_professor`) REFERENCES `PROFESSOR`(`id_professor`);

ALTER TABLE `PROFESSOR_AVALIACAO` ADD CONSTRAINT `PROFESSOR_AVALIACAO_fk1` FOREIGN KEY (`id_avaliacao`) REFERENCES `AVALIACAO`(`id_avaliacao`);

ALTER TABLE `PROFESSOR_INSTITUICAO` ADD CONSTRAINT `PROFESSOR_INSTITUICAO_fk0` FOREIGN KEY (`id_professor`) REFERENCES `PROFESSOR`(`id_professor`);

ALTER TABLE `PROFESSOR_INSTITUICAO` ADD CONSTRAINT `PROFESSOR_INSTITUICAO_fk1` FOREIGN KEY (`id_avaliacao`) REFERENCES `INSTITUICAO`(`id_instituicao`);

ALTER TABLE `DISCIPLINA` ADD CONSTRAINT `DISCIPLINA_fk0` FOREIGN KEY (`projeto`) REFERENCES `PROJETO`(`id_projeto`);

ALTER TABLE `ALUNO_DISCIPLINA` ADD CONSTRAINT `ALUNO_DISCIPLINA_fk0` FOREIGN KEY (`id_aluno`) REFERENCES `ALUNO`(`id_aluno`);

ALTER TABLE `ALUNO_DISCIPLINA` ADD CONSTRAINT `ALUNO_DISCIPLINA_fk1` FOREIGN KEY (`id_disciplina`) REFERENCES `DISCIPLINA`(`id_disciplina`);

ALTER TABLE `PROFESSOR_DISCIPLINA` ADD CONSTRAINT `PROFESSOR_DISCIPLINA_fk0` FOREIGN KEY (`id_professor`) REFERENCES `PROFESSOR`(`id_professor`);

ALTER TABLE `PROFESSOR_DISCIPLINA` ADD CONSTRAINT `PROFESSOR_DISCIPLINA_fk1` FOREIGN KEY (`id_disciplina`) REFERENCES `DISCIPLINA`(`id_disciplina`);

ALTER TABLE `COODENADOR_DISCIPLINA` ADD CONSTRAINT `COODENADOR_DISCIPLINA_fk0` FOREIGN KEY (`id_coordenador`) REFERENCES `COORDENADOR`(`id_coordenador`);

ALTER TABLE `COODENADOR_DISCIPLINA` ADD CONSTRAINT `COODENADOR_DISCIPLINA_fk1` FOREIGN KEY (`id_disciplina`) REFERENCES `DISCIPLINA`(`id_disciplina`);

