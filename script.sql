-- APS Banco de Dados I
-- Prof: Felipe Torres
-- Autor: Pedro Augusto Gaya Antunes
-- Matrícula: 030112096
-- Início SQL-DDL
-- Criar banco e selecionar ele
CREATE DATABASE IF NOT EXISTS hotel;
USE hotel;
-- Criar todas as tabelas
CREATE TABLE IF NOT EXISTS atendentes (
	IDatendente int NOT NULL AUTO_INCREMENT,
	nome varchar(100),
    idade int(2),
    PRIMARY KEY (IDatendente)
);
CREATE TABLE IF NOT EXISTS telefoneatendentes (
	IDtelefone int NOT NULL AUTO_INCREMENT,
    telefone int(9),
    IDatendente int,
    PRIMARY KEY (IDtelefone),
    FOREIGN KEY (IDatendente) REFERENCES atendentes(IDatendente)
    );
CREATE TABLE IF NOT EXISTS hospedes (
	IDhospede int NOT NULL AUTO_INCREMENT,
    nome varchar(100),
    rg int(10),
    cpf bigint(11),
    nascimento date,
    PRIMARY KEY (IDhospede)
);
CREATE TABLE IF NOT EXISTS telefonehospedes (
	IDtelefone int NOT NULL AUTO_INCREMENT,
    telefone int(9),
    IDhospede int,
    PRIMARY KEY (IDtelefone),
    FOREIGN KEY (IDhospede) REFERENCES hospedes(IDhospede)
);
CREATE TABLE IF NOT EXISTS tipoquarto (
	IDtipo int NOT NULL AUTO_INCREMENT,
    nometipo varchar(20),
    PRIMARY KEY (IDtipo)
);
CREATE TABLE IF NOT EXISTS padraoquarto (
	IDpadrao int NOT NULL AUTO_INCREMENT,
    nomepadrao varchar(20),
    PRIMARY KEY (IDpadrao)
);
CREATE TABLE IF NOT EXISTS quartos (
	IDquarto int NOT NULL AUTO_INCREMENT,
    IDtipo int(1),
    IDpadrao int(1),
    PRIMARY KEY (IDquarto),
    FOREIGN KEY (IDtipo) REFERENCES tipoquarto(IDtipo),
    FOREIGN KEY (IDpadrao) REFERENCES padraoquarto(IDpadrao)
);
CREATE TABLE IF NOT EXISTS reservas (
	IDreserva int NOT NULL AUTO_INCREMENT,
    diaentrada date,
    diasaida date,
    numerohospedes int,
    IDhospede int,
    IDatendente int,
    IDquarto int,
    PRIMARY KEY (IDreserva),
    FOREIGN KEY (IDhospede) REFERENCES hospedes(IDhospede),
    FOREIGN KEY (IDatendente) REFERENCES atendentes(IDatendente),
    FOREIGN KEY (IDquarto) REFERENCES quartos(IDquarto)
);
-- Início SQL-DML
-- Inserir atendentes
INSERT INTO atendentes (nome,idade) VALUES ("Ana Paula",25);
INSERT INTO atendentes (nome,idade) VALUES ("Beatriz",28);
INSERT INTO atendentes (nome,idade) VALUES ("Paulo",24);
INSERT INTO atendentes (nome,idade) VALUES ("Mariana",20);
INSERT INTO atendentes (nome,idade) VALUES ("Jorge",40);
INSERT INTO atendentes (nome,idade) VALUES ("Luiz",30);
INSERT INTO atendentes (nome,idade) VALUES ("Marcos",21);
-- Inserir telefones dos atendentes
INSERT INTO telefoneatendentes (telefone,IDatendente) VALUES (111111111,(SELECT IDatendente FROM atendentes WHERE nome = 'Ana Paula'));
INSERT INTO telefoneatendentes (telefone,IDatendente) VALUES (222222222,(SELECT IDatendente FROM atendentes WHERE nome = 'Beatriz'));
INSERT INTO telefoneatendentes (telefone,IDatendente) VALUES (333333333,(SELECT IDatendente FROM atendentes WHERE nome = 'Paulo'));
INSERT INTO telefoneatendentes (telefone,IDatendente) VALUES (444444444,(SELECT IDatendente FROM atendentes WHERE nome = 'Mariana'));
INSERT INTO telefoneatendentes (telefone,IDatendente) VALUES (555555555,(SELECT IDatendente FROM atendentes WHERE nome = 'Jorge'));
INSERT INTO telefoneatendentes (telefone,IDatendente) VALUES (666666666,(SELECT IDatendente FROM atendentes WHERE nome = 'Luiz'));
INSERT INTO telefoneatendentes (telefone,IDatendente) VALUES (777777777,(SELECT IDatendente FROM atendentes WHERE nome = 'Marcos'));
-- Inserir hóspedes
INSERT INTO hospedes (nome,rg,cpf,nascimento) VALUES ("Pedro Gaya",1234567890,12345678910,'1994-01-09');
INSERT INTO hospedes (nome,rg,cpf,nascimento) VALUES ("Maria Souza",1234567891,12345678911,'1993-01-09');
INSERT INTO hospedes (nome,rg,cpf,nascimento) VALUES ("Marcos Castro",1234567892,12345678912,'1992-01-09');
INSERT INTO hospedes (nome,rg,cpf,nascimento) VALUES ("Júlia Assis",1234567893,12345678913,'1991-01-09');
INSERT INTO hospedes (nome,rg,cpf,nascimento) VALUES ("Fernando Costa",1234567894,12345678914,'1990-01-09');
INSERT INTO hospedes (nome,rg,cpf,nascimento) VALUES ("Felipe Souza",1234567895,12345678915,'1994-01-09');
INSERT INTO hospedes (nome,rg,cpf,nascimento) VALUES ("Mariana Silva",1234567896,12345678916,'1993-01-09');
INSERT INTO hospedes (nome,rg,cpf,nascimento) VALUES ("Rebeca Fernandes",1234567897,12345678917,'1992-01-09');
INSERT INTO hospedes (nome,rg,cpf,nascimento) VALUES ("Luiz Santos",1234567898,12345678918,'1991-01-09');
INSERT INTO hospedes (nome,rg,cpf,nascimento) VALUES ("Lucas Figueiredo",1234567899,12345678919,'1990-01-09');
INSERT INTO hospedes (nome,rg,cpf,nascimento) VALUES ("Caio Marques",1234567810,12345678920,'1994-01-09');
INSERT INTO hospedes (nome,rg,cpf,nascimento) VALUES ("Jéssica Silva",1234567811,12345678921,'1993-01-09');
INSERT INTO hospedes (nome,rg,cpf,nascimento) VALUES ("Paulo Valente",1234567812,12345678922,'1992-01-09');
INSERT INTO hospedes (nome,rg,cpf,nascimento) VALUES ("Sílvia  Guimarães",1234567813,12345678923,'1991-01-09');
INSERT INTO hospedes (nome,rg,cpf,nascimento) VALUES ("Ana Santana",1234567814,12345678924,'1990-01-09');
-- Inserir telefones dos hospedes
INSERT INTO telefonehospedes (telefone,IDhospede) VALUES (333333330,(SELECT IDhospede FROM hospedes WHERE nome = 'Pedro Gaya'));
INSERT INTO telefonehospedes (telefone,IDhospede) VALUES (333333331,(SELECT IDhospede FROM hospedes WHERE nome = 'Maria Souza'));
INSERT INTO telefonehospedes (telefone,IDhospede) VALUES (333333332,(SELECT IDhospede FROM hospedes WHERE nome = 'Marcos Castro'));
INSERT INTO telefonehospedes (telefone,IDhospede) VALUES (333333334,(SELECT IDhospede FROM hospedes WHERE nome = 'Júlia Assis'));
INSERT INTO telefonehospedes (telefone,IDhospede) VALUES (333333335,(SELECT IDhospede FROM hospedes WHERE nome = 'Fernando Costa'));
INSERT INTO telefonehospedes (telefone,IDhospede) VALUES (333333336,(SELECT IDhospede FROM hospedes WHERE nome = 'Felipe Souza'));
INSERT INTO telefonehospedes (telefone,IDhospede) VALUES (333333337,(SELECT IDhospede FROM hospedes WHERE nome = 'Mariana Silva'));
INSERT INTO telefonehospedes (telefone,IDhospede) VALUES (333333338,(SELECT IDhospede FROM hospedes WHERE nome = 'Rebeca Fernandes'));
INSERT INTO telefonehospedes (telefone,IDhospede) VALUES (333333339,(SELECT IDhospede FROM hospedes WHERE nome = 'Luiz Santos'));
INSERT INTO telefonehospedes (telefone,IDhospede) VALUES (333333310,(SELECT IDhospede FROM hospedes WHERE nome = 'Lucas Figueiredo'));
INSERT INTO telefonehospedes (telefone,IDhospede) VALUES (333333311,(SELECT IDhospede FROM hospedes WHERE nome = 'Caio Marques'));
INSERT INTO telefonehospedes (telefone,IDhospede) VALUES (333333312,(SELECT IDhospede FROM hospedes WHERE nome = 'Jéssica Silva'));
INSERT INTO telefonehospedes (telefone,IDhospede) VALUES (333333313,(SELECT IDhospede FROM hospedes WHERE nome = 'Paulo Valente'));
INSERT INTO telefonehospedes (telefone,IDhospede) VALUES (333333314,(SELECT IDhospede FROM hospedes WHERE nome = 'Sílvia  Guimarães'));
INSERT INTO telefonehospedes (telefone,IDhospede) VALUES (333333315,(SELECT IDhospede FROM hospedes WHERE nome = 'Ana Santana'));
-- Inserir tipos de quartos
INSERT INTO tipoquarto (nometipo) VALUES ("Simples");
INSERT INTO tipoquarto (nometipo) VALUES ("Duplo");
INSERT INTO tipoquarto (nometipo) VALUES ("Triplo");
INSERT INTO tipoquarto (nometipo) VALUES ("Quádruplo");
-- Inserir padrão de quartos
INSERT INTO padraoquarto (nomepadrao) VALUES ("Standard");
INSERT INTO padraoquarto (nomepadrao) VALUES ("Suíte");
INSERT INTO padraoquarto (nomepadrao) VALUES ("Luxo");
-- Inserir quartos
INSERT INTO quartos (IDtipo,IDpadrao) VALUES ((SELECT IDtipo FROM tipoquarto WHERE nometipo = 'Simples'),(SELECT IDpadrao FROM padraoquarto WHERE nomepadrao = 'Standard'));
INSERT INTO quartos (IDtipo,IDpadrao) VALUES ((SELECT IDtipo FROM tipoquarto WHERE nometipo = 'Simples'),(SELECT IDpadrao FROM padraoquarto WHERE nomepadrao = 'Suíte'));
INSERT INTO quartos (IDtipo,IDpadrao) VALUES ((SELECT IDtipo FROM tipoquarto WHERE nometipo = 'Simples'),(SELECT IDpadrao FROM padraoquarto WHERE nomepadrao = 'Luxo'));
INSERT INTO quartos (IDtipo,IDpadrao) VALUES ((SELECT IDtipo FROM tipoquarto WHERE nometipo = 'Duplo'),(SELECT IDpadrao FROM padraoquarto WHERE nomepadrao = 'Standard'));
INSERT INTO quartos (IDtipo,IDpadrao) VALUES ((SELECT IDtipo FROM tipoquarto WHERE nometipo = 'Duplo'),(SELECT IDpadrao FROM padraoquarto WHERE nomepadrao = 'Suíte'));
INSERT INTO quartos (IDtipo,IDpadrao) VALUES ((SELECT IDtipo FROM tipoquarto WHERE nometipo = 'Duplo'),(SELECT IDpadrao FROM padraoquarto WHERE nomepadrao = 'Luxo'));
INSERT INTO quartos (IDtipo,IDpadrao) VALUES ((SELECT IDtipo FROM tipoquarto WHERE nometipo = 'Triplo'),(SELECT IDpadrao FROM padraoquarto WHERE nomepadrao = 'Standard'));
INSERT INTO quartos (IDtipo,IDpadrao) VALUES ((SELECT IDtipo FROM tipoquarto WHERE nometipo = 'Triplo'),(SELECT IDpadrao FROM padraoquarto WHERE nomepadrao = 'Suíte'));
INSERT INTO quartos (IDtipo,IDpadrao) VALUES ((SELECT IDtipo FROM tipoquarto WHERE nometipo = 'Triplo'),(SELECT IDpadrao FROM padraoquarto WHERE nomepadrao = 'Luxo'));
INSERT INTO quartos (IDtipo,IDpadrao) VALUES ((SELECT IDtipo FROM tipoquarto WHERE nometipo = 'Quádruplo'),(SELECT IDpadrao FROM padraoquarto WHERE nomepadrao = 'Standard'));
INSERT INTO quartos (IDtipo,IDpadrao) VALUES ((SELECT IDtipo FROM tipoquarto WHERE nometipo = 'Quádruplo'),(SELECT IDpadrao FROM padraoquarto WHERE nomepadrao = 'Suíte'));
INSERT INTO quartos (IDtipo,IDpadrao) VALUES ((SELECT IDtipo FROM tipoquarto WHERE nometipo = 'Quádruplo'),(SELECT IDpadrao FROM padraoquarto WHERE nomepadrao = 'Luxo'));
-- Inserir reservas
INSERT INTO reservas (diaentrada,diasaida,numerohospedes,IDhospede,IDatendente,IDquarto) VALUES (
	'2018-11-01',
    '2018-11-10',
    1,
    (SELECT IDhospede FROM hospedes WHERE nome = 'Pedro Gaya'),
    (SELECT IDatendente FROM atendentes WHERE nome = 'Ana Paula'),
    1
);
INSERT INTO reservas (diaentrada,diasaida,numerohospedes,IDhospede,IDatendente,IDquarto) VALUES (
	'2018-11-10',
    '2018-11-17',
    1,
    (SELECT IDhospede FROM hospedes WHERE nome = 'Maria Souza'),
    (SELECT IDatendente FROM atendentes WHERE nome = 'Ana Paula'),
    2
);
INSERT INTO reservas (diaentrada,diasaida,numerohospedes,IDhospede,IDatendente,IDquarto) VALUES (
	'2018-11-15',
    '2018-11-20',
    1,
    (SELECT IDhospede FROM hospedes WHERE nome = 'Marcos Castro'),
    (SELECT IDatendente FROM atendentes WHERE nome = 'Ana Paula'),
    3
);
INSERT INTO reservas (diaentrada,diasaida,numerohospedes,IDhospede,IDatendente,IDquarto) VALUES (
	'2018-11-20',
    '2018-11-30',
    2,
    (SELECT IDhospede FROM hospedes WHERE nome = 'Júlia Assis'),
    (SELECT IDatendente FROM atendentes WHERE nome = 'Ana Paula'),
    5
);
INSERT INTO reservas (diaentrada,diasaida,numerohospedes,IDhospede,IDatendente,IDquarto) VALUES (
	'2018-11-23',
    '2018-11-30',
    3,
    (SELECT IDhospede FROM hospedes WHERE nome = 'Pedro Gaya'),
    (SELECT IDatendente FROM atendentes WHERE nome = 'Paulo'),
    8
);
INSERT INTO reservas (diaentrada,diasaida,numerohospedes,IDhospede,IDatendente,IDquarto) VALUES (
	'2018-11-25',
    '2018-11-30',
    3,
    (SELECT IDhospede FROM hospedes WHERE nome = 'Luiz Santos'),
    (SELECT IDatendente FROM atendentes WHERE nome = 'Beatriz'),
    9
);
INSERT INTO reservas (diaentrada,diasaida,numerohospedes,IDhospede,IDatendente,IDquarto) VALUES (
	'2018-11-25',
    '2018-11-26',
    3,
    (SELECT IDhospede FROM hospedes WHERE nome = 'Rebeca Fernandes'),
    (SELECT IDatendente FROM atendentes WHERE nome = 'Marcos'),
    7
);
-- Início SQL-DQL
-- Quartos disponíveis no dia de hoje
SELECT q.IDquarto AS 'Quarto nº',IFNULL(DATE_FORMAT(r.diasaida,"%W, %e/%m/%Y"),"-") AS 'Saída',t.nometipo AS 'Tipo', p.nomepadrao AS 'Padrão'
FROM quartos AS q
LEFT JOIN reservas AS r ON q.IDquarto = r.IDquarto
JOIN tipoquarto AS t ON t.IDtipo = q.IDtipo
JOIN padraoquarto AS p ON p.IDpadrao = q.IDpadrao
WHERE r.diasaida < current_date()
OR r.diasaida is null
AND r.diaentrada != current_date()
OR r.diaentrada is null;
-- Quartos ocupados no dia de hoje
SELECT q.IDquarto AS 'Quarto nº',DATE_FORMAT(r.diaentrada,"%W, %e/%m/%Y") AS 'Entrada',DATE_FORMAT(r.diasaida,"%W, %e/%m/%Y") AS 'Saída',
t.nometipo AS 'Tipo',p.nomepadrao AS 'Padrão'
FROM quartos as q
JOIN reservas AS r ON q.IDquarto = r.IDquarto
JOIN tipoquarto AS t ON t.IDtipo = q.IDtipo
JOIN padraoquarto AS p ON p.IDpadrao = q.IDpadrao
WHERE r.diaentrada <= current_date()
AND r.diasaida >= current_date();
-- Liberação de quartos em determinada vaga
SELECT q.IDquarto AS 'Quarto nº', h.nome AS 'Hóspede', DATE_FORMAT(r.diasaida,"%W, %e/%m/%Y") AS 'Saída'
FROM quartos AS q
JOIN reservas as r ON r.IDquarto = q.IDquarto
JOIN hospedes as h ON h.IDhospede = r.IDhospede
WHERE r.diasaida = current_date();
-- Ocupação do hotel em determinada data
SELECT DATE_FORMAT(current_date(),"%W, %e/%m/%Y") AS 'Data',SUM(r.numerohospedes) AS 'Ocupação'
FROM reservas AS r
WHERE r.diaentrada <= current_date()
AND r.diasaida >= current_date();
-- Quartos simples desocupados em determinada data
SELECT q.IDquarto AS 'Quarto nº', t.nometipo AS 'Tipo', p.nomepadrao AS 'Padrão'
FROM quartos AS q
JOIN reservas AS r ON r.IDquarto = q.IDquarto
JOIN tipoquarto AS t ON t.IDtipo = q.IDtipo
JOIN padraoquarto AS p ON p.IDpadrao = q.IDpadrao
WHERE t.nometipo = "Simples"
AND r.diaentrada < current_date()
AND r.diasaida < current_date()
OR r.diaentrada > current_date;
-- Qual o funcionário responsável por uma reserva
SELECT r.IDreserva AS 'Nº Reserva',DATE_FORMAT(r.diaentrada,"%W, %e/%m/%Y") AS 'Data Entrada',
DATE_FORMAT(r.diasaida,"%W, %e/%m/%Y") AS 'Data Saída',t.nometipo AS 'Tipo',p.nomepadrao AS 'Padrão', a.nome AS 'Atendente'
FROM reservas as r
JOIN quartos as q ON q.IDquarto = r.IDquarto
JOIN tipoquarto as t ON t.IDtipo = q.IDtipo
JOIN padraoquarto as p ON p.IDpadrao = q.IDtipo
JOIN atendentes as a ON a.IDatendente = r.IDatendente;
