-- TABELAS DE METADADOS

-- CRIAÇÃO DO BANCO DE DADOS
IF NOT EXISTS (SELECT 1 FROM sys.databases WHERE name = 'Fabrica')
BEGIN
    EXEC('CREATE DATABASE Fabrica');
END

-- CRIAÇÃO DAS TABELAS
USE Fabrica;

-- TB_TIPO_SENSOR
IF OBJECT_ID('tb_tipo_sensor', 'U') IS NOT NULL
    DROP TABLE tb_tipo_sensor;

CREATE TABLE tb_tipo_sensor (
    tipo_sensor_id INT,
    tipo_sensor VARCHAR(30)
);

-- TB_LOCALIDADE
IF OBJECT_ID('tb_localidade', 'U') IS NOT NULL
    DROP TABLE tb_localidade;

CREATE TABLE tb_localidade (
    localidade_id INT,
    cliente VARCHAR(100),
    departmento VARCHAR(100),
    nome_edificio VARCHAR(100),
    sala VARCHAR(100),
    andar VARCHAR(100),
    localidade_andar VARCHAR(100),
    latitude FLOAT,
    longitude FLOAT
);

-- TB_SENSORES
IF OBJECT_ID('tb_sensores', 'U') IS NOT NULL
    DROP TABLE tb_sensores;

CREATE TABLE tb_sensores (
    sensor_id INT PRIMARY KEY,
    tipo_sensor_id INT,
    localidade_id INT
);

-- INSERINDO OS METADADOS
INSERT INTO tb_tipo_sensor (tipo_sensor_id, tipo_sensor)
VALUES
    (1, 'Temperatura'),
    (2, 'Umidade');


INSERT INTO tb_localidade (localidade_id, cliente, departmento, nome_edificio, sala, andar, localidade_andar, latitude, longitude)
VALUES
    (1, 'Fabrica', 'Operacoes', 'Rua 1', '100', 'Andar 1', 'C-101', 40.710936, -74.008500),
    (2, 'Fabrica', 'Operacoes', 'Rua 2', '201', 'Andar 2', 'O-201', 40.712515, -74.015386),
    (3, 'Fabrica', 'Armazem', 'Rua 1', '101', 'Andar 1', 'O-382', 40.736370, -74.028755),
    (4, 'Fabrica', 'Armazem', 'Rua 2', '202', 'Andar 2', 'O-293', 40.715856, -74.033391);


INSERT INTO tb_sensores (sensor_id, tipo_sensor_id, localidade_id)
VALUES
    (1, 1, 1),
    (2, 1, 2),
    (3, 1, 3),
    (4, 1, 4),
    (5, 2, 1),
    (6, 2, 2),
    (7, 2, 3),
    (8, 2, 4);
