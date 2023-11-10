select * from Filmes

/*Selecionando o nome e Ano dos filmes*/
SELECT Nome, Ano FROM Filmes;

/*Selecionando o nome e Ano dos filmes*/
SELECT Nome, Ano, Duracao FROM Filmes
order by Ano asc

-- Buscar pelo filme de volta para o futuro, trazendo o nome, ano e a dura��o
SELECT Nome, Ano, Duracao 
FROM Filmes
WHERE Nome = 'de volta para o futuro';


-- Buscar os filmes lan�ados em 1997
SELECT Nome, Ano, Duracao 
FROM Filmes
WHERE Ano = 1997;


-- Buscar os filmes lan�ados AP�S o ano 2000
SELECT Nome, Ano, Duracao 
FROM Filmes
WHERE Ano > 2000;


-- Buscar os filmes com a duracao maior que 100 e menor que 150, ordenando pela duracao em ordem crescente
SELECT Nome, Ano, Duracao 
FROM Filmes
WHERE Duracao > 100 AND Duracao < 150
ORDER BY Duracao;

-- Buscar a quantidade de filmes lan�adas no ano, agrupando por ano, ordenando pela duracao em ordem decrescente
SELECT Ano, COUNT(Ano) Quantidade
FROM Filmes
GROUP BY Ano
ORDER BY SUM(Duracao) DESC;


-- Buscar os Atores do g�nero masculino, retornando o PrimeiroNome, UltimoNome
SELECT Id, PrimeiroNome, UltimoNome
FROM Atores
WHERE Genero = 'M';


-- Buscar os Atores do g�nero feminino, retornando o PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome
SELECT Id, PrimeiroNome, UltimoNome
FROM Atores
WHERE  Genero = 'F'
ORDER BY PrimeiroNome;

-- Buscar o nome do filme e o g�nero
SELECT Nome, Generos.Genero
FROM Filmes
INNER JOIN FilmesGenero ON Filmes.Id = FilmesGenero.IdFilme 
INNER JOIN Generos ON FilmesGenero.IdGenero = Generos.Id;

--Buscar o nome do filme e o g�nero do tipo "Mist�rio"
SELECT Nome, Generos.Genero
FROM Filmes
INNER JOIN FilmesGenero ON Filmes.Id = FilmesGenero.IdFilme 
INNER JOIN Generos ON FilmesGenero.IdGenero = Generos.Id
WHERE Genero = 'Mist�rio';

-- Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel
SELECT Nome, Atores.PrimeiroNome, Atores.UltimoNome, ElencoFilme.Papel
FROM Filmes
	INNER JOIN ElencoFilme ON Filmes.Id = ElencoFilme.IdFilme
		INNER JOIN Atores ON ElencoFilme.IdAtor = Atores.Id