-- tabelas
CREATE TABLE Autores (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL
);

CREATE TABLE Livros (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    titulo TEXT NOT NULL,
    isbn TEXT,
    ano_publicacao INTEGER,
    autor_id INTEGER,
    FOREIGN KEY (autor_id) REFERENCES Autores(id)
);

--dados válidos
INSERT INTO Autores (nome) VALUES ('Machado de Assis');

INSERT INTO Livros (titulo, isbn, ano_publicacao, autor_id)
VALUES ('Dom Casmurro', '123456789', 1899, 1);

-- 3️⃣ Ativar checagem de FK (necessário no SQLite)
PRAGMA foreign_keys = ON;

-- 4️⃣ Tentar inserir livro com autor inexistente (vai gerar erro)
-- Execute e tire print do erro para o trabalho
INSERT INTO Livros (titulo, isbn, ano_publicacao, autor_id)
VALUES ('Livro Inválido', '000000000', 2023, 999);

-- 5️⃣ Consultas (Álgebra Relacional)

-- 5a. Projeção: apenas títulos dos livros
SELECT titulo FROM Livros;

-- 5b. Seleção: livros publicados após 2020
SELECT * FROM Livros WHERE ano_publicacao > 2020;