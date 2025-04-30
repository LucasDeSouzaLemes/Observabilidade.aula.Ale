-- Criação do banco de dados (opcional, caso precise criar)
CREATE DATABASE escola;

-- Seleciona o banco de dados para uso
USE escola;

-- Criação da tabela de Alunos
CREATE TABLE alunos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    endereco VARCHAR(255)
);

-- Criação da tabela de Professores
CREATE TABLE professores (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(100) NOT NULL,
    data_admissao DATE NOT NULL
);

-- Criação da tabela de Cursos
CREATE TABLE cursos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT
);

-- Criação da tabela de Matrículas (Relacionando Alunos e Cursos)
CREATE TABLE matriculas (
    id SERIAL PRIMARY KEY,
    aluno_id INT REFERENCES alunos(id) ON DELETE CASCADE,
    curso_id INT REFERENCES cursos(id) ON DELETE CASCADE,
    data_matricula DATE NOT NULL
);

-- Criação da tabela de Turmas (Relacionando Cursos e Professores)
CREATE TABLE turmas (
    id SERIAL PRIMARY KEY,
    curso_id INT REFERENCES cursos(id) ON DELETE CASCADE,
    professor_id INT REFERENCES professores(id) ON DELETE CASCADE,
    ano_letivo INT NOT NULL,
    semestre VARCHAR(10) NOT NULL -- Ex: "1º semestre" ou "2º semestre"
);

-- Adicionando alguns dados de exemplo
-- Inserindo alunos
INSERT INTO alunos (nome, data_nascimento, endereco)
VALUES 
    ('João Silva', '2005-03-15', 'Rua A, 123'),
    ('Maria Oliveira', '2006-05-20', 'Rua B, 456');

-- Inserindo professores
INSERT INTO professores (nome, especialidade, data_admissao)
VALUES 
    ('Carlos Souza', 'Matemática', '2020-02-10'),
    ('Ana Pereira', 'Física', '2019-08-25');

-- Inserindo cursos
INSERT INTO cursos (nome, descricao)
VALUES 
    ('Matemática 1', 'Curso de introdução à Matemática'),
    ('Física 1', 'Curso de introdução à Física');

-- Inserindo turmas
INSERT INTO turmas (curso_id, professor_id, ano_letivo, semestre)
VALUES 
    (1, 1, 2025, '1º semestre'),
    (2, 2, 2025, '1º semestre');

-- Inserindo matrículas
INSERT INTO matriculas (aluno_id, curso_id, data_matricula)
VALUES 
    (1, 1, '2025-01-10'),
    (2, 2, '2025-01-12');