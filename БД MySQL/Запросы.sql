/* 1. Вывести фильмы, сделанные в США */ 
select 	Name_MS as 'Название фильма',
		Date_premiere as 'Год',
        Time_MS as 'Продолжительность фильма',
        group_concat(distinct Countrycol SEPARATOR ', ') as 'Страна', -- используется встроенная функция group_concat(), которая записывает в одну строку значения из целого столбца
        group_concat(distinct Genrecol SEPARATOR ', ') as 'Жанр', -- используется встроенная функция group_concat(), которая записывает в одну строку значения из целого столбца
		group_concat(distinct concat(Actors.first_name, ' ', Actors.second_name) SEPARATOR ', ') as 'Актёр', -- используется встроенная функция group_concat(), которая записывает в одну строку значения из целого столбца
        concat(Director.first_name, ' ', Director.second_name) as 'Режиссёр', -- используется встроенная функция concat(), для того, чтобы объединить значения из двух столбцов одну строчку
        Age as 'Возрастное ограничение'
from Movies_Serials, Actors, Actors_has_Movies_Serials, Director, Movies_Serials_has_Director, Country, Movies_Serials_has_Country, Genre_of_Movie_Serials, Genre_has_Movies_Serials where Type_MS = 'Кино' and Countrycol = 'США' and -- при помощи "where" производится отбор значений
					(Actors.idActors = Actors_has_Movies_Serials.Actors_idActors and Actors_has_Movies_Serials.Movies_Serials_idMovies_Serials = Movies_Serials.idMovies_Serials) and 				-- присоединяю при помощи связных столбцов
                    (Movies_Serials_has_Director.Movies_Serials_idMovies_Serials = Movies_Serials.idMovies_Serials and Director.idDirector = Movies_Serials_has_Director.Director_idDirector) and	-- присоединяю при помощи связных столбцов
                    (Country.idCountry = Movies_Serials_has_Country.Country_idCountry and Movies_Serials_has_Country.Movies_Serials_idMovies_Serials = Movies_Serials.idMovies_Serials) and			-- присоединяю при помощи связных столбцов
                    (Genre_of_Movie_Serials.idGenre = Genre_has_Movies_Serials.Genre_idGenre and Genre_has_Movies_Serials.Movies_Serials_idMovies_Serials = Movies_Serials.idMovies_Serials)		-- присоединяю при помощи связных столбцов
                    group by Countrycol, `Режиссёр`, idMovies_Serials; -- произвожу группировку по столбцам

/* 2. Вывести фильмы в порядке убывания их продолжительности */
select 	Name_MS as 'Название фильма',
		Date_premiere as 'Год',
        Time_MS as 'Продолжительность фильма',
        Countrycol as 'Страна',
        group_concat(distinct genrecol SEPARATOR ', ') as 'Жанр',  -- используется встроенная функция group_concat(), которая записывает в одну строку значения из целого столбца
		group_concat(distinct concat(Actors.first_name, ' ', Actors.second_name) SEPARATOR ', ') as 'Актёр',  -- используется встроенная функция group_concat(), которая записывает в одну строку значения из целого столбца
        concat(Director.first_name, ' ', Director.second_name) as 'Режиссёр', -- используется встроенная функция concat(), для того, чтобы объединить значения из двух столбцов одну строчку
        Age as 'Возрастное ограничение'
from Movies_Serials, Actors, Actors_has_Movies_Serials, Director, Movies_Serials_has_Director, Country, Movies_Serials_has_Country, Genre_of_Movie_Serials, Genre_has_Movies_Serials where Type_MS = 'Кино' and -- при помощи "where" производится отбор значений
					(Actors.idActors = Actors_has_Movies_Serials.Actors_idActors and Actors_has_Movies_Serials.Movies_Serials_idMovies_Serials = Movies_Serials.idMovies_Serials) and				-- присоединяю при помощи связных столбцов
                    (Movies_Serials_has_Director.Movies_Serials_idMovies_Serials = Movies_Serials.idMovies_Serials and Director.idDirector = Movies_Serials_has_Director.Director_idDirector) and	-- присоединяю при помощи связных столбцов
                    (Country.idCountry = Movies_Serials_has_Country.Country_idCountry and Movies_Serials_has_Country.Movies_Serials_idMovies_Serials = Movies_Serials.idMovies_Serials) and			-- присоединяю при помощи связных столбцов
                    (Genre_of_Movie_Serials.idGenre = Genre_has_Movies_Serials.Genre_idGenre and Genre_has_Movies_Serials.Movies_Serials_idMovies_Serials = Movies_Serials.idMovies_Serials)		-- присоединяю при помощи связных столбцов
                    group by Countrycol, `Режиссёр`, idMovies_Serials -- произвожу группировку по столбцам
                    order by Time_MS desc; -- произвожу сортировку по убыванию
                    
/* 3. Вывести фильмы и сериалы, у которых больше одного жанра */
select 	Name_MS as 'Название фильма',
		Date_premiere as 'Год',
        Time_MS as 'Продолжительность фильма',
        Countrycol as 'Страна',
        group_concat(distinct genrecol SEPARATOR ', ') as 'Жанр', -- используется встроенная функция group_concat(), которая записывает в одну строку значения из целого столбца
		group_concat(distinct concat(Actors.first_name, ' ', Actors.second_name) SEPARATOR ', ') as 'Актёр', -- используется встроенная функция group_concat(), которая записывает в одну строку значения из целого столбца
        concat(Director.first_name, ' ', Director.second_name) as 'Режиссёр', -- используется встроенная функция concat(), для того, чтобы объединить значения из двух столбцов одну строчку
        Age as 'Возрастное ограничение'
from Movies_Serials, Actors, Actors_has_Movies_Serials, Director, Movies_Serials_has_Director, Country, Movies_Serials_has_Country, Genre_of_Movie_Serials, Genre_has_Movies_Serials where			
					(Actors.idActors = Actors_has_Movies_Serials.Actors_idActors and Actors_has_Movies_Serials.Movies_Serials_idMovies_Serials = Movies_Serials.idMovies_Serials) and				-- присоединяю при помощи связных столбцов
                    (Movies_Serials_has_Director.Movies_Serials_idMovies_Serials = Movies_Serials.idMovies_Serials and Director.idDirector = Movies_Serials_has_Director.Director_idDirector) and	-- присоединяю при помощи связных столбцов
                    (Country.idCountry = Movies_Serials_has_Country.Country_idCountry and Movies_Serials_has_Country.Movies_Serials_idMovies_Serials = Movies_Serials.idMovies_Serials) and			-- присоединяю при помощи связных столбцов
                    (Genre_of_Movie_Serials.idGenre = Genre_has_Movies_Serials.Genre_idGenre and Genre_has_Movies_Serials.Movies_Serials_idMovies_Serials = Movies_Serials.idMovies_Serials)		-- присоединяю при помощи связных столбцов
                    group by Countrycol, `Режиссёр`, idMovies_Serials -- произвожу группировку по столбцам
                    having (select count(*) from Genre_has_Movies_Serials where Movies_Serials_idMovies_Serials = idMovies_Serials) >= 2; -- произвожу отбор уже группированных строк 

/* 4. Вывести всю музыку, начиная с самого поздней*/
select 	Name_M as 'Название трека',
		group_concat(distinct Authorcol SEPARATOR ', ') as 'Автор', -- используется встроенная функция group_concat(), которая записывает в одну строку значения из целого столбца
        group_concat(distinct Genre_of_musiccol SEPARATOR ', ') as 'Жанр', -- используется встроенная функция group_concat(), которая записывает в одну строку значения из целого столбца
        Date_realese as 'Дата выхода'
	from Music, Author, Author_has_Music, Genre_of_music, Genre_of_music_has_Music where
		(Author.idAuthor = Author_has_Music.Author_idAuthor and Author_has_Music.Music_idMusic = idMusic) and -- присоединяю при помощи связных столбцов
        (Genre_of_music.idGenre_of_music = Genre_of_music_has_Music.Genre_of_music_idGenre_of_music and Genre_of_music_has_Music.Music_idMusic = idMusic) -- присоединяю при помощи связных столбцов
        group by idMusic, Genre_of_musiccol, Authorcol -- произвожу группировку по столбцам
        order by Date_realese; -- произвожу сортировку по возрастанию

/* 5. Вывести всю музыку, где в жанре имеется слово «рок» */
select 	Name_M as 'Название трека',
		group_concat(distinct Authorcol SEPARATOR ', ') as 'Автор', -- используется встроенная функция group_concat(), которая записывает в одну строку значения из целого столбца
        group_concat(distinct Genre_of_musiccol SEPARATOR ', ') as 'Жанр', -- используется встроенная функция group_concat(), которая записывает в одну строку значения из целого столбца
        Date_realese as 'Дата выхода'
	from Music, Author, Author_has_Music, Genre_of_music, Genre_of_music_has_Music where Genre_of_musiccol like '%рок%' and -- произвожу отбор при помощи ключевого слова "like"
		(Author.idAuthor = Author_has_Music.Author_idAuthor and Author_has_Music.Music_idMusic = idMusic) and -- присоединяю при помощи связных столбцов
        (Genre_of_music.idGenre_of_music = Genre_of_music_has_Music.Genre_of_music_idGenre_of_music and Genre_of_music_has_Music.Music_idMusic = idMusic) -- присоединяю при помощи связных столбцов
        group by idMusic, Genre_of_musiccol, Authorcol; -- произвожу группировку по столбцам