INSERT INTO [dbo].[TbProvincias] (provincia)
VALUES 
('San Jos�'),
('Alajuela'),
('Cartago'),
('Heredia'),
('Guanacaste'),
('Puntarenas'),
('Lim�n');

USE [DbSpringsDeLiberia]
GO

INSERT INTO [dbo].[TbCantones] (canton)
VALUES 
-- San Jos�
('San Jos�'), ('Escaz�'), ('Desamparados'), ('Puriscal'), ('Tarraz�'),
('Aserr�'), ('Mora'), ('Goicoechea'), ('Santa Ana'), ('Alajuelita'),
('V�zquez De Coronado'), ('Acosta'), ('Tib�s'), ('Moravia'), ('Montes De Oca'),
('Turrubares'), ('Dota'), ('Curridabat'), ('P�rez Zeled�n'), ('Le�n Cort�s Castro'),

-- Alajuela
('Alajuela'), ('San Ram�n'), ('Grecia'), ('San Mateo'), ('Atenas'),
('Naranjo'), ('Palmares'), ('Po�s'), ('Orotina'), ('San Carlos'),
('Zarcero'), ('Sarch�'), ('Upala'), ('Los Chiles'), ('Guatuso'),
('R�o Cuarto'),

-- Cartago
('Cartago'), ('Para�so'), ('La Uni�n'), ('Jim�nez'), ('Turrialba'),
('Alvarado'), ('Oreamuno'), ('El Guarco'),

-- Heredia
('Heredia'), ('Barva'), ('Santo Domingo'), ('Santa Barbara'), ('San Rafael'),
('San Isidro'), ('Bel�n'), ('Flores'), ('San Pablo'), ('Sarapiqu�'),

-- Guanacaste
('Liberia'), ('Nicoya'), ('Santa Cruz'), ('Bagaces'), ('Carrillo'),
('Ca�as'), ('Abangares'), ('Tilar�n'), ('Nandayure'), ('La Cruz'),
('Hojancha'),

-- Puntarenas
('Puntarenas'), ('Esparza'), ('Buenos Aires'), ('Montes De Oro'), ('Osa'),
('Quepos'), ('Golfito'), ('Coto Brus'), ('Parrita'), ('Corredores'),
('Garabito'), ('Monteverde'),

-- Lim�n
('Lim�n'), ('Pococ�'), ('Siquirres'), ('Talamanca'), ('Matina'),
('Gu�cimo');

INSERT INTO TbAddresses (idProvincia, idCanton,distrito)
VALUES 
	(1,1,'Carmen'),
	(1,1,'Merced'),
	(1,1,'Hospital'),
	(1,1,'Catedral'),
	(1,1,'Zapote'),
	(1,1,'San Francisco de Dos R�os'),
	(1,1,'Uruca'),
	(1,1,'Mata Redonda'),
	(1,1,'Pavas'),
	(1,1,'Hatillo'),
	(1,1,'San Sebasti�n'),
	(1,2,'Escaz�'),
	(1,2,'San Antonio'),
	(1,2,'San Rafael'),
	(1,3,'Desamparados'),
	(1,3,'San Miguel'),
	(1,3,'San Juan de Dios'),
	(1,3,'San Rafael Arriba'),
	(1,3,'San Antonio'),
	(1,3,'Frailes'),
	(1,3,'Patarra'),
	(1,3,'San Cristobal'),
	(1,3,'Rosario'),
	(1,3,'Damas'),
	(1,3,'San Rafael Abajo'),
	(1,3,'Gravilias'),
	(1,3,'Los Guido'),
	(1,4,'Santiago'),
	(1,4,'Mercedes Sur'),
	(1,4,'Barbacoas'),
	(1,4,'Grifo Alto'),
	(1,4,'San Rafael'),
	(1,4,'Candelarita'),
	(1,4,'Desamparaditos'),
	(1,4,'San Antonio'),
	(1,4,'Chires'),

	--(1,20,'San Pablo'),
	--(1,20,'San Andr�s'),
	--(1,20,'Llano Bonito'),
	--(1,20,'San Isidro'),
	--(1,20,'Santa Cruz'),
	--(1,20,'San Antonio')


--USE [DbSpringsDeLiberia]
--GO

---- Insertar provincias, cantones y distritos
--INSERT INTO [dbo].[TbAddresses] (idProvincia, idCanton, distrito)
--SELECT 
--    p.idProvincia,
--    c.idCanton,
--    d.nombre AS distrito
--FROM 
--    (VALUES 
--        (1, 'San Jos�'),
--        (2, 'Alajuela'),
--        (3, 'Cartago'),
--        (4, 'Heredia'),
--        (5, 'Guanacaste'),
--        (6, 'Puntarenas'),
--        (7, 'Lim�n')
--    ) AS p(idProvincia, nombre)
--CROSS APPLY (
--    SELECT idCanton, canton, p.idProvincia
--    FROM [dbo].[TbCantones]
--    WHERE 
--        (p.idProvincia = 1 AND canton IN ('Central', 'Escaz�', 'Desamparados', 'Puriscal', 'Tarraz�', 'Aserr�', 'Mora', 'Goicoechea', 'Santa Ana', 'Alajuelita', 'V�zquez De Coronado', 'Acosta', 'Tib�s', 'Moravia', 'Montes De Oca', 'Turrubares', 'Dota', 'Curridabat', 'P�rez Zeled�n', 'Le�n Cort�s Castro')) OR
--        (p.idProvincia = 2 AND canton IN ('Central', 'San Ram�n', 'Grecia', 'San Mateo', 'Atenas', 'Naranjo', 'Palmares', 'Po�s', 'Orotina', 'San Carlos', 'Zarcero', 'Sarch�', 'Upala', 'Los Chiles', 'Guatuso', 'R�o Cuarto')) OR
--        (p.idProvincia = 3 AND canton IN ('Central', 'Para�so', 'La Uni�n', 'Jim�nez', 'Turrialba', 'Alvarado', 'Oreamuno', 'El Guarco')) OR
--        (p.idProvincia = 4 AND canton IN ('Central', 'Barva', 'Santo Domingo', 'Santa Barbara', 'San Rafael', 'San Isidro', 'Bel�n', 'Flores', 'San Pablo', 'Sarapiqu�')) OR
--        (p.idProvincia = 5 AND canton IN ('Liberia', 'Nicoya', 'Santa Cruz', 'Bagaces', 'Carrillo', 'Ca�as', 'Abangares', 'Tilar�n', 'Nandayure', 'La Cruz', 'Hojancha')) OR
--        (p.idProvincia = 6 AND canton IN ('Central', 'Esparza', 'Buenos Aires', 'Montes De Oro', 'Osa', 'Quepos', 'Golfito', 'Coto Brus', 'Parrita', 'Corredores', 'Garabito')) OR
--        (p.idProvincia = 7 AND canton IN ('Central', 'Pococ�', 'Siquirres', 'Talamanca', 'Matina', 'Gu�cimo'))
--) AS c
--CROSS APPLY (
--    SELECT nombre
--    FROM (VALUES
--        -- San Jos�
--        ('Carmen'), ('Merced'), ('Hospital'), ('Catedral'), ('Zapote'), ('San Francisco De Dos Rios'), ('Uruca'), ('Mata Redonda'), ('Pavas'), ('Hatillo'), ('San Sebasti�n'),
--        ('Escaz�'), ('San Antonio'), ('San Rafael'),
--        ('Desamparados'), ('San Miguel'), ('San Juan De Dios'), ('San Rafael Arriba'), ('San Rafael Abajo'), ('San Antonio'), ('Frailes'), ('Patarra'), ('San Cristobal'), ('Rosario'), ('Damas'), ('Gravilias'), ('Los Guido'),
--        ('Santiago'), ('Mercedes Sur'), ('Barbacoas'), ('Grifo Alto'), ('San Rafael'), ('Candelarita'), ('Desamparaditos'), ('San Antonio'), ('Chires'),
--        ('San Marcos'), ('San Lorenzo'), ('San Carlos'),
--        ('Aserr�'), ('Tarbaca'), ('Vuelta De Jorco'), ('San Gabriel'), ('Legua'), ('Monterrey'), ('Salitrillos'),
--        ('Col�n'), ('Guayabo'), ('Tabarcia'), ('Piedras Negras'), ('Picagres'), ('Jaris'),
--        ('Guadalupe'), ('San Francisco'), ('Calle Blancos'), ('Mata De Platano'), ('Ip�s'), ('Rancho Redondo'), ('Purral'),
--        ('Santa Ana'), ('Salitral'), ('Pozos'), ('Uruca'), ('Piedades'), ('Brasil'),
--        ('Alajuelita'), ('San Josecito'), ('San Antonio'), ('Concepci�n'), ('San Felipe'),
--        ('San Isidro'), ('San Rafael'), ('Dulce Nombre De Jesus'), ('Patalillo'), ('Cascajal'),
--        ('San Ignacio'), ('Guaitil'), ('Palmichal'), ('Cangrejal'), ('Sabanillas'),
--        ('San Juan'), ('Cinco Esquinas'), ('Anselmo Llorente'), ('Leon XII'), ('Colima'),
--        ('San Vicente'), ('San Jeronimo'), ('La Trinidad'),
--        ('San Pedro'), ('Sabanilla'), ('Mercedes'), ('San Rafael'),
--        ('San Pablo'), ('San Pedro'), ('San Juan De Mata'), ('San Luis'), ('Carara'),
--        ('Santa Mar�a'), ('Jardin'), ('Copey'),
--        ('Curridabat'), ('Granadilla'), ('Sanchez'), ('Tirrases'),
--        ('San Isidro De El General'), ('El General'), ('Daniel Flores'), ('Rivas'), ('San Pedro'), ('Platanares'), ('Pejibaye'), ('Cajon'), ('Baru'), ('Rio Nuevo'), ('P�ramo'),
--        ('San Pablo'), ('San Andres'), ('Llano Bonito'), ('San Isidro'), ('Santa Cruz'), ('San Antonio'),
--        -- Alajuela
--        ('Alajuela'), ('San Jos�'), ('Carrizal'), ('San Antonio'), ('Gu�cima'), ('San Isidro'), ('Sabanilla'), ('San Rafael'), ('Rio Segundo'), ('Desamparados'), ('Turrucares'), ('Tambor'), ('Garita'), ('Sarapiqu�'),
--        ('San Ram�n'), ('Santiago'), ('San Juan'), ('Piedades Norte'), ('Piedades Sur'), ('San Rafael'), ('San Isidro'), ('Angeles'), ('Alfaro'), ('Volio'), ('Concepci�n'), ('Zapotal'), ('Pe�as Blancas'),
--        ('Grecia'), ('San Isidro'), ('San Jos�'), ('San Roque'), ('Tacares'), ('Rio Cuarto'), ('Puente De Piedra'), ('Bolivar'),
--        ('San Mateo'), ('Desmonte'), ('Jes�s Mar�a'), ('Labrador'),
--        ('Atenas'), ('Jes�s'), ('Mercedes'), ('San Isidro'), ('Concepci�n'), ('San Jos�'), ('Santa Eulalia'), ('Escobal'),
--        ('Naranjo'), ('San Miguel'), ('San Jos�'), ('Cirr� Sur'), ('San Jer�nimo'), ('San Juan'), ('El Rosario'), ('Palmitos'),
--        ('Palmares'), ('Zaragoza'), ('Buenos Aires'), ('Santiago'), ('Candelaria'), ('Esquipulas'), ('La Granja'),
--        ('San Pedro'), ('San Juan'), ('San Rafael'), ('Carrillos'), ('Sabana Redonda'),
--        ('Orotina'), ('El Mastate'), ('Hacienda Vieja'), ('Coyolar'), ('La Ceiba'),
--        ('Quesada'), ('Florencia'), ('Buenavista'), ('Aguas Zarcas'), ('Venecia'), ('Pital'), ('La Fortuna'), ('La Tigra'), ('La Palmera'), ('Venado'), ('Cutris'), ('Monterrey'), ('Pocosol'),
--        ('Zarcero'), ('Laguna'), ('Tapesco'), ('Guadalupe'), ('Palmira'), ('Zapote'), ('Brisas'),
--        ('Sarch� Norte'), ('Sarch� Sur'), ('Toro Amarillo'), ('San Pedro'), ('Rodriguez'),
--        ('Upala'), ('Aguas Claras'), ('San Jos� o Pizote'), ('Bijagua'), ('Delicias'), ('Dos Rios'), ('Yolillal'), ('Canalete'),
--        ('Los Chiles'), ('Ca�o Negro'), ('El Amparo'), ('San Jorge'),
--        ('San Rafael'), ('Buenavista'), ('Cote'), ('Katira'),
--        ('R�o Cuarto'),
--        -- Cartago
--        ('Oriental'), ('Occidental'), ('Carmen'), ('San Nicol�s'), ('Aguacaliente o San Francisco'), ('Guadalupe o Arenilla'), ('Corralillo'), ('Tierra Blanca'), ('Dulce Nombre'), ('Llano Grande'), ('Quebradilla'),
--        ('Paraiso'), ('Santiago'), ('Orosi'), ('Cach�'), ('Llanos de Santa Luc�a'),
--        ('Tres Rios'), ('San Diego'), ('San Juan'), ('San Rafael'), ('Concepci�n'), ('Dulce Nombre'), ('San Ram�n'), ('Rio Azul'),
--        ('Juan Vi�as'), ('Tucurrique'), ('Pejibaye'),
--        ('Turrialba'), ('La Suiza'), ('Peralta'), ('Santa Cruz'), ('Santa Teresita'), ('Pavones'), ('Tuis'), ('Tayutic'), ('Santa Rosa'), ('Tres Equis'), ('La Isabel'), ('Chirrip�'),
--        ('Pacayas'), ('Cervantes'), ('Capellades'),
--        ('San Rafael'), ('Cot'), ('Potrero Cerrado'), ('Cipreses'), ('Santa Rosa'),
--        ('El Tejar'), ('San Isidro'), ('Tobosi'), ('Patio De Agua'),
--        -- Heredia
--        ('Heredia'), ('Mercedes'), ('San Francisco'), ('Ulloa'), ('Varablanca'),
--        ('Barva'), ('San Pedro'), ('San Pablo'), ('San Roque'), ('Santa Luc�a'), ('San Jos� de la Monta�a'),
--        ('Santo Domingo'), ('San Vicente'), ('San Miguel'), ('Paracito'), ('Santo Tom�s'), ('Santa Rosa'), ('Tures'), ('Para'),
--        ('Santa B�rbara'), ('San Pedro'), ('San Juan'), ('Jes�s'), ('Santo Domingo'), ('Puraba'),
--        ('San Rafael'), ('San Josecito'), ('Santiago'), ('Los �ngeles'), ('Concepci�n'),
--        ('San Isidro'), ('San Jos�'), ('Concepci�n'), ('San Francisco'),
--        ('San Antonio'), ('La Ribera'), ('La Asuncion'),
--        ('San Joaqu�n'), ('Barrantes'), ('Llorente'),
--        ('San Pablo'), ('Rincon De Sabanilla'),
--        ('Puerto Viejo'), ('La Virgen'), ('Las Horquetas'), ('Llanuras Del Gaspar'), ('Cure�a'),
--        -- Guanacaste
--        ('Liberia'), ('Ca�as Dulces'), ('Mayorga'), ('Nacascolo'), ('Curubande'),
--        ('Nicoya'), ('Mansi�n'), ('San Antonio'), ('Quebrada Honda'), ('S�mara'), ('Nosara'), ('Bel�n De Nosarita'),
--        ('Santa Cruz'), ('Bolson'), ('Veintisiete de Abril'), ('Tempate'), ('Cartagena'), ('Cuajiniquil'), ('Diria'), ('Cabo Velas'), ('Tamarindo'),
--        ('Bagaces'), ('La Fortuna'), ('Mogote'), ('Rio Naranjo'),
--        ('Filadelfia'), ('Palmira'), ('Sardinal'), ('Belen'),
--        ('Ca�as'), ('Palmira'), ('San Miguel'), ('Bebedero'), ('Porozal'),
--        ('Las Juntas'), ('Sierra'), ('San Juan'), ('Colorado'),
--        ('Tilar�n'), ('Quebrada Grande'), ('Tronadora'), ('Santa Rosa'), ('L�bano'), ('Tierras Morenas'), ('Arenal'),
--        ('Carmona'), ('Santa Rita'), ('Zapotal'), ('San Pablo'), ('Porvenir'), ('Bejuco'),
--        ('La Cruz'), ('Santa Cecilia'), ('La Garita'), ('Santa Elena'),
--        ('Hojancha'), ('Monte Romo'), ('Puerto Carrillo'), ('Huacas'),
--        -- Puntarenas
--        ('Puntarenas'), ('Pitahaya'), ('Chomes'), ('Lepanto'), ('Paquera'), ('Manzanillo'), ('Guacimal'), ('Barranca'), ('Monte Verde'), ('Isla Del Coco'), ('C�bano'), ('Chacarita'), ('Chira'), ('Acapulco'), ('El Roble'), ('Arancibia'),
--        ('Esp�ritu Santo'), ('San Juan Grande'), ('Macacona'), ('San Rafael'), ('San Jer�nimo'),
--        ('Buenos Aires'), ('Volc�n'), ('Potrero Grande'), ('Boruca'), ('Pilas'), ('Colinas'), ('Changuena'), ('Biolley'), ('Brunka'),
--        ('Miramar'), ('La Uni�n'), ('San Isidro'),
--        ('Puerto Cort�s'), ('Palmar'), ('Sierpe'), ('Bah�a Ballena'), ('Piedras Blancas'), ('Bah�a Drake'),
--        ('Quepos'), ('Savegre'), ('Naranjito'),
--        ('Golfito'), ('Puerto Jim�nez'), ('Guaycara'), ('Pav�n'),
--        ('San Vito'), ('Sabalito'), ('Aguabuena'), ('Limoncito'), ('Pittier'),
--        ('Parrita'),
--        ('Corredor'), ('La Cuesta'), ('Canoas'), ('Laurel'),
--        ('Jac�'), ('T�rcoles'),
--        -- Lim�n
--        ('Lim�n'), ('Valle La Estrella'), ('Rio Blanco'), ('Matama'),
--        ('Guapiles'), ('Jim�nez'), ('Rita'), ('Roxana'), ('Cariari'), ('Colorado'), ('La Colonia'),
--        ('Siquirres'), ('Pacuarito'), ('Florida'), ('Germania'), ('El Cairo'), ('Alegr�a'),
--        ('Bratsi'), ('Sixaola'), ('Cahuita'), ('Telire'),
--        ('Matina'), ('Bat�n'), ('Carrandi'),
--        ('Gu�cimo'), ('Mercedes'), ('Pocora'), ('Rio Jim�nez'), ('Duacari')
--    ) AS d(nombre)
--    WHERE 
--        (p.idProvincia = 1 AND c.canton = 'Central' AND d.nombre IN ('Carmen', 'Merced', 'Hospital', 'Catedral', 'Zapote', 'San Francisco De Dos Rios', 'Uruca', 'Mata Redonda', 'Pavas', 'Hatillo', 'San Sebasti�n')) OR
--        (p.idProvincia = 1 AND c.canton = 'Escaz�' AND d.nombre IN ('Escaz�', 'San Antonio', 'San Rafael')) OR
--        (p.idProvincia = 1 AND c.canton = 'Desamparados' AND d.nombre IN ('Desamparados', 'San Miguel', 'San Juan De Dios', 'San Rafael Arriba', 'San Rafael Abajo', 'San Antonio', 'Frailes', 'Patarra', 'San Cristobal', 'Rosario', 'Damas', 'Gravilias', 'Los Guido')) OR
--        (p.idProvincia = 1 AND c.canton = 'Puriscal' AND d.nombre IN ('Santiago', 'Mercedes Sur', 'Barbacoas', 'Grifo Alto', 'San Rafael', 'Candelarita', 'Desamparaditos', 'San Antonio', 'Chires')) OR
--        (p.idProvincia = 1 AND c.canton = 'Tarraz�' AND d.nombre IN ('San Marcos', 'San Lorenzo', 'San Carlos')) OR
--        (p.idProvincia = 1 AND c.canton = 'Aserr�' AND d.nombre IN ('Aserr�', 'Tarbaca', 'Vuelta De Jorco', 'San Gabriel', 'Legua', 'Monterrey', 'Salitrillos')) OR
--        (p.idProvincia = 1 AND c.canton = 'Mora' AND d.nombre IN ('Col�n', 'Guayabo', 'Tabarcia', 'Piedras Negras', 'Picagres', 'Jaris')) OR
--        (p.idProvincia = 1 AND c.canton = 'Goicoechea' AND d.nombre IN ('Guadalupe', 'San Francisco', 'Calle Blancos', 'Mata De Platano', 'Ip�s', 'Rancho Redondo', 'Purral')) OR
--        (p.idProvincia = 1 AND c.canton = 'Santa Ana' AND d.nombre IN ('Santa Ana', 'Salitral', 'Pozos', 'Uruca', 'Piedades', 'Brasil')) OR
--        (p.idProvincia = 1 AND c.canton = 'Alajuelita' AND d.nombre IN ('Alajuelita', 'San Josecito', 'San Antonio', 'Concepci�n', 'San Felipe')) OR
--        (p.idProvincia = 1 AND c.canton = 'V�zquez De Coronado' AND d.nombre IN ('San Isidro', 'San Rafael', 'Dulce Nombre De Jesus', 'Patalillo', 'Cascajal')) OR
--        (p.idProvincia = 1 AND c.canton = 'Acosta' AND d.nombre IN ('San Ignacio', 'Guaitil', 'Palmichal', 'Cangrejal', 'Sabanillas')) OR
--        (p.idProvincia = 1 AND c.canton = 'Tib�s' AND d.nombre IN ('San Juan', 'Cinco Esquinas', 'Anselmo Llorente', 'Leon XII', 'Colima')) OR
--        (p.idProvincia = 1 AND c.canton = 'Moravia' AND d.nombre IN ('San Vicente', 'San Jeronimo', 'La Trinidad')) OR
--        (p.idProvincia = 1 AND c.canton = 'Montes De Oca' AND d.nombre IN ('San Pedro', 'Sabanilla', 'Mercedes', 'San Rafael')) OR
--        (p.idProvincia = 1 AND c.canton = 'Turrubares' AND d.nombre IN ('San Pablo', 'San Pedro', 'San Juan De Mata', 'San Luis', 'Carara')) OR
--        (p.idProvincia = 1 AND c.canton = 'Dota' AND d.nombre IN ('Santa Mar�a', 'Jardin', 'Copey')) OR
--        (p.idProvincia = 1 AND c.canton = 'Curridabat' AND d.nombre IN ('Curridabat', 'Granadilla', 'Sanchez', 'Tirrases')) OR
--        (p.idProvincia = 1 AND c.canton = 'P�rez Zeled�n' AND d.nombre IN ('San Isidro De El General', 'El General', 'Daniel Flores', 'Rivas', 'San Pedro', 'Platanares', 'Pejibaye', 'Cajon', 'Baru', 'Rio Nuevo', 'P�ramo')) OR
--        (p.idProvincia = 1 AND c.canton = 'Le�n Cort�s Castro' AND d.nombre IN ('San Pablo', 'San Andres', 'Llano Bonito', 'San Isidro', 'Santa Cruz', 'San Antonio')) OR
--        -- Alajuela
--        (p.idProvincia = 2 AND c.canton = 'Central' AND d.nombre IN ('Alajuela', 'San Jos�', 'Carrizal', 'San Antonio', 'Gu�cima', 'San Isidro', 'Sabanilla', 'San Rafael', 'Rio Segundo', 'Desamparados', 'Turrucares', 'Tambor', 'Garita', 'Sarapiqu�')) OR
--        (p.idProvincia = 2 AND c.canton = 'San Ram�n' AND d.nombre IN ('San Ram�n', 'Santiago', 'San Juan', 'Piedades Norte', 'Piedades Sur', 'San Rafael', 'San Isidro', 'Angeles', 'Alfaro', 'Volio', 'Concepci�n', 'Zapotal', 'Pe�as Blancas')) OR
--        (p.idProvincia = 2 AND c.canton = 'Grecia' AND d.nombre IN ('Grecia', 'San Isidro', 'San Jos�', 'San Roque', 'Tacares', 'Rio Cuarto', 'Puente De Piedra', 'Bolivar')) OR
--        (p.idProvincia = 2 AND c.canton = 'San Mateo' AND d.nombre IN ('San Mateo', 'Desmonte', 'Jes�s Mar�a', 'Labrador')) OR
--        (p.idProvincia = 2 AND c.canton = 'Atenas' AND d.nombre IN ('Atenas', 'Jes�s', 'Mercedes', 'San Isidro', 'Concepci�n', 'San Jos�', 'Santa Eulalia', 'Escobal')) OR
--        (p.idProvincia = 2 AND c.canton = 'Naranjo' AND d.nombre IN ('Naranjo', 'San Miguel', 'San Jos�', 'Cirr� Sur', 'San Jer�nimo', 'San Juan', 'El Rosario', 'Palmitos')) OR
--        (p.idProvincia = 2 AND c.canton = 'Palmares' AND d.nombre IN ('Palmares', 'Zaragoza', 'Buenos Aires', 'Santiago', 'Candelaria', 'Esquipulas', 'La Granja')) OR
--        (p.idProvincia = 2 AND c.canton = 'Po�s' AND d.nombre IN ('San Pedro', 'San Juan', 'San Rafael', 'Carrillos', 'Sabana Redonda')) OR
--        (p.idProvincia = 2 AND c.canton = 'Orotina' AND d.nombre IN ('Orotina', 'El Mastate', 'Hacienda Vieja', 'Coyolar', 'La Ceiba')) OR
--        (p.idProvincia = 2 AND c.canton = 'San Carlos' AND d.nombre IN ('Quesada', 'Florencia', 'Buenavista', 'Aguas Zarcas', 'Venecia', 'Pital', 'La Fortuna', 'La Tigra', 'La Palmera', 'Venado', 'Cutris', 'Monterrey', 'Pocosol')) OR
--        (p.idProvincia = 2 AND c.canton = 'Zarcero' AND d.nombre IN ('Zarcero', 'Laguna', 'Tapesco', 'Guadalupe', 'Palmira', 'Zapote', 'Brisas')) OR
--        (p.idProvincia = 2 AND c.canton = 'Sarch�' AND d.nombre IN ('Sarch� Norte', 'Sarch� Sur', 'Toro Amarillo', 'San Pedro', 'Rodriguez')) OR
--        (p.idProvincia = 2 AND c.canton = 'Upala' AND d.nombre IN ('Upala', 'Aguas Claras', 'San Jos� o Pizote', 'Bijagua', 'Delicias', 'Dos Rios', 'Yolillal', 'Canalete')) OR
--        (p.idProvincia = 2 AND c.canton = 'Los Chiles' AND d.nombre IN ('Los Chiles', 'Ca�o Negro', 'El Amparo', 'San Jorge')) OR
--        (p.idProvincia = 2 AND c.canton = 'Guatuso' AND d.nombre IN ('San Rafael', 'Buenavista', 'Cote', 'Katira')) OR
--        (p.idProvincia = 2 AND c.canton = 'R�o Cuarto' AND d.nombre IN ('R�o Cuarto')) OR
--        -- Cartago
--        (p.idProvincia = 3 AND c.canton = 'Central' AND d.nombre IN ('Oriental', 'Occidental', 'Carmen', 'San Nicol�s', 'Aguacaliente o San Francisco', 'Guadalupe o Arenilla', 'Corralillo', 'Tierra Blanca', 'Dulce Nombre', 'Llano Grande', 'Quebradilla')) OR
--        (p.idProvincia = 3 AND c.canton = 'Para�so' AND d.nombre IN ('Paraiso', 'Santiago', 'Orosi', 'Cach�', 'Llanos de Santa Luc�a')) OR
--        (p.idProvincia = 3 AND c.canton = 'La Uni�n' AND d.nombre IN ('Tres Rios', 'San Diego', 'San Juan', 'San Rafael', 'Concepci�n', 'Dulce Nombre', 'San Ram�n', 'Rio Azul')) OR
--        (p.idProvincia = 3 AND c.canton = 'Jim�nez' AND d.nombre IN ('Juan Vi�as', 'Tucurrique', 'Pejibaye')) OR
--        (p.idProvincia = 3 AND c.canton = 'Turrialba' AND d.nombre IN ('Turrialba', 'La Suiza', 'Peralta', 'Santa Cruz', 'Santa Teresita', 'Pavones', 'Tuis', 'Tayutic', 'Santa Rosa', 'Tres Equis', 'La Isabel', 'Chirrip�')) OR
--        (p.idProvincia = 3 AND c.canton = 'Alvarado' AND d.nombre IN ('Pacayas', 'Cervantes', 'Capellades')) OR
--        (p.idProvincia = 3 AND c.canton = 'Oreamuno' AND d.nombre IN ('San Rafael', 'Cot', 'Potrero Cerrado', 'Cipreses', 'Santa Rosa')) OR
--        (p.idProvincia = 3 AND c.canton = 'El Guarco' AND d.nombre IN ('El Tejar', 'San Isidro', 'Tobosi', 'Patio De Agua')) OR
--        -- Heredia
--        (p.idProvincia = 4 AND c.canton = 'Central' AND d.nombre IN ('Heredia', 'Mercedes', 'San Francisco', 'Ulloa', 'Varablanca')) OR
--        (p.idProvincia = 4 AND c.canton = 'Barva' AND d.nombre IN ('Barva', 'San Pedro', 'San Pablo', 'San Roque', 'Santa Luc�a', 'San Jos� de la Monta�a')) OR
--        (p.idProvincia = 4 AND c.canton = 'Santo Domingo' AND d.nombre IN ('Santo Domingo', 'San Vicente', 'San Miguel', 'Paracito', 'Santo Tom�s', 'Santa Rosa', 'Tures', 'Para')) OR
--        (p.idProvincia = 4 AND c.canton = 'Santa Barbara' AND d.nombre IN ('Santa B�rbara', 'San Pedro', 'San Juan', 'Jes�s', 'Santo Domingo', 'Puraba')) OR
--        (p.idProvincia = 4 AND c.canton = 'San Rafael' AND d.nombre IN ('San Rafael', 'San Josecito', 'Santiago', 'Los �ngeles', 'Concepci�n')) OR
--        (p.idProvincia = 4 AND c.canton = 'San Isidro' AND d.nombre IN ('San Isidro', 'San Jos�', 'Concepci�n', 'San Francisco')) OR
--        (p.idProvincia = 4 AND c.canton = 'Bel�n' AND d.nombre IN ('San Antonio', 'La Ribera', 'La Asuncion')) OR
--        (p.idProvincia = 4 AND c.canton = 'Flores' AND d.nombre IN ('San Joaqu�n', 'Barrantes', 'Llorente')) OR
--        (p.idProvincia = 4 AND c.canton = 'San Pablo' AND d.nombre IN ('San Pablo', 'Rincon De Sabanilla')) OR
--        (p.idProvincia = 4 AND c.canton = 'Sarapiqu�' AND d.nombre IN ('Puerto Viejo', 'La Virgen', 'Las Horquetas', 'Llanuras Del Gaspar', 'Cure�a')) OR
--        -- Guanacaste
--        (p.idProvincia = 5 AND c.canton = 'Liberia' AND d.nombre IN ('Liberia', 'Ca�as Dulces', 'Mayorga', 'Nacascolo', 'Curubande')) OR
--        (p.idProvincia = 5 AND c.canton = 'Nicoya' AND d.nombre IN ('Nicoya', 'Mansi�n', 'San Antonio', 'Quebrada Honda', 'S�mara', 'Nosara', 'Bel�n De Nosarita')) OR
--        (p.idProvincia = 5 AND c.canton = 'Santa Cruz' AND d.nombre IN ('Santa Cruz', 'Bolson', 'Veintisiete de Abril', 'Tempate', 'Cartagena', 'Cuajiniquil', 'Diria', 'Cabo Velas', 'Tamarindo')) OR
--        (p.idProvincia = 5 AND c.canton = 'Bagaces' AND d.nombre IN ('Bagaces', 'La Fortuna', 'Mogote', 'Rio Naranjo')) OR
--        (p.idProvincia = 5 AND c.canton = 'Carrillo' AND d.nombre IN ('Filadelfia', 'Palmira', 'Sardinal', 'Belen')) OR
--               (p.idProvincia = 5 AND c.canton = 'Ca�as' AND d.nombre IN ('Ca�as', 'Palmira', 'San Miguel', 'Bebedero', 'Porozal')) OR
--        (p.idProvincia = 5 AND c.canton = 'Abangares' AND d.nombre IN ('Las Juntas', 'Sierra', 'San Juan', 'Colorado')) OR
--        (p.idProvincia = 5 AND c.canton = 'Tilar�n' AND d.nombre IN ('Tilar�n', 'Quebrada Grande', 'Tronadora', 'Santa Rosa', 'L�bano', 'Tierras Morenas', 'Arenal')) OR
--        (p.idProvincia = 5 AND c.canton = 'Nandayure' AND d.nombre IN ('Carmona', 'Santa Rita', 'Zapotal', 'San Pablo', 'Porvenir', 'Bejuco')) OR
--        (p.idProvincia = 5 AND c.canton = 'La Cruz' AND d.nombre IN ('La Cruz', 'Santa Cecilia', 'La Garita', 'Santa Elena')) OR
--        (p.idProvincia = 5 AND c.canton = 'Hojancha' AND d.nombre IN ('Hojancha', 'Monte Romo', 'Puerto Carrillo', 'Huacas')) OR
--        -- Puntarenas
--        (p.idProvincia = 6 AND c.canton = 'Central' AND d.nombre IN ('Puntarenas', 'Pitahaya', 'Chomes', 'Lepanto', 'Paquera', 'Manzanillo', 'Guacimal', 'Barranca', 'Monte Verde', 'Isla Del Coco', 'C�bano', 'Chacarita', 'Chira', 'Acapulco', 'El Roble', 'Arancibia')) OR
--        (p.idProvincia = 6 AND c.canton = 'Esparza' AND d.nombre IN ('Esp�ritu Santo', 'San Juan Grande', 'Macacona', 'San Rafael', 'San Jer�nimo')) OR
--        (p.idProvincia = 6 AND c.canton = 'Buenos Aires' AND d.nombre IN ('Buenos Aires', 'Volc�n', 'Potrero Grande', 'Boruca', 'Pilas', 'Colinas', 'Changuena', 'Biolley', 'Brunka')) OR
--        (p.idProvincia = 6 AND c.canton = 'Montes De Oro' AND d.nombre IN ('Miramar', 'La Uni�n', 'San Isidro')) OR
--        (p.idProvincia = 6 AND c.canton = 'Osa' AND d.nombre IN ('Puerto Cort�s', 'Palmar', 'Sierpe', 'Bah�a Ballena', 'Piedras Blancas', 'Bah�a Drake')) OR
--        (p.idProvincia = 6 AND c.canton = 'Quepos' AND d.nombre IN ('Quepos', 'Savegre', 'Naranjito')) OR
--        (p.idProvincia = 6 AND c.canton = 'Golfito' AND d.nombre IN ('Golfito', 'Puerto Jim�nez', 'Guaycara', 'Pav�n')) OR
--        (p.idProvincia = 6 AND c.canton = 'Coto Brus' AND d.nombre IN ('San Vito', 'Sabalito', 'Aguabuena', 'Limoncito', 'Pittier')) OR
--        (p.idProvincia = 6 AND c.canton = 'Parrita' AND d.nombre IN ('Parrita')) OR
--        (p.idProvincia = 6 AND c.canton = 'Corredores' AND d.nombre IN ('Corredor', 'La Cuesta', 'Canoas', 'Laurel')) OR
--        (p.idProvincia = 6 AND c.canton = 'Garabito' AND d.nombre IN ('Jac�', 'T�rcoles')) OR
--        -- Lim�n
--        (p.idProvincia = 7 AND c.canton = 'Central' AND d.nombre IN ('Lim�n', 'Valle La Estrella', 'Rio Blanco', 'Matama')) OR
--        (p.idProvincia = 7 AND c.canton = 'Pococ�' AND d.nombre IN ('Guapiles', 'Jim�nez', 'Rita', 'Roxana', 'Cariari', 'Colorado', 'La Colonia')) OR
--        (p.idProvincia = 7 AND c.canton = 'Siquirres' AND d.nombre IN ('Siquirres', 'Pacuarito', 'Florida', 'Germania', 'El Cairo', 'Alegr�a')) OR
--        (p.idProvincia = 7 AND c.canton = 'Talamanca' AND d.nombre IN ('Bratsi', 'Sixaola', 'Cahuita', 'Telire')) OR
--        (p.idProvincia = 7 AND c.canton = 'Matina' AND d.nombre IN ('Matina', 'Bat�n', 'Carrandi')) OR
--        (p.idProvincia = 7 AND c.canton = 'Gu�cimo' AND d.nombre IN ('Gu�cimo', 'Mercedes', 'Pocora', 'Rio Jim�nez', 'Duacari'))
--) AS d