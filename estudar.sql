create database funcionario;

use funcionario;

drop table funcionario;
create table funcionario (
idFunc int primary key auto_increment,
nomeFunc varchar(45),
salario decimal(10,2), check (salario > 0),
genero char(1), check (genero = 'f' or genero = 'm')
);

select * from funcionario;

insert into funcionario values
(null, 'Franklin', 2.90, 'm'),
(null, 'Pedro', 3.90, 'm'),
(null, 'Lorena', 4.90, 'f');

create table dependente (
idDep int,
nomeDep varchar(45),
dtNasc date,
fkfunc int,
foreign key (fkFunc) references funcionario (idFunc), 
primary key (idDep, fkFunc)
);

insert into dependente values
(1, 'Francineide', '2010-11-03', 1),
(2, 'Eduardo', '2007-04-07', 3),
(3, 'Laura', '2006-06-06', 2),
(1, 'Francis', '2003-08-11', 3); 

select * from funcionario join dependente 
on idFunc = fkFunc;

insert into funcionario values
(null, 'Gabriel', 5.90, 'm');

select * from funcionario left join dependente
on idFunc = fkFunc where fkFunc is null;

alter table funcionario add fkSupervisor int,
	add foreign key (fkSupervisor) references funcionario(idFunc);
    
update funcionario set fkSupervisor = 1 where idFunc in (2,3);

select * from funcionario as funcionario join funcionario as supervisor
	on supervisor.idFunc = funcionario.fkSupervisor;

