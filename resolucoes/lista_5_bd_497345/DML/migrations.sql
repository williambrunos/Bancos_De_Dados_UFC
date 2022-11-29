insert into Empregado (Nome_Empregado, Rua, Cidade) 
values 
    ("William Bruno", "Rua Maria Poetisa", "Sobral");
	("Izaias Machado", "Rua Josney Arruda", "Fortaleza"),
    ("Marcos Vinicius", "Rua Maria Catunda", "São Paulo");
    
insert into Companhia (Nome_Companhia, Cidade)
values 
	("Santander", "Sobral"),
    ("Bradesco", "Fortaleza"),
    ("Caixa", "São Paulo");
    
insert into Trabalha_Para (Nome_Empregado, Nome_Companhia, Salario)
values
	("William Bruno", "Santander", 3000.00),
    ("Izaias Machado", "Bradesco", 2750.00),
    ("Marcos Vinicius", "Caixa", 2500.00);