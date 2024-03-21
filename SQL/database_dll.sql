REM   Script: DLL_database
REM   database

CREATE TABLE Ginásio ( 
    Cidade VARCHAR(100), 
    Líder VARCHAR(100), 
    PRIMARY KEY (Cidade) 
);

CREATE TABLE Insígnia ( 
    Nome_da_insignia VARCHAR(100), 
    Formato VARCHAR(100), 
    Cidade VARCHAR(100), 
    FOREIGN KEY (Cidade) REFERENCES Ginásio(Cidade), 
    PRIMARY KEY (Nome_da_insignia) 
);

CREATE TABLE Modalidade ( 
    Nome_da_Modalidade VARCHAR(100), 
    PRIMARY KEY (Nome_da_Modalidade) 
);

CREATE TABLE Treinador ( 
    ID INT, 
    PRIMARY KEY (ID) 
);

CREATE TABLE Número_de_Celular ( 
    ID INT, 
    Número_de_Celular VARCHAR(20), 
    FOREIGN KEY (ID) REFERENCES Treinador(ID), 
    PRIMARY KEY (ID) 
);

CREATE TABLE Prêmio ( 
    Nome VARCHAR(100), 
    PRIMARY KEY (Nome) 
);

CREATE TABLE Pokémon ( 
    Número_na_Pokédex INT, 
    Espécie VARCHAR(100), 
    Tipo_1 VARCHAR(100), 
    Tipo_2 VARCHAR(100), 
    ID INT, 
    FOREIGN KEY (ID) REFERENCES Treinador(ID), 
    PRIMARY KEY (Número_na_Pokédex) 
);

CREATE TABLE PC ( 
    Número_na_Pokédex INT, 
    Data DATE, 
    FOREIGN KEY (Número_na_Pokédex) REFERENCES Pokémon(Número_na_Pokédex), 
    PRIMARY KEY (Número_na_Pokédex) 
);

CREATE TABLE Lendário ( 
    Número_na_Pokédex INT, 
    Número_de_Avistamentos INT, 
    FOREIGN KEY (Número_na_Pokédex) REFERENCES Pokémon(Número_na_Pokédex), 
    PRIMARY KEY (Número_na_Pokédex) 
);

CREATE TABLE Mítico ( 
    Número_na_Pokédex INT, 
    Evento VARCHAR(100), 
    FOREIGN KEY (Número_na_Pokédex) REFERENCES Pokémon(Número_na_Pokédex), 
    PRIMARY KEY (Número_na_Pokédex) 
);

CREATE TABLE Ganha ( 
    Desafiante INT, 
    Desafiado INT, 
    Nome VARCHAR(100), 
    FOREIGN KEY (Desafiante) REFERENCES Treinador(ID), 
    FOREIGN KEY (Desafiado) REFERENCES Treinador(ID), 
    FOREIGN KEY (Nome) REFERENCES Prêmio(Nome), 
    PRIMARY KEY (Desafiante, Desafiado, Nome) 
);

CREATE TABLE Batalha ( 
    Desafiante INT, 
    Desafiado INT, 
    Data_de_Batalha DATE, 
    FOREIGN KEY (Desafiante) REFERENCES Treinador(ID), 
    FOREIGN KEY (Desafiado) REFERENCES Treinador(ID), 
    PRIMARY KEY (Desafiante, Desafiado) 
);

CREATE TABLE Treina ( 
    Cidade VARCHAR(100), 
    ID INT, 
    Nome_da_Modalidade VARCHAR(100), 
    FOREIGN KEY (Cidade) REFERENCES Ginásio(Cidade), 
    FOREIGN KEY (ID) REFERENCES Treinador(ID), 
    FOREIGN KEY (Nome_da_Modalidade) REFERENCES Modalidade(Nome_da_Modalidade), 
    PRIMARY KEY (Cidade, ID, Nome_da_Modalidade) 
);

