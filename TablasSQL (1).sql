-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS MultinivelDB;
USE MultinivelDB;

-- Crear la tabla Jugador
CREATE TABLE Jugador (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL
);

-- Crear la tabla Partida
CREATE TABLE Partida (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    fecha_terminacion DATETIME NOT NULL,
    duracion INT NOT NULL,
    ganador TEXT NOT NULL,
    FOREIGN KEY (ganador) REFERENCES Jugador(ID)
);

-- Crear la tabla intermedia Jugador_Partida para la relación N:M
CREATE TABLE Jugador_Partida (
    jugador_id INT,
    partida_id INT,
    FOREIGN KEY (jugador_id) REFERENCES Jugador(ID),
    FOREIGN KEY (partida_id) REFERENCES Partida(ID),
    PRIMARY KEY (jugador_id, partida_id)
);

-- Crear la tabla CasillaMuerte
CREATE TABLE CasillaMuerte (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    partida_id INT,
    jugador_id INT,
    FOREIGN KEY (partida_id) REFERENCES Partida(ID),
    FOREIGN KEY (jugador_id) REFERENCES Jugador(ID)
);

-- Insertar datos de ejemplo
INSERT INTO Jugador (username, password) VALUES
    ('jugador1', 'contrasena1'),
    ('jugador2', 'contrasena2'),
    ('jugador3', 'contrasena3');

INSERT INTO Partida (fecha_terminacion, duracion, ganador) VALUES
    ('2024-02-17 10:30:00', 30, 1),
    ('2024-02-17 12:45:00', 45, 2),
    ('2024-02-17 15:00:00', 60, 3);

INSERT INTO Jugador_Partida (jugador_id, partida_id) VALUES
    (1, 1),
    (2, 1),
    (2, 2),
    (3, 3);

INSERT INTO CasillaMuerte (partida_id, jugador_id) VALUES
    (1, 1),
    (2, 2),
    (2, 3),
    (3, 1),
    (3, 3);
