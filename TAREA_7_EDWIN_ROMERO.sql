/*1) Añadí una nueva variable, la fecha de Nacimiento, compuesta por otras 3 variables ya existentes*/
alter table master add column fecha_nacimiento date;
update master set fecha_nacimiento = str_to_date(concat(birthYear, '-', birthMonth, '-', birthDay), '%Y-%m-%d');


/*2) Añadí otra nueva variable, partiendo en rangos una variable ya existente*/
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

/*4) Cree una nueva variable, usando las 2 recientemente renombradas*/
alter table batting add column hr_ratio float;
update batting set hr_ratio =
case 
	when Games > 0 then  Homeruns/Games
	else  0
end;


/*5) Añadí la variable indice de masa corporal, utilizando 2 variables ya existentes*/
alter table master add column IMC float;
update master set IMC =  (weight / (height * height)) * 703;

