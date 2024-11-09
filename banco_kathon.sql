CREATE DATABASE Kathon;
USE Kathon;

CREATE TABLE tbl_Jovem(
id_jovem INT PRIMARY KEY AUTO_INCREMENT,
nome_jovem VARCHAR(100),
username_jovem VARCHAR(50),
cpf_jovem CHAR(11),
email_jovem VARCHAR(50),
numero_historico_jovem VARCHAR(50),
data_nasc_jovem DATE,
descricao_jovem VARCHAR(200)
);

-- tabela Endereco associada tabela tbl_Jovem
CREATE TABLE tbl_Endereco (
    id_endereco INT PRIMARY KEY AUTO_INCREMENT,
    id_jovem INT,
    endereco_jovem VARCHAR(150), 
    numero VARCHAR(10),
    complemento VARCHAR(50),
    bairro VARCHAR(50),
    cep CHAR(8),
    cidade VARCHAR(50),
    estado VARCHAR(50),
    FOREIGN KEY (id_jovem) REFERENCES tbl_Jovem(id_jovem)
);

CREATE TABLE tbl_telefone_estudante(
id_telefone_jovem INT PRIMARY KEY AUTO_INCREMENT,
numero_telefone_jovem CHAR(9),
id_jovem INT,
FOREIGN KEY (id_jovem) REFERENCES tbl_jovem(id_jovem)
);

SELECT j.id_jovem,j.nome_jovem,j.username_jovem,j.cpf_jovem,j.email_jovem,j.numero_historico_jovem,j.data_nasc_jovem,
j.descricao_jovem,e.endereco_jovem,e.numero,e.complemento,e.bairro,e.cep,e.cidade,e.estado

FROM tbl_Jovem j
INNER JOIN tbl_Endereco e 
ON j.id_jovem = e.id_jovem;


CREATE TABLE tbl_recomendacao(
id_recomendacao INT PRIMARY KEY AUTO_INCREMENT,
desc_recomendacao VARCHAR(250),
fk_id_jovem_recomendado INT,
fk_id_jovem_recomendante INT,
FOREIGN KEY (fk_id_jovem_recomendado) REFERENCES tbl_Jovem(id_jovem),
FOREIGN KEY (fk_id_jovem_recomendante) REFERENCES tbl_Jovem(id_jovem)
);

SELECT r.id_recomendacao,r.desc_recomendacao,jr.id_jovem AS id_jovem_recomendado,jr.nome_jovem AS nome_jovem_recomendado,
jre.id_jovem AS id_jovem_recomendante,jre.nome_jovem AS nome_jovem_recomendante
FROM 
    tbl_Recomendacao r
INNER JOIN 
    tbl_Jovem jr ON r.fk_id_jovem_recomendado = jr.id_jovem
INNER JOIN 
    tbl_Jovem jre ON r.fk_id_jovem_recomendante = jre.id_jovem;
    
CREATE TABLE tbl_Habilidades (
id_habilidade INT PRIMARY KEY AUTO_INCREMENT,
desc_habilidade VARCHAR(300) 
);

CREATE TABLE tbl_Habilidade_Jovem ( -- entidade assosiativa
id_habilidade INT,
id_jovem INT,
PRIMARY KEY (id_habilidade, id_jovem),
FOREIGN KEY (id_habilidade) REFERENCES tbl_Habilidades(id_habilidade),
FOREIGN KEY (id_jovem) REFERENCES tbl_Jovem(id_jovem)
);

INSERT INTO tbl_Habilidades (desc_habilidade) VALUES
('Design'),
('Frontend'),
('Backend'),
('Marketing Digital'),
('Data Analysis'),
('Gestão de Projetos');

SELECT j.id_jovem,j.nome_jovem,h.id_habilidade,h.desc_habilidade

FROM tbl_Jovem j
INNER JOIN 
tbl_Habilidade_Jovem hj ON j.id_jovem = hj.id_jovem
INNER JOIN 
tbl_Habilidades h ON hj.id_habilidade = h.id_habilidade;


/*SELECT 
    j.id_jovem,
    j.nome_jovem,
    h.id_habilidade,
    h.desc_habilidade
FROM 
    tbl_Jovem j
INNER JOIN 
    tbl_Habilidade_Jovem hj ON j.id_jovem = hj.id_jovem
INNER JOIN 
    tbl_Habilidades h ON hj.id_habilidade = h.id_habilidade
WHERE 
    j.id_jovem = 1; -- usuario especifico */
    
CREATE TABLE tbl_Hackathon(
id_hackathon INT PRIMARY KEY AUTO_INCREMENT,
nome_hackathon VARCHAR(100),
data_fim_hackathon DATETIME,
data_inicio_hackathon DATETIME
);

ALTER TABLE tbl_Hackathon ADD COLUMN id_empresa INT;

CREATE TABLE tbl_Endereco_hackathon(
id_endereco INT PRIMARY KEY AUTO_INCREMENT,
    id_hackathon INT,
    endereco_jovem VARCHAR(150), 
    numero VARCHAR(10),
    complemento VARCHAR(50),
    bairro VARCHAR(50),
    cep CHAR(8),
    cidade VARCHAR(50),
    estado VARCHAR(50),
    FOREIGN KEY (id_hackathon) REFERENCES tbl_Hackathon(id_hackathon)
);

CREATE TABLE tbl_premiacoes_hackathon(
id_premio INT PRIMARY KEY AUTO_INCREMENT,
id_hackathon INT,
premio1 VARCHAR(150),
premio2 VARCHAR(150),
premio3 VARCHAR(150),
FOREIGN KEY (id_hackathon) REFERENCES tbl_Hackathon(id_hackathon)
);

SELECT h.id_hackathon,h.nome_hackathon,h.data_inicio_hackathon,h.data_fim_hackathon,
eh.endereco_jovem,eh.numero,eh.complemento,eh.bairro,eh.cep,eh.cidade,eh.estado,
ph.premio1,ph.premio2,ph.premio3

FROM tbl_Hackathon h
INNER JOIN 
tbl_Endereco_hackathon eh ON h.id_hackathon = eh.id_hackathon
INNER JOIN 
tbl_premiacoes_hackathon ph ON h.id_hackathon = ph.id_hackathon;


CREATE TABLE tbl_incricao_jovem( -- entidade assosiativa
id_inscricao INT AUTO_INCREMENT PRIMARY KEY,
id_hackathon INT,
id_jovem INT,
FOREIGN KEY (id_jovem) REFERENCES tbl_Jovem(id_jovem),
FOREIGN KEY (id_hackathon) REFERENCES tbl_Hackathon(id_hackathon)
);


CREATE TABLE tbl_Empresa (
id_empresa INT PRIMARY KEY AUTO_INCREMENT,
nome_empresa VARCHAR(100),
cnpj_empresa CHAR(14),
email_empresa VARCHAR(50)
);

ALTER TABLE tbl_Hackathon ADD CONSTRAINT FOREIGN KEY (id_empresa) REFERENCES tbl_Empresa (id_empresa);


CREATE TABLE tbl_Endereco_empresa (
    id_endereco INT PRIMARY KEY AUTO_INCREMENT,
    id_empresa INT,
    endereco_jovem VARCHAR(150), 
    numero VARCHAR(10),
    complemento VARCHAR(50),
    bairro VARCHAR(50),
    cep CHAR(8),
    cidade VARCHAR(50),
    estado VARCHAR(50),
    FOREIGN KEY (id_empresa) REFERENCES tbl_Empresa(id_empresa)
);

CREATE TABLE tbl_telefone_empresa(
id_telefone_empresa INT PRIMARY KEY AUTO_INCREMENT,
numero_telefone_empresa CHAR(9),
id_empresa INT,
FOREIGN KEY (id_empresa) REFERENCES tbl_empresa(id_empresa)
);

SELECT e.id_empresa,e.nome_empresa,e.cnpj_empresa,e.email_empresa,te.numero_telefone_empresa,
ee.endereco_jovem,ee.numero,ee.complemento,ee.bairro,
ee.cep,ee.cidade,ee.estado,
h.id_hackathon,h.nome_hackathon,h.data_inicio_hackathon,h.data_fim_hackathon
FROM 
    tbl_Empresa e
INNER JOIN 
    tbl_Hackathon h ON e.id_empresa = h.id_empresa
INNER JOIN 
    tbl_Endereco_empresa ee ON e.id_empresa = ee.id_empresa
INNER JOIN 
    tbl_telefone_empresa te ON e.id_empresa = te.id_empresa;








