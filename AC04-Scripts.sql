CREATE DATABASE AC04_DIEGOBUENO


CREATE TABLE Veiculo(
	idVeiculo INT IDENTITY(1,1),
	descricao VARCHAR(100) NOT NULL,
	valor decimal (10,2) NOT NULL,
	idModelo INT NOT NULL,
	idFabricante INT NOT NULL,
	idAnoFabricacao INT NOT NULL,
	dataCompra DATE NOT NULL,
	CONSTRAINT pk_Veiculo PRIMARY KEY (idVeiculo),
	CONSTRAINT pf_Veiculo_Ano FOREIGN KEY (idAnoFabricacao) REFERENCES Ano (idAno),
	CONSTRAINT pf_Veiculo_Modelo FOREIGN KEY (idModelo) REFERENCES Modelo(idModelo),
	CONSTRAINT pf_Veiculo_Fabricante FOREIGN KEY (idFabricante) REFERENCES Fabricante (idFabricante)


);


CREATE TABLE Ano(
	idAno INT IDENTITY(1,1),
	ano SMALLINT  NOT NULL,
	CONSTRAINT pk_Ano PRIMARY KEY (idAno),
	CONSTRAINT ck_ano CHECK (ano between 1886 and YEAR(GETDATE())) -- O ano de 1886 � considerado como o ano de nascimento do carro moderno, verificar se ano menor que 1886 e maior que o atual
);


CREATE TABLE Mes(
	idMes INT IDENTITY(1,1),
	mes TINYINT NOT NULL,
	CONSTRAINT ck_mes CHECK (mes between 01 and 12), -- Verificar se os meses s�o de 01 a 12
	CONSTRAINT pk_mes PRIMARY KEY (idMes),	
);


CREATE TABLE Modelo(
	idModelo INT IDENTITY(1,1),
	descricao VARCHAR(100) NOT NULL,
	CONSTRAINT pk_Modelo PRIMARY KEY (idModelo),
);


CREATE TABLE Fabricante(
	idFabricante INT IDENTITY(1,1),
	nome VARCHAR(50) NOT NULL,
	cidade VARCHAR(50) NOT NULL,
	endereco VARCHAR(100) NOT NULL,
	UF VARCHAR(2) NOT NULL,
	telefone VARCHAR(14) NOT NULL,
	contato VARCHAR(50) NOT NULL,
	CONSTRAINT pk_idFabricante PRIMARY KEY (idFabricante), 
	CONSTRAINT ck_contato CHECK (contato LIKE '%@%'), --Verificar se contato (e-mail) contem @
	CONSTRAINT ck_telefone CHECK (telefone LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' OR telefone LIKE '([0-9][0-9]) [0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),	 

);


CREATE TABLE VendasAnuais(
	idVendas INT IDENTITY(1,1),
	qtn INT NOT NULL,
	idVeiculo INT NOT NULL,
	idAnodaVenda INT NOT NULL,
	idMesdaVenda INT NOT NULL, 
	CONSTRAINT pk_VendasAnuais PRIMARY KEY (idVendas),
	CONSTRAINT fk_VendasAnuais_Veiculo FOREIGN KEY (idVeiculo) REFERENCES Veiculo (idVeiculo),
	CONSTRAINT fk_VendasAnuais_Ano FOREIGN KEY (idAnodaVenda) REFERENCES Ano(idAno),
	CONSTRAINT fk_VendasAnuais_Mes FOREIGN KEY (idmesdaVenda) REFERENCES mes(idMes),

);







