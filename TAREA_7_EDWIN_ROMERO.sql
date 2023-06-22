/*1) Crear la variable fecha de nacimiento utilizando otras 3 ya existentes*/
alter table master add column fecha_nacimiento date;
update master set fecha_nacimiento = str_to_date(concat(birthYear, '-', birthMonth, '-', birthDay), '%Y-%m-%d');

/*2) Crear la variable year_rangos, utilizando la variable Year ya existente*/
alter table batting add column year_rangos varchar(30);
update batting set year_rangos = 
	case 
			when yearID between    0 and 1900 then '1)0-1900'
			when yearID between 1901 and 1920 then '2)1901-1920'
			when yearID between 1921 and 1940 then '3)1921-1940'
			when yearID between 1941 and 1960 then '4)1941-1960'
			when yearID between 1961 and 1980 then '5)1961-1980'
			when yearID between 1981 and 2000 then '6)1981-2000'
			else '7)>2000'
	end;
/*3) Renombrar 2 variables*/	
alter table batting change HR Homeruns int;
alter table batting change G Games int;

/*4) Calcular una variable, porccentaje de homeruns por juego*/
alter table batting add column hr_ratio float;
update batting set hr_ratio =
case 
	when Games > 0 then  Homeruns/Games
	else  0
end;


/*5) Calcular indice de masa corpotal de los jugadores*/
alter table master add column IMC float;
update master set IMC =  (weight / (height * height)) * 703;

/*Dificultades:
 * Cree una variable nueva, utilizando una ya existente, la variable nueva consiste en partir en rangos otra variable. 
 * La única dificultad que tuve fue que para hacer los rangos, no conocía la sentencia case ya que siempre he usado IFs, pero googlie la sintaxis de CASE
 * y utilizarla fue sencillo.
 * Otra dificultad fue que al crear la variable homeruns/games, obtuve errores cuando games = 0, entonces tuve que agregar un condicional ahí.
 * Los demás cambios fueron sencillos */

select * from master;
   select year_rangos, count(*) as conteo
   from batting
   group by year_rangos
   order by year_rangos;