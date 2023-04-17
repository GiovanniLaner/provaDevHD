--CRIAÇÃO TABELA EMPREGADOS
CREATE TABLE empregados (
		id_empregado SERIAL NOT NULL,
		cod_departamento int NOT NULL,
		cod_emp_funcao int NOT NULL,
		nm_empregado varchar(100),
		nm_funcao varchar(100),
		data_admissao date,
		salario decimal,
		comissao decimal,
		CONSTRAINT pk_empregado PRIMARY KEY (id_empregado),
		CONSTRAINT fk_cod_departamento FOREIGN KEY (cod_departamento) REFERENCES departamentos (id_departamento),
		CONSTRAINT fk_cod_emp_funcao FOREIGN KEY (cod_emp_funcao) REFERENCES empregado_funcao (id_funcao)
);

--CRIAÇÃO TABELA DEPARTAMENTOS
CREATE TABLE departamentos (
		id_departamento SERIAL NOT NULL,
		nm_departamento varchar(100),
		local varchar(100),
		CONSTRAINT	id_departamento	PRIMARY	KEY (id_departamento)
);

--CRIAÇÃO TABELA EMPREGADO_FUNCAO
CREATE TABLE empregado_funcao (
		id_funcao SERIAL NOT NULL,
	 	descricao_funcao varchar(100),
		CONSTRAINT id_funcao PRIMARY KEY (id_funcao)
);

--INSERT MANUAL DE DADOS NA TABELA EMPREGADOS
INSERT	 INTO	empregados	(cod_departamento,	cod_emp_funcao, nm_empregado, nm_funcao, data_admissao, salario, comissao) VALUES ('1','2','GIOVANNI', 'vendedor' , '2022/01/01', 2500, 50);
INSERT	 INTO	empregados	(cod_departamento,	cod_emp_funcao,nm_empregado, nm_funcao, data_admissao, salario, comissao) VALUES ('1','1','NICOLAS', 'atendente' , '2022/01/01', 1500, 0);
INSERT	 INTO	empregados	(cod_departamento,	cod_emp_funcao,nm_empregado, nm_funcao, data_admissao, salario, comissao) VALUES ('1','2','ANDRE', 'vendedor' , '2022/01/01', 2500, 100);
INSERT	 INTO	empregados	(cod_departamento, cod_emp_funcao,nm_empregado, nm_funcao, data_admissao, salario, comissao) VALUES ('1','2','MATHEUS', 'vendedor' , '2022/01/01', 2500, 150);
INSERT	 INTO	empregados	(cod_departamento,	 cod_emp_funcao,nm_empregado, nm_funcao, data_admissao, salario, comissao) VALUES ('1','1','STEPHANIE', 'atendente' , '2022/01/01', 1500, 0);

