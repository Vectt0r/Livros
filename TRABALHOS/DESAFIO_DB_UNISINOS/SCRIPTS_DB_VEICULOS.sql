-- Tabela Veiculo
CREATE TABLE Veiculo (
    Placa VARCHAR2(8) PRIMARY KEY,
    Nome VARCHAR2(100) NOT NULL,
    Modelo VARCHAR2(100),
    Ano NUMBER,
    Fabricante VARCHAR2(100),
    NumPassageiros NUMBER,
    CapPortaMalas NUMBER,
    ValorDia NUMBER(10, 2),
    ValorSemana NUMBER(10, 2),
    ValorMes NUMBER(10, 2)
);

-- Tabela Cliente
CREATE TABLE Cliente (
    CPF VARCHAR2(11) PRIMARY KEY,
    Nome VARCHAR2(100) NOT NULL,
    CategoriaCNH CHAR(1),
    DataNasc DATE,
    Cidade VARCHAR2(255)
);

-- Tabela Locacao
CREATE TABLE Locacao (
    IDLocacao NUMBER PRIMARY KEY,
    PlacaVeiculo VARCHAR2(8) NOT NULL,
    CPFCliente VARCHAR2(11) NOT NULL,
    DataInicio DATE,
    DataFim DATE,
    ValorPago NUMBER(10, 2),
    FOREIGN KEY (PlacaVeiculo) REFERENCES Veiculo(Placa),
    FOREIGN KEY (CPFCliente) REFERENCES Cliente(CPF)
);

-- Tabela Manutencao
CREATE TABLE Manutencao (
    IDManutencao NUMBER PRIMARY KEY,
    PlacaVeiculo VARCHAR2(8) NOT NULL,
    DataInicio DATE,
    DataFim DATE,
    Custo NUMBER(10, 2),
    Descricao CLOB,
    FOREIGN KEY (PlacaVeiculo) REFERENCES Veiculo(Placa)
);

CREATE SEQUENCE seq_locacao START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_manutencao START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER trg_locacao_id
BEFORE INSERT ON Locacao
FOR EACH ROW
BEGIN
  SELECT seq_locacao.NEXTVAL INTO :new.IDLocacao FROM dual;
END;
/

CREATE OR REPLACE TRIGGER trg_manutencao_id
BEFORE INSERT ON Manutencao
FOR EACH ROW
BEGIN
  SELECT seq_manutencao.NEXTVAL INTO :new.IDManutencao FROM dual;
END;
/


-- Inserção na tabela Veiculo
INSERT INTO Veiculo (Placa, Nome, Modelo, Ano, Fabricante, NumPassageiros, CapPortaMalas, ValorDia, ValorSemana, ValorMes) VALUES ('ABC1234', 'Fusca', 'Sedan', 1980, 'Volkswagen', 5, 300, 100.00, 600.00, 2000.00);
INSERT INTO Veiculo (Placa, Nome, Modelo, Ano, Fabricante, NumPassageiros, CapPortaMalas, ValorDia, ValorSemana, ValorMes) VALUES ('DEF5678', 'Civic', 'Sedan', 2019, 'Honda', 5, 350, 150.00, 900.00, 2700.00);
INSERT INTO Veiculo (Placa, Nome, Modelo, Ano, Fabricante, NumPassageiros, CapPortaMalas, ValorDia, ValorSemana, ValorMes) VALUES ('GHI9012', 'Corolla', 'Sedan', 2020, 'Toyota', 5, 400, 200.00, 1200.00, 3600.00);
INSERT INTO Veiculo (Placa, Nome, Modelo, Ano, Fabricante, NumPassageiros, CapPortaMalas, ValorDia, ValorSemana, ValorMes) VALUES ('JKL3456', 'Onix', 'Hatch', 2021, 'Chevrolet', 5, 250, 120.00, 720.00, 2160.00);



-- Inserção na tabela Cliente
INSERT INTO Cliente (CPF, Nome, CategoriaCNH, DataNasc, Cidade) VALUES ('12345678901', 'João Silva', 'B', TO_DATE('1985-02-15', 'YYYY-MM-DD'), 'Osorio');
INSERT INTO Cliente (CPF, Nome, CategoriaCNH, DataNasc, Cidade) VALUES ('23456789012', 'Maria Souza', 'B', TO_DATE('1990-07-22', 'YYYY-MM-DD'), 'Porto Alegre');
INSERT INTO Cliente (CPF, Nome, CategoriaCNH, DataNasc, Cidade) VALUES ('34567890123', 'Carlos Pereira', 'B', TO_DATE('1975-11-30', 'YYYY-MM-DD'), 'São Leopoldo');
INSERT INTO Cliente (CPF, Nome, CategoriaCNH, DataNasc, Cidade) VALUES ('45678901234', 'Ana Costa', 'B', TO_DATE('1988-04-18', 'YYYY-MM-DD'), 'Alvorada');



-- Inserção na tabela Locacao
INSERT INTO Locacao (PlacaVeiculo, CPFCliente, DataInicio, DataFim, ValorPago) VALUES ('ABC1234', '12345678901', TO_DATE('2023-04-01', 'YYYY-MM-DD'), TO_DATE('2023-04-03', 'YYYY-MM-DD'), 300.00);
INSERT INTO Locacao (PlacaVeiculo, CPFCliente, DataInicio, DataFim, ValorPago) VALUES ('DEF5678', '23456789012', TO_DATE('2023-04-05', 'YYYY-MM-DD'), TO_DATE('2023-04-12', 'YYYY-MM-DD'), 1350.00);
INSERT INTO Locacao (PlacaVeiculo, CPFCliente, DataInicio, DataFim, ValorPago) VALUES ('GHI9012', '34567890123', TO_DATE('2023-04-15', 'YYYY-MM-DD'), TO_DATE('2023-04-20', 'YYYY-MM-DD'), 1200.00);
INSERT INTO Locacao (PlacaVeiculo, CPFCliente, DataInicio, DataFim, ValorPago) VALUES ('JKL3456', '45678901234', TO_DATE('2023-04-25', 'YYYY-MM-DD'), TO_DATE('2023-04-30', 'YYYY-MM-DD'), 720.00);



-- Inserção na tabela Manutencao
INSERT INTO Manutencao (PlacaVeiculo, DataInicio, DataFim, Custo, Descricao) VALUES ('ABC1234', TO_DATE('2023-03-01', 'YYYY-MM-DD'), TO_DATE('2023-03-03', 'YYYY-MM-DD'), 500.00, 'Revisão Completa');
INSERT INTO Manutencao (PlacaVeiculo, DataInicio, DataFim, Custo, Descricao) VALUES ('DEF5678', TO_DATE('2023-03-05', 'YYYY-MM-DD'), TO_DATE('2023-03-07', 'YYYY-MM-DD'), 400.00, 'Troca de Pneus');
INSERT INTO Manutencao (PlacaVeiculo, DataInicio, DataFim, Custo, Descricao) VALUES ('GHI9012', TO_DATE('2023-03-10', 'YYYY-MM-DD'), TO_DATE('2023-03-12', 'YYYY-MM-DD'), 300.00, 'Manutenção do Sistema de Freios');
INSERT INTO Manutencao (PlacaVeiculo, DataInicio, DataFim, Custo, Descricao) VALUES ('JKL3456', TO_DATE('2023-03-15', 'YYYY-MM-DD'), TO_DATE('2023-03-17', 'YYYY-MM-DD'), 200.00, 'Alinhamento e Balanceamento');




