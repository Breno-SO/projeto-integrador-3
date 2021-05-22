CREATE TABLE "USUARIO" (
	"id_usuario" serial NOT NULL,
	"nome_completo" serial NOT NULL,
	"sexo" serial NOT NULL,
	"CPF" integer,
	"Email" serial NOT NULL,
	"telefone" serial NOT NULL,
	"pernissao" serial NOT NULL,
	"ultimo_acesso" serial NOT NULL,
	"login" serial NOT NULL,
	"senha" serial NOT NULL,
	"senha" integer UNIQUE,
	"descricao_perfil" varchar(255) NOT NULL,
	CONSTRAINT "USUARIO_pk" PRIMARY KEY ("id_usuario")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "ALUNO" (
	"id_aluno" serial NOT NULL,
	"curso" integer NOT NULL,
	"projeto" integer NOT NULL,
	"turno" integer NOT NULL,
	"periodo" integer NOT NULL,
	"status" integer NOT NULL,
	"comentario" integer NOT NULL,
	CONSTRAINT "ALUNO_pk" PRIMARY KEY ("id_aluno")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "PROFESSOR" (
	"id_professor" serial NOT NULL,
	"nome_completo" integer NOT NULL,
	"graduacao" integer NOT NULL,
	"mestrado" integer NOT NULL,
	"doutorado" integer NOT NULL,
	"curso" integer NOT NULL,
	"comentario" varchar(255) NOT NULL,
	CONSTRAINT "PROFESSOR_pk" PRIMARY KEY ("id_professor")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "COORDENADOR" (
	"id_coordenador" serial NOT NULL,
	"nome_completo" integer NOT NULL,
	"graduação" integer NOT NULL,
	"mestrado" integer NOT NULL,
	"doutorado" integer NOT NULL,
	"validar_projeto" BOOLEAN NOT NULL,
	"curso" integer NOT NULL,
	"comentario" varchar(255) NOT NULL,
	CONSTRAINT "COORDENADOR_pk" PRIMARY KEY ("id_coordenador")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "PERMISSAO" (
	"id_permissao" serial NOT NULL,
	"administrador" integer NOT NULL,
	"aluno" integer NOT NULL,
	"professor" integer NOT NULL,
	"coodenador" integer NOT NULL,
	"visitante" integer NOT NULL,
	"usuario" integer NOT NULL,
	CONSTRAINT "PERMISSAO_pk" PRIMARY KEY ("id_permissao")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "OPERACAO" (
	"id_operacao" integer NOT NULL,
	"incluir" integer NOT NULL,
	"alterar" integer NOT NULL,
	"excluir" integer NOT NULL,
	"visualizar" integer NOT NULL,
	"notifica" integer NOT NULL,
	"busca_filtrar" integer NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "INSTITUICAO" (
	"id_instituicao" serial NOT NULL,
	"endereço" varchar(255) NOT NULL,
	"reitor" integer NOT NULL,
	"reitor" integer NOT NULL,
	"CNPJ" integer NOT NULL,
	"nome_fantasia" integer NOT NULL,
	"razao_social" integer NOT NULL,
	CONSTRAINT "INSTITUICAO_pk" PRIMARY KEY ("id_instituicao")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "PROJETO" (
	"id_projeto" serial NOT NULL,
	"tema" varchar(255) NOT NULL,
	"descricao" varchar(255) NOT NULL,
	"cometario" varchar(255) NOT NULL,
	"status" integer(255) NOT NULL,
	"resumo" varchar(255) NOT NULL,
	CONSTRAINT "PROJETO_pk" PRIMARY KEY ("id_projeto")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "AVALIACAO" (
	"id_avaliacao" serial NOT NULL,
	"id_projeto" integer NOT NULL,
	"nota" FLOAT NOT NULL,
	"cometario" varchar(255) NOT NULL,
	CONSTRAINT "AVALIACAO_pk" PRIMARY KEY ("id_avaliacao")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "ALUNO_INSTITUIÇÃO" (
	"id_aluno" integer NOT NULL,
	"id_instituicao" integer NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "ALUNO_PROJETO" (
	"id_projeto" integer NOT NULL,
	"id_aluno" integer NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "CORRDENADOR_PROJETO" (
	"id_cordenador" integer NOT NULL,
	"id_projeto" integer NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "COODENADOR_INSTITUIÇÃO" (
	"id_coordenador" integer NOT NULL,
	"id_instituicao" integer NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "COORDENADOR_AVALIACAO" (
	"id_coordenador" integer NOT NULL,
	"id_avaliacao" integer NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "PROFESSOR_PROJETO" (
	"id_professor" integer NOT NULL,
	"id_projeto" integer NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "PROFESSOR_AVALIACAO" (
	"id_professor" integer NOT NULL,
	"id_avaliacao" integer NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "PROFESSOR_INSTITUICAO" (
	"id_professor" integer NOT NULL,
	"id_avaliacao" integer NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "DISCIPLINA" (
	"id_disciplina" serial NOT NULL,
	"Instrutor" integer NOT NULL,
	"sala" integer NOT NULL,
	"carga_horaria" TIMESTAMP NOT NULL,
	"projeto" integer NOT NULL,
	CONSTRAINT "DISCIPLINA_pk" PRIMARY KEY ("id_disciplina")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "ALUNO_DISCIPLINA" (
	"id_aluno" integer NOT NULL,
	"id_disciplina" integer NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "PROFESSOR_DISCIPLINA" (
	"id_professor" integer NOT NULL,
	"id_disciplina" integer NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "COODENADOR_DISCIPLINA" (
	"id_coordenador" integer NOT NULL,
	"id_disciplina" integer NOT NULL
) WITH (
  OIDS=FALSE
);




ALTER TABLE "ALUNO" ADD CONSTRAINT "ALUNO_fk0" FOREIGN KEY ("id_aluno") REFERENCES "USUARIO"("id_usuario");

ALTER TABLE "PROFESSOR" ADD CONSTRAINT "PROFESSOR_fk0" FOREIGN KEY ("id_professor") REFERENCES "USUARIO"("id_usuario");

ALTER TABLE "COORDENADOR" ADD CONSTRAINT "COORDENADOR_fk0" FOREIGN KEY ("id_coordenador") REFERENCES "USUARIO"("id_usuario");

ALTER TABLE "PERMISSAO" ADD CONSTRAINT "PERMISSAO_fk0" FOREIGN KEY ("id_permissao") REFERENCES "USUARIO"("id_usuario");

ALTER TABLE "OPERACAO" ADD CONSTRAINT "OPERACAO_fk0" FOREIGN KEY ("id_operacao") REFERENCES "PERMISSAO"("id_permissao");



ALTER TABLE "AVALIACAO" ADD CONSTRAINT "AVALIACAO_fk0" FOREIGN KEY ("id_projeto") REFERENCES "PROJETO"("id_projeto");

ALTER TABLE "ALUNO_INSTITUIÇÃO" ADD CONSTRAINT "ALUNO_INSTITUIÇÃO_fk0" FOREIGN KEY ("id_aluno") REFERENCES "ALUNO"("id_aluno");
ALTER TABLE "ALUNO_INSTITUIÇÃO" ADD CONSTRAINT "ALUNO_INSTITUIÇÃO_fk1" FOREIGN KEY ("id_instituicao") REFERENCES "INSTITUICAO"("id_instituicao");

ALTER TABLE "ALUNO_PROJETO" ADD CONSTRAINT "ALUNO_PROJETO_fk0" FOREIGN KEY ("id_projeto") REFERENCES "PROJETO"("id_projeto");
ALTER TABLE "ALUNO_PROJETO" ADD CONSTRAINT "ALUNO_PROJETO_fk1" FOREIGN KEY ("id_aluno") REFERENCES "ALUNO"("id_aluno");

ALTER TABLE "CORRDENADOR_PROJETO" ADD CONSTRAINT "CORRDENADOR_PROJETO_fk0" FOREIGN KEY ("id_cordenador") REFERENCES "COORDENADOR"("id_coordenador");
ALTER TABLE "CORRDENADOR_PROJETO" ADD CONSTRAINT "CORRDENADOR_PROJETO_fk1" FOREIGN KEY ("id_projeto") REFERENCES "PROJETO"("id_projeto");

ALTER TABLE "COODENADOR_INSTITUIÇÃO" ADD CONSTRAINT "COODENADOR_INSTITUIÇÃO_fk0" FOREIGN KEY ("id_coordenador") REFERENCES "COORDENADOR"("id_coordenador");
ALTER TABLE "COODENADOR_INSTITUIÇÃO" ADD CONSTRAINT "COODENADOR_INSTITUIÇÃO_fk1" FOREIGN KEY ("id_instituicao") REFERENCES "INSTITUICAO"("id_instituicao");

ALTER TABLE "COORDENADOR_AVALIACAO" ADD CONSTRAINT "COORDENADOR_AVALIACAO_fk0" FOREIGN KEY ("id_coordenador") REFERENCES "USUARIO"("id_usuario");
ALTER TABLE "COORDENADOR_AVALIACAO" ADD CONSTRAINT "COORDENADOR_AVALIACAO_fk1" FOREIGN KEY ("id_avaliacao") REFERENCES "AVALIACAO"("id_avaliacao");

ALTER TABLE "PROFESSOR_PROJETO" ADD CONSTRAINT "PROFESSOR_PROJETO_fk0" FOREIGN KEY ("id_professor") REFERENCES "PROFESSOR"("id_professor");
ALTER TABLE "PROFESSOR_PROJETO" ADD CONSTRAINT "PROFESSOR_PROJETO_fk1" FOREIGN KEY ("id_projeto") REFERENCES "PROJETO"("id_projeto");

ALTER TABLE "PROFESSOR_AVALIACAO" ADD CONSTRAINT "PROFESSOR_AVALIACAO_fk0" FOREIGN KEY ("id_professor") REFERENCES "PROFESSOR"("id_professor");
ALTER TABLE "PROFESSOR_AVALIACAO" ADD CONSTRAINT "PROFESSOR_AVALIACAO_fk1" FOREIGN KEY ("id_avaliacao") REFERENCES "AVALIACAO"("id_avaliacao");

ALTER TABLE "PROFESSOR_INSTITUICAO" ADD CONSTRAINT "PROFESSOR_INSTITUICAO_fk0" FOREIGN KEY ("id_professor") REFERENCES "PROFESSOR"("id_professor");
ALTER TABLE "PROFESSOR_INSTITUICAO" ADD CONSTRAINT "PROFESSOR_INSTITUICAO_fk1" FOREIGN KEY ("id_avaliacao") REFERENCES "INSTITUICAO"("id_instituicao");

ALTER TABLE "DISCIPLINA" ADD CONSTRAINT "DISCIPLINA_fk0" FOREIGN KEY ("projeto") REFERENCES "PROJETO"("id_projeto");

ALTER TABLE "ALUNO_DISCIPLINA" ADD CONSTRAINT "ALUNO_DISCIPLINA_fk0" FOREIGN KEY ("id_aluno") REFERENCES "ALUNO"("id_aluno");
ALTER TABLE "ALUNO_DISCIPLINA" ADD CONSTRAINT "ALUNO_DISCIPLINA_fk1" FOREIGN KEY ("id_disciplina") REFERENCES "DISCIPLINA"("id_disciplina");

ALTER TABLE "PROFESSOR_DISCIPLINA" ADD CONSTRAINT "PROFESSOR_DISCIPLINA_fk0" FOREIGN KEY ("id_professor") REFERENCES "PROFESSOR"("id_professor");
ALTER TABLE "PROFESSOR_DISCIPLINA" ADD CONSTRAINT "PROFESSOR_DISCIPLINA_fk1" FOREIGN KEY ("id_disciplina") REFERENCES "DISCIPLINA"("id_disciplina");

ALTER TABLE "COODENADOR_DISCIPLINA" ADD CONSTRAINT "COODENADOR_DISCIPLINA_fk0" FOREIGN KEY ("id_coordenador") REFERENCES "COORDENADOR"("id_coordenador");
ALTER TABLE "COODENADOR_DISCIPLINA" ADD CONSTRAINT "COODENADOR_DISCIPLINA_fk1" FOREIGN KEY ("id_disciplina") REFERENCES "DISCIPLINA"("id_disciplina");

