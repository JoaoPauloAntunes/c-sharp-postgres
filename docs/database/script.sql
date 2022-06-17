create table cliente(
	cpf varchar(11) primary key,
	nome varchar(51) not null
);

create table produto(
	produto_id int primary key,
	nome varchar(200) not null,
	descricao text,
	valor float,
	cpf_cliente varchar(11),
	constraint fk_cpf_cliente
		foreign key(cpf_cliente)	
			references cliente(cpf)
);


INSERT INTO cliente(
  cpf,
  nome
) VALUES 
('12345678901', 'João Paulo'),
('12345678902', 'Ivone');


INSERT INTO produto(
  produto_id,
  nome,
  descricao,
  valor,
  cpf_cliente
) VALUES 
(
  1, 
  'Fogão Atlas 5 Bocas preto Atenas Glass com Acendimento automático - Bivolt - Atlas Eletrodomésticos', 
  'Renove a sua cozinha com o lançamentoAtenas Glass
  Oproduto agora vem com o diferencial da mesa de vidro, trazendo um toque de sofisticação e mais praticidade na hora da limpeza. Além disso o modelo possui forno com uma grade deslizante, puxador em aço e acabamento Limpa Fácil.
  Características:
  Cor: pretoVoltagem: BivoltGarantia: 1 anoDimensões do produto sem embalagem: larg x alt x prof (em cm) 75 x 87,9 x 59,5Fabricação NacionalAcendimento automáticoForno Limpa FácilQueimador megachamaMesa de vidro temperadoPés RobustosTrempe individual1 grade deslizante com 2 regulagens de alturaVidro duplo na porta do fornoVisor amplo na porta do fornoVidro interno removívelCapacidade do forno: 86,5 LPuxador tubular2Q Ramal 1,7kW2Q Ramal 2,0kW1Q Megachama 3,0kW', 
  499.99,
  '12345678901'
),
(
  2, 
  'Livro - Os Dois Morrem No Final', 
  'Emocionante e inesquecível, aguardado livro de Adam Silvera chega ao Brasil em outubro
No dia 5 de setembro, pouco depois da meia-noite, Mateo Torrez e Rufus Emeterio recebem uma ligação da Central da Morte. A notícia é devastadora: eles vão morrer naquele mesmo dia.
Os dois não se conhecem, mas, por motivos diferentes, estão à procura de um amigo com quem compartilhar os últimos momentos, uma conexão verdadeira que ajude a diminuir um pouco a angústia e a solidão que sentem. Por sorte, existe um aplicativo para isso, e é graças a ele que Rufus e Mateo vão se encontrar para uma última grande aventura: viver uma vida inteira em um único dia.
Uma história sensível e emocionante, Os dois morrem no final nos lembra o que significa estar vivo. Com seu olhar único, Adam Silvera mostra que cada segundo importa, e mesmo que não haja vida sem morte, nem amor sem perda, tudo pode mudar em 24 horas.',
  49.50,
  '12345678901'
),
(
  3, 
  'Clean Code in Python - Packt Publishing', 
  'Getting the most out of Python to improve your codebase Key Features Save maintenance costs by learning to fix your legacy codebaseLearn the principles and techniques of refactoringApply microservices to your legacy systems by implementing practical techniques Book DescriptionPython is currently used in many different areas such as software construction, systems administration, and data processing.In all of these areas, experienced professionals can find examples of inefficiency, problems, and other perils, as a result of bad code. After reading this book, readers will understand these problems, and more importantly, how to correct them.The book begins by describing the basic elements of writing clean code and how it plays an important role in Python programming. You will learn about writing efficient and readable code using the Python standard library and best practices for software design. You will learn to implement the SOLID principles in Python and use decorators to improve your code. The book delves more deeply into object oriented programming in Python and shows you how to use objects with descriptors and generators. It will also show you the design principles of software testing and how to resolve software problems by implementing design patterns in your code. In the final chapter we break down a monolithic application to a microservice one, starting from the code as the basis for a solid platform.By the end of the book, you will be proficient in applying industry approved coding practices to design clean, sustainable and readable Python code. What you will learnSet up tools to effectively work in a development environmentExplore how the magic methods of Python can help us write better codeExamine the traits of Python to create advanced object-oriented designUnderstand removal of duplicated code using decorators and descriptorsEffectively refactor code with the help of unit testsLearn to implement the SOLID principles in Python',
  398.43,
  '12345678902'
);

-- LISTAR OS PRODUTOS DO USUÁRIO JOAO
SELECT 
  u.usuario,
  p.nome,
  p.descricao
FROM cliente c
INNER JOIN produto p
  ON p.cpf_cliente = c.cpf
WHERE p.cpf_cliente = '12345678901'; --  João Paulo