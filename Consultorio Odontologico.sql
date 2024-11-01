CREATE DATABASE Consultorio;
USE Consultorio;

CREATE TABLE tbl_paciente(
pk_id_paciente INT PRIMARY KEY AUTO_INCREMENT,
nome_paciente VARCHAR(100) not null,
data_nasc_paciente DATE,
cpf_paciente CHAR(11),
genero_paciente enum('f','m','o'),
endereco_paciente VARCHAR(100),
email_paciente VARCHAR(50),
telefone_paciente CHAR(13)
);

DESCRIBE tbl_paciente;

SELECT*FROM tbl_paciente;

INSERT INTO tbl_paciente(nome_paciente, data_nasc_paciente, cpf_paciente, genero_paciente, endereco_paciente, email_paciente, telefone_paciente)
VALUES
('João da Silva', '1987-10-29', '50988267800', 'm', 'Rua Tito, 10', 'joaosilva@gmail.com', '5511946691487'),
('Hugo Ribeiro', '1981-08-08', '21817177899', 'f', 'Rua Carlos Silva, 10', 'hugo@gmail.com', '5511986004306'),
('Débora Paixão', '1975-05-05', '48966378901', 'f', 'Rua Clélia, 50', 'debora@hotmail.com', '5511943336100'),
('Sergio Silva', '1981-10-08', '22217144899', 'm', 'Rua Vasti Silva, 10', 'sergio@gmail.com', '5511986004306'),
('Kaike Jesse', '2002-08-08', '18217177899', 'm', 'Av 9 Julho, 10', 'jesse@gmail.com', '5511986004306'),
('Ricardo Ribeiro', '2002-05-28', '36144279881', 'm', 'Av Faria Lima, 522', 'ricardo@gmail.com', '5511986004502'),
('Marcelo Alves', '1981-08-08', '21817177888', 'm', 'Rua Carlos Silva, 10', 'marcelo@gmail.com', '5511986004400'),
('Camila', '1981-08-08', '21817177899', 'm', 'Av Carlos Silva, 10', 'camila@gmail.com', '5511986004306'),
('Joaquim', '1981-08-08', '21817177899', 'm', 'Rua Carlos Silva, 10', 'joaquim@gmail.com', '5511986058306'),
('Lucas Ribeiro', '1981-08-08', '21817177899', 'f', 'Rua Parque Silva, 550', 'lucas@gmail.com', '5517886004306');



CREATE TABLE tbl_dentista(
id_dentista INT PRIMARY KEY AUTO_INCREMENT,
nome_dentista VARCHAR(100),
data_nasc_dentista DATE,
CRO INT NOT NULL,
genero_dentista ENUM('m','f','o'),
endereco_dentista VARCHAR(100),
telefone_paciente CHAR(13)
);


INSERT INTO tbl_dentista(nome_dentista, data_nasc_dentista,CRO,genero_dentista,endereco_dentista,telefone_paciente)
VALUES
('Dr. Ana Clara', '1985-06-15', '12345', 'f', 'Rua das Flores, 123', '5511987654321'),
('Dr. Carlos Oliveira', '1978-02-20', '54321', 'm', 'Avenida Brasil, 456', '5511998765432'),
('Dra. Fernanda Lima', '1990-09-10', '67890', 'f', 'Rua Santos, 789', '5511987654320'),
('Dr. Ricardo Mendes', '1982-03-30', '09876', 'm', 'Praça Central, 101', '5511987654319'),
('Dra. Juliana Rocha', '1988-12-01', '11223', 'f', 'Avenida das Américas, 202', '5511987654318'),
('Dr. Felipe Costa', '1980-11-11', '33445', 'm', 'Rua do Comércio, 303', '5511987654317'),
('Dra. Beatriz Alves', '1995-05-25', '55667', 'f', 'Rua Nova, 404', '5511987654316'),
('Dr. Gustavo Reis', '1992-07-07', '77889', 'm', 'Avenida São Paulo, 505', '5511987654315'),
('Dra. Mariana Ferreira', '1984-04-04', '99001', 'f', 'Rua do Lago, 606', '5511987654314'),
('Dr. Leonardo Martins', '1975-10-10', '22334', 'm', 'Rua das Palmeiras, 707', '5511987654313');

select*from tbl_dentista;


CREATE TABLE tbl_consulta(
id_consulta INT PRIMARY KEY AUTO_INCREMENT,
local_consulta VARCHAR(100),
data_consulta DATETIME,
descricao_consulta_consulta VARCHAR(100)
);

INSERT INTO tbl_consulta (local_consulta, data_consulta, descricao_consulta_consulta)
VALUES
('Av. Tito, 50', '2024-10-29 09:00:00', 'Limpeza bucal, obturação'),
('Av. Tito, 50', '2024-11-05 10:30:00', 'Consulta de rotina, avaliação'),
('Av. Tito, 50', '2024-11-12 14:00:00', 'Tratamento de canal'),
('Av. Tito, 50', '2024-11-19 08:30:00', 'Extração de dente, limpeza'),
('Av. Tito, 50', '2024-12-01 11:15:00', 'Acompanhamento pós-operatório'),
('Av. Tito, 50', '2024-12-10 13:45:00', 'Clareamento dental'),
('Av. Tito, 50', '2024-12-15 16:00:00', 'Consulta para prótese'),
('Av. Tito, 50', '2024-12-20 17:30:00', 'Avaliação ortodôntica'),
('Av. Tito, 50', '2024-12-25 09:30:00', 'Revisão de tratamento'),
('Av. Tito, 50', '2024-12-30 15:00:00', 'Consulta de emergência, dor de dente');


/* CRIAÇÃO DE COLUNA */
ALTER TABLE tbl_consulta ADD COLUMN fk_id_paciente INT;
/* CRIAÇÃO DE COLUNA */
ALTER TABLE tbl_consulta ADD COLUMN fk_id_dentista INT;

/* ADICIONANDO CHAVE ESTRANGEIRA */
ALTER TABLE tbl_consulta ADD CONSTRAINT FOREIGN KEY (fk_id_paciente) REFERENCES tbl_paciente (pk_id_paciente);
/* ADICIONANDO CHAVE ESTRANGEIRA */
ALTER TABLE tbl_consulta ADD CONSTRAINT foreign key (fk_id_dentista) REFERENCES tbl_dentista (id_dentista);

/* SELECT COM INNER JOIN*/
SELECT 
    tbl_consulta.local_consulta,
    tbl_consulta.data_consulta,
    tbl_consulta.descricao_consulta_consulta,
    tbl_paciente.nome_paciente,
    tbl_dentista.nome_dentista
    
FROM tbl_consulta INNER JOIN tbl_paciente
ON tbl_consulta.fk_id_paciente = tbl_paciente.pk_id_paciente
INNER JOIN 
tbl_dentista ON tbl_consulta.fk_id_dentista = tbl_dentista.id_dentista;

/* ADICIONANDO ID PRA CHAVE ESTRANGEIRA*/
INSERT INTO tbl_consulta (local_consulta, data_consulta, descricao_consulta_consulta, fk_id_paciente, fk_id_dentista)
VALUES
('Av. Tito, 50', '2024-10-29 09:00:00', 'Limpeza bucal, obturação', 1, 2),
('Av. Tito, 50', '2024-11-05 10:30:00', 'Consulta de rotina, avaliação', 3, 1),
('Av. Tito, 50', '2024-11-12 14:00:00', 'Tratamento de canal', 2, 3);

SELECT*FROM tbl_consulta;

UPDATE tbl_consulta SET descricao_consulta_consulta ='canal e clareamento' WHERE id_consulta =1;

SELECT*FROM tbl_paciente;

/*DELETE DE INSERT */
DELETE FROM tbl_paciente WHERE pk_id_paciente =2;
DELETE FROM tbl_consulta WHERE fk_id_paciente =2;

