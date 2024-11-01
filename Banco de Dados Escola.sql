CREATE DATABASE Escola;
USE ESCOLA;

create table tbl_aluno (
	pk_id_aluno int auto_increment primary key,
    nome_do_aluno varchar(50) not null,
    data_nasc_aluno date,
    telefone_aluno char(12),
    mae_do_aluno varchar(50),
    cpf_aluno char(12),
    endereco_aluno varchar(50)
);

INSERT INTO tbl_aluno
(nome_do_aluno, data_nasc_aluno, telefone_aluno, mae_do_aluno, cpf_aluno, endereco_aluno)
VALUES
('João Pedro Silva', '2003-03-12', '11987654321', 'Luciana', '12345678901', 'Rua das Flores, 10'),
('Mariana Oliveira', '2004-06-22', '21965498732', 'Patrícia', '23456789012', 'Avenida Brasil, 567'),
('Felipe Santos', '2001-08-15', '31987612345', 'Carla', '34567890123', 'Travessa da Paz, 100'),
('Ana Clara Souza', '2002-11-30', '41976543210', 'Beatriz', '45678901234', 'Rua dos Anjos, 75'),
('Lucas Almeida', '2005-09-18', '51987234567', 'Fernanda', '56789012345', 'Alameda dos Pinheiros, 200'),
('Sofia Gomes', '2000-12-01', '61987654321', 'Marta', '67890123456', 'Praça das Rosas, 90'),
('Gabriel Fernandes', '2003-05-10', '71987654321', 'Renata', '78901234567', 'Rua da Harmonia, 155'),
('Larissa Lima', '2002-07-07', '81976543210', 'Sônia', '89012345678', 'Estrada do Sol, 45'),
('Pedro Henrique Costa', '2001-02-21', '91987654321', 'Verônica', '90123456789', 'Avenida Central, 300'),
('Isabela Freitas', '2004-04-25', '31986543210', 'Débora', '01234567890', 'Rua dos Girassóis, 12');

create table tbl_professor (
	pk_id_professor int auto_increment primary key,
    nome_do_professor varchar(50) not null,
    estado_civil_professor enum("Solteiro","Casado","Divorciado"),	
    mae_do_professor varchar(50),
    cpf_do_professor char(12),
    cidade_professor varchar(50),
    diciplina_professor varchar(50)
);

INSERT INTO tbl_professor
(nome_do_professor, estado_civil_professor, mae_do_professor, cpf_do_professor, cidade_professor, diciplina_professor)
VALUES
('Carlos Henrique Lima', 'Casado', 'Mariana', '512638127345', 'Rio de Janeiro', 'Matemática'),
('Fernanda Silva', 'Divorciado', 'Cláudia', '324561278901', 'São Paulo', 'História'),
('Ricardo Oliveira', 'Solteiro', 'Eliana', '712458904567', 'Curitiba', 'Português'),
('Ana Paula Souza', 'Casado', 'Beatriz', '141122520987', 'Salvador', 'Ciências'),
('Miguel Castro', 'Divorciado', 'Renata', '112335678912', 'Belo Horizonte', 'Biologia'),
('Carolina Duarte', 'Solteiro', 'Helena', '942108123456', 'Fortaleza', 'Geografia'),
('Eduardo Matos', 'Casado', 'Sônia', '121923457890', 'Porto Alegre', 'Filosofia'),
('Larissa Mendes', 'Divorciado', 'Luciana', '510123456789', 'Manaus', 'Sociologia'),
('Vinicius Nogueira', 'Solteiro', 'Célia', '236145678901', 'Recife', 'Educação Física'),
('Paula Ribeiro', 'Casado', 'Márcia', '817251234567', 'Florianópolis', 'Química');

start transaction;

COMMIT;

alter table tbl_professor change column cpf_do_professor cpf_professor varchar(15);

alter table tbl_professor change column diciplina_professor disciplina_professor varchar(15);

INSERT INTO tbl_professor
(nome_do_professor, estado_civil_professor, mae_do_professor, cpf_professor, cidade_professor, disciplina_professor) 
VALUES	
('Felipe Nascimento', 'Divorciado', 'Adriana', '512238173123456', 'São Paulo', 'Matemática'),
('Thais Almeida', 'Solteiro', 'Cíntia', '325961215987654', 'Rio de Janeiro', 'História'),
('Lucas Pereira', 'Casado', 'Rafaela', '721514204789012', 'Belo Horizonte', 'Português');

ALTER TABLE tbl_professor DROP COLUMN cidade_professor;

select * from tbl_professor;

DELETE FROM tbl_professor WHERE pk_id_professor IN (7, 10, 12);

ALTER TABLE tbl_professor ADD COLUMN email_professor varchar(50);

UPDATE tbl_professor SET email_professor = "solicitação em andamento" WHERE email_professor IS NOT NULL OR email_professor IS NULL;

ALTER TABLE tbl_professor CHANGE COLUMN estado_civil_professor estado_civil_professor CHAR(10);

ALTER TABLE tbl_professor ADD COLUMN formacao_professor VARCHAR(100);

CREATE TABLE tbl_aula (
	pk_id_aula int auto_increment primary key,
    equipamentos_aula varchar(50),
    disciplina_aula varchar(50),
    sala varchar(50),
    aula_horario time,
    turma_aula varchar(50),
	data_aula date not Null
);


INSERT INTO tbl_aula (equipamentos_aula, disciplina_aula, sala, aula_horario, turma_aula, data_aula)
VALUES 
("Projetor e computador", "História", "21", "08:00", "1A", "2024-10-05"),
("Laboratório de ciências", "Biologia", "12", "09:30", "2C", "2024-10-07"),
("Computadores e tablets", "Inglês", "33", "10:00", "3A", "2024-10-08"),
("Quadro e projetor", "Geografia", "15", "11:00", "1B", "2024-10-09"),
("Aparelhos de som", "Música", "17", "13:30", "3C", "2024-10-10"),
("Laboratório de química", "Química", "19", "14:00", "2A", "2024-10-12"),
("Equipamentos esportivos", "Educação Física", "Ginásio", "15:00", "2B", "2024-10-15"),
("Computador e projetor", "Programação", "41", "16:00", "3B", "2024-10-20"),
("Material didático", "Literatura", "23", "08:30", "1C", "2024-10-25");



