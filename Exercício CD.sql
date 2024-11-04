CREATE DATABASE DB_CDS;
USE DB_CDS;

CREATE TABLE tbl_Artista (
    Cod_Art INT PRIMARY KEY NOT NULL,
    Nome_Art VARCHAR(100) 
);

CREATE TABLE tbl_Gravadora (
    Cod_Grav INT PRIMARY KEY NOT NULL,
    Nome_Grav VARCHAR(100)
);

SELECT * FROM tbl_Artista;

INSERT INTO tbl_Artista (Cod_Art, Nome_Art) 
VALUES
(1,'Led Zeppelin'),
(2,'Pink Floyd'),
(3,'AC/DC');

INSERT INTO tbl_Gravadora (Cod_Grav, Nome_Grav)
VALUES
(1, 'Universal Music'),
(2, 'Sony Music'),
(3, 'Sony Music');


ALTER TABLE tbl_gravadora change Nome_Grav Nome_Grav VARCHAR(50);

CREATE TABLE tbl_Categoria (
    Cod_Cat INT PRIMARY KEY NOT NULL,
    Nome_Cat VARCHAR(50)
);

INSERT INTO tbl_Categoria (Cod_Cat, Nome_Cat) 
VALUES
(1, 'Rock'),
(2, 'Rock'),
(3, 'Rock');


CREATE TABLE tbl_Estado (
    Sigla_Est CHAR(2) PRIMARY KEY NOT NULL,
    Nome_Est CHAR(50) 
);

CREATE TABLE tbl_Cidade (
    Cod_Cid INT PRIMARY KEY NOT NULL,
    Sigla_Est CHAR(2),
    Nome_Cid VARCHAR(100)
);

ALTER TABLE tbl_Cidade ADD CONSTRAINT FOREIGN KEY (Sigla_Est) REFERENCES tbl_Estado(Sigla_Est);

CREATE TABLE tbl_Cliente (
    Cod_Cli INT PRIMARY KEY NOT NULL,
    Cod_Cid INT NOT NULL,
    Nome_Cli VARCHAR(100),
    End_Cli VARCHAR(200),
    Renda_Cli DECIMAL(10,2) NOT NULL DEFAULT 0,
    Sexo_Cli CHAR(1) NOT NULL DEFAULT 'F' CHECK (Sexo_Cli IN ('F', 'M'))
);

ALTER TABLE tbl_Cliente ADD CONSTRAINT FOREIGN KEY (Cod_Cid) REFERENCES tbl_Cidade(Cod_Cid);

CREATE TABLE tbl_Funcionario (
    Cod_Func INT PRIMARY KEY NOT NULL,
    Nome_Func VARCHAR(100),
    End_Func VARCHAR(200),
    Sal_Func DECIMAL(10,2) NOT NULL DEFAULT 0,
    Sexo_Func CHAR(1) NOT NULL DEFAULT 'M' CHECK (Sexo_Func IN ('F', 'M'))
);

CREATE TABLE tbl_Dependente (
    Cod_Dep INT PRIMARY KEY NOT NULL,
    Cod_Func INT NOT NULL,
    Nome_Dep VARCHAR(100),
    Sexo_Dep CHAR(1) NOT NULL DEFAULT 'M' CHECK (Sexo_Dep IN ('F', 'M'))
);

ALTER TABLE tbl_Dependente ADD CONSTRAINT FOREIGN KEY (Cod_Func) REFERENCES tbl_Funcionario(Cod_Func);

CREATE TABLE tbl_Titulo (
    Cod_Tit INT PRIMARY KEY NOT NULL,
    Cod_Cat INT NOT NULL,
    Cod_Grav INT NOT NULL,
    Nome_CD VARCHAR(100),
    Val_CD DECIMAL(10,2) NOT NULL CHECK (Val_CD > 0),
    Qtd_Estq INT
);

INSERT INTO tbl_Titulo (Cod_Tit, Cod_Cat, Cod_Grav, Nome_CD, Val_CD, Qtd_Estq) 
VALUES 
(1, 1, 1, 'Greatest Hits', 39.99, 50);

ALTER TABLE tbl_Titulo ADD CONSTRAINT FOREIGN KEY (Cod_Cat) REFERENCES tbl_Categoria(Cod_Cat);
ALTER TABLE tbl_Titulo ADD CONSTRAINT FOREIGN KEY (Cod_Grav) REFERENCES tbl_Gravadora(Cod_Grav);

CREATE TABLE tbl_Pedido (
    Num_Ped INT PRIMARY KEY NOT NULL,
    Cod_Cli INT,
    Cod_Func INT,
    Data_Ped DATETIME,
    Val_Ped DECIMAL(10,2) NOT NULL DEFAULT 0
);

ALTER TABLE tbl_Pedido ADD CONSTRAINT FOREIGN KEY (Cod_Cli) REFERENCES tbl_Cliente(Cod_Cli);
ALTER TABLE tbl_Pedido ADD CONSTRAINT FOREIGN KEY (Cod_Func) REFERENCES tbl_Funcionario(Cod_Func);

CREATE TABLE tbl_Titulo_Pedido (
    Num_Ped INT NOT NULL,
    Cod_Tit INT NOT NULL,
     PRIMARY KEY (Num_Ped, Cod_Tit),
    Qtd_CD INT NOT NULL CHECK (Qtd_CD >= 1),
    Val_CD DECIMAL(10,2) NOT NULL CHECK (Val_CD > 0)
);

ALTER TABLE tbl_Titulo_Pedido ADD CONSTRAINT FOREIGN KEY (Num_Ped) REFERENCES tbl_Pedido(Num_Ped);
ALTER TABLE tbl_Titulo_Pedido ADD CONSTRAINT FOREIGN KEY (Cod_Tit) REFERENCES tbl_Titulo(Cod_Tit);

CREATE TABLE tbl_Titulo_Artista (
    Cod_Tit INT NOT NULL,
    Cod_Art INT NOT NULL,
    PRIMARY KEY (Cod_Tit, Cod_Art)
);

ALTER TABLE tbl_Titulo_Artista ADD CONSTRAINT FOREIGN KEY (Cod_Tit) REFERENCES tbl_Titulo(Cod_Tit);
ALTER TABLE tbl_Titulo_Artista ADD CONSTRAINT FOREIGN KEY (Cod_Art) REFERENCES tbl_Artista(Cod_Art);


SELECT 
    tbl_Titulo.Nome_CD,
    tbl_Titulo.Val_CD,
    tbl_Gravadora.Nome_Grav,
    tbl_Categoria.Nome_Cat,
    tbl_Artista.Nome_Art
    
FROM tbl_Titulo
INNER JOIN tbl_Gravadora 
ON tbl_Titulo.Cod_Grav = tbl_Gravadora.Cod_Grav
INNER JOIN tbl_Categoria 
ON tbl_Titulo.Cod_Cat = tbl_Categoria.Cod_Cat
INNER JOIN tbl_Titulo_Artista 
ON tbl_Titulo.Cod_Tit = tbl_Titulo_Artista.Cod_Tit
INNER JOIN tbl_Artista 
ON tbl_Titulo_Artista.Cod_Art = tbl_Artista.Cod_Art;

