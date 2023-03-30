DELIMITER //
create function nome_servic1(pid INT)
returns varchar(120)
DETERMINISTIC
BEGIN
declare retorno varchar(120);
declare quantidade int(1);
select count(*) into quantidade from Servicos where pid=idServicos;
if quantidade = 1 then
select Tipo_servico INTO retorno from Servicos where idServicos=pid;
else
SET retorno = 'serviço inexistente';
end if;
return (retorno);
END//

select nome_servic1(2);

DELIMITER //
create function Valores_curso(cid INT)
returns varchar(120)
DETERMINISTIC
BEGIN
declare retorno varchar(120);
declare quantidade int(1);
select count(*) into quantidade from cursos where cid=idcursos;
if quantidade = 1 then
select Valor_Curso INTO retorno from cursos where idcursos=cid;
else
SET retorno = 'curso inexistente';
end if;
return (retorno);
END//

select Valores_curso(4);

CREATE FUNCTION Repeticao(a int, b int)
returns int
DETERMINISTIC
return a * b;

select Tipo_servico, Repeticao(valor_servico, 2) AS 'Preço por 2 serviços' from servicos;

create function Promocaoo(a int)
returns int
Deterministic
return a * 0.10;

select Tipo_servico, Promocaoo(valor_servico) as 'Promoção' from servicos;

DELIMITER //
create function contar_cliente(cpfCli int)
returns int
Deterministic
begin
 declare resultado int;
 Select Count(cpf) into resultado from Cliente;
 return resultado;
 End//
 
 select nome, cpf, contar_cliente(1) as 'Total de clientes' from cliente;



