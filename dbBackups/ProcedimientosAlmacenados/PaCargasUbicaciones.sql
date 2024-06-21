INSERT INTO [dbo].[TbProvincias] (provincia)
VALUES 
('San José'),
('Alajuela'),
('Cartago'),
('Heredia'),
('Guanacaste'),
('Puntarenas'),
('Limón');

USE [DbSpringsDeLiberia]
GO

INSERT INTO [dbo].[TbCantones] (canton)
VALUES 
-- San José
('San José'), ('Escazú'), ('Desamparados'), ('Puriscal'), ('Tarrazú'),
('Aserrí'), ('Mora'), ('Goicoechea'), ('Santa Ana'), ('Alajuelita'),
('Vázquez De Coronado'), ('Acosta'), ('Tibás'), ('Moravia'), ('Montes De Oca'),
('Turrubares'), ('Dota'), ('Curridabat'), ('Pérez Zeledón'), ('León Cortés Castro'),

-- Alajuela
('Alajuela'), ('San Ramón'), ('Grecia'), ('San Mateo'), ('Atenas'),
('Naranjo'), ('Palmares'), ('Poás'), ('Orotina'), ('San Carlos'),
('Zarcero'), ('Sarchí'), ('Upala'), ('Los Chiles'), ('Guatuso'),
('Río Cuarto'),

-- Cartago
('Cartago'), ('Paraíso'), ('La Unión'), ('Jiménez'), ('Turrialba'),
('Alvarado'), ('Oreamuno'), ('El Guarco'),

-- Heredia
('Heredia'), ('Barva'), ('Santo Domingo'), ('Santa Barbara'), ('San Rafael'),
('San Isidro'), ('Belén'), ('Flores'), ('San Pablo'), ('Sarapiquí'),

-- Guanacaste
('Liberia'), ('Nicoya'), ('Santa Cruz'), ('Bagaces'), ('Carrillo'),
('Cañas'), ('Abangares'), ('Tilarán'), ('Nandayure'), ('La Cruz'),
('Hojancha'),

-- Puntarenas
('Puntarenas'), ('Esparza'), ('Buenos Aires'), ('Montes De Oro'), ('Osa'),
('Quepos'), ('Golfito'), ('Coto Brus'), ('Parrita'), ('Corredores'),
('Garabito'), ('Monteverde'),

-- Limón
('Limón'), ('Pococí'), ('Siquirres'), ('Talamanca'), ('Matina'),
('Guácimo');

INSERT INTO TbAddresses (idProvincia, idCanton,distrito)
VALUES 
	(1,1,'Carmen'),
	(1,1,'Merced'),
	(1,1,'Hospital'),
	(1,1,'Catedral'),
	(1,1,'Zapote'),
	(1,1,'San Francisco de Dos Ríos'),
	(1,1,'Uruca'),
	(1,1,'Mata Redonda'),
	(1,1,'Pavas'),
	(1,1,'Hatillo'),
	(1,1,'San Sebastián'),
	(1,2,'Escazú'),
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
	--(1,20,'San Andrés'),
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
--        (1, 'San José'),
--        (2, 'Alajuela'),
--        (3, 'Cartago'),
--        (4, 'Heredia'),
--        (5, 'Guanacaste'),
--        (6, 'Puntarenas'),
--        (7, 'Limón')
--    ) AS p(idProvincia, nombre)
--CROSS APPLY (
--    SELECT idCanton, canton, p.idProvincia
--    FROM [dbo].[TbCantones]
--    WHERE 
--        (p.idProvincia = 1 AND canton IN ('Central', 'Escazú', 'Desamparados', 'Puriscal', 'Tarrazú', 'Aserrí', 'Mora', 'Goicoechea', 'Santa Ana', 'Alajuelita', 'Vázquez De Coronado', 'Acosta', 'Tibás', 'Moravia', 'Montes De Oca', 'Turrubares', 'Dota', 'Curridabat', 'Pérez Zeledón', 'León Cortés Castro')) OR
--        (p.idProvincia = 2 AND canton IN ('Central', 'San Ramón', 'Grecia', 'San Mateo', 'Atenas', 'Naranjo', 'Palmares', 'Poás', 'Orotina', 'San Carlos', 'Zarcero', 'Sarchí', 'Upala', 'Los Chiles', 'Guatuso', 'Río Cuarto')) OR
--        (p.idProvincia = 3 AND canton IN ('Central', 'Paraíso', 'La Unión', 'Jiménez', 'Turrialba', 'Alvarado', 'Oreamuno', 'El Guarco')) OR
--        (p.idProvincia = 4 AND canton IN ('Central', 'Barva', 'Santo Domingo', 'Santa Barbara', 'San Rafael', 'San Isidro', 'Belén', 'Flores', 'San Pablo', 'Sarapiquí')) OR
--        (p.idProvincia = 5 AND canton IN ('Liberia', 'Nicoya', 'Santa Cruz', 'Bagaces', 'Carrillo', 'Cañas', 'Abangares', 'Tilarán', 'Nandayure', 'La Cruz', 'Hojancha')) OR
--        (p.idProvincia = 6 AND canton IN ('Central', 'Esparza', 'Buenos Aires', 'Montes De Oro', 'Osa', 'Quepos', 'Golfito', 'Coto Brus', 'Parrita', 'Corredores', 'Garabito')) OR
--        (p.idProvincia = 7 AND canton IN ('Central', 'Pococí', 'Siquirres', 'Talamanca', 'Matina', 'Guácimo'))
--) AS c
--CROSS APPLY (
--    SELECT nombre
--    FROM (VALUES
--        -- San José
--        ('Carmen'), ('Merced'), ('Hospital'), ('Catedral'), ('Zapote'), ('San Francisco De Dos Rios'), ('Uruca'), ('Mata Redonda'), ('Pavas'), ('Hatillo'), ('San Sebastián'),
--        ('Escazú'), ('San Antonio'), ('San Rafael'),
--        ('Desamparados'), ('San Miguel'), ('San Juan De Dios'), ('San Rafael Arriba'), ('San Rafael Abajo'), ('San Antonio'), ('Frailes'), ('Patarra'), ('San Cristobal'), ('Rosario'), ('Damas'), ('Gravilias'), ('Los Guido'),
--        ('Santiago'), ('Mercedes Sur'), ('Barbacoas'), ('Grifo Alto'), ('San Rafael'), ('Candelarita'), ('Desamparaditos'), ('San Antonio'), ('Chires'),
--        ('San Marcos'), ('San Lorenzo'), ('San Carlos'),
--        ('Aserrí'), ('Tarbaca'), ('Vuelta De Jorco'), ('San Gabriel'), ('Legua'), ('Monterrey'), ('Salitrillos'),
--        ('Colón'), ('Guayabo'), ('Tabarcia'), ('Piedras Negras'), ('Picagres'), ('Jaris'),
--        ('Guadalupe'), ('San Francisco'), ('Calle Blancos'), ('Mata De Platano'), ('Ipís'), ('Rancho Redondo'), ('Purral'),
--        ('Santa Ana'), ('Salitral'), ('Pozos'), ('Uruca'), ('Piedades'), ('Brasil'),
--        ('Alajuelita'), ('San Josecito'), ('San Antonio'), ('Concepción'), ('San Felipe'),
--        ('San Isidro'), ('San Rafael'), ('Dulce Nombre De Jesus'), ('Patalillo'), ('Cascajal'),
--        ('San Ignacio'), ('Guaitil'), ('Palmichal'), ('Cangrejal'), ('Sabanillas'),
--        ('San Juan'), ('Cinco Esquinas'), ('Anselmo Llorente'), ('Leon XII'), ('Colima'),
--        ('San Vicente'), ('San Jeronimo'), ('La Trinidad'),
--        ('San Pedro'), ('Sabanilla'), ('Mercedes'), ('San Rafael'),
--        ('San Pablo'), ('San Pedro'), ('San Juan De Mata'), ('San Luis'), ('Carara'),
--        ('Santa María'), ('Jardin'), ('Copey'),
--        ('Curridabat'), ('Granadilla'), ('Sanchez'), ('Tirrases'),
--        ('San Isidro De El General'), ('El General'), ('Daniel Flores'), ('Rivas'), ('San Pedro'), ('Platanares'), ('Pejibaye'), ('Cajon'), ('Baru'), ('Rio Nuevo'), ('Páramo'),
--        ('San Pablo'), ('San Andres'), ('Llano Bonito'), ('San Isidro'), ('Santa Cruz'), ('San Antonio'),
--        -- Alajuela
--        ('Alajuela'), ('San José'), ('Carrizal'), ('San Antonio'), ('Guácima'), ('San Isidro'), ('Sabanilla'), ('San Rafael'), ('Rio Segundo'), ('Desamparados'), ('Turrucares'), ('Tambor'), ('Garita'), ('Sarapiquí'),
--        ('San Ramón'), ('Santiago'), ('San Juan'), ('Piedades Norte'), ('Piedades Sur'), ('San Rafael'), ('San Isidro'), ('Angeles'), ('Alfaro'), ('Volio'), ('Concepción'), ('Zapotal'), ('Peñas Blancas'),
--        ('Grecia'), ('San Isidro'), ('San José'), ('San Roque'), ('Tacares'), ('Rio Cuarto'), ('Puente De Piedra'), ('Bolivar'),
--        ('San Mateo'), ('Desmonte'), ('Jesús María'), ('Labrador'),
--        ('Atenas'), ('Jesús'), ('Mercedes'), ('San Isidro'), ('Concepción'), ('San José'), ('Santa Eulalia'), ('Escobal'),
--        ('Naranjo'), ('San Miguel'), ('San José'), ('Cirrí Sur'), ('San Jerónimo'), ('San Juan'), ('El Rosario'), ('Palmitos'),
--        ('Palmares'), ('Zaragoza'), ('Buenos Aires'), ('Santiago'), ('Candelaria'), ('Esquipulas'), ('La Granja'),
--        ('San Pedro'), ('San Juan'), ('San Rafael'), ('Carrillos'), ('Sabana Redonda'),
--        ('Orotina'), ('El Mastate'), ('Hacienda Vieja'), ('Coyolar'), ('La Ceiba'),
--        ('Quesada'), ('Florencia'), ('Buenavista'), ('Aguas Zarcas'), ('Venecia'), ('Pital'), ('La Fortuna'), ('La Tigra'), ('La Palmera'), ('Venado'), ('Cutris'), ('Monterrey'), ('Pocosol'),
--        ('Zarcero'), ('Laguna'), ('Tapesco'), ('Guadalupe'), ('Palmira'), ('Zapote'), ('Brisas'),
--        ('Sarchí Norte'), ('Sarchí Sur'), ('Toro Amarillo'), ('San Pedro'), ('Rodriguez'),
--        ('Upala'), ('Aguas Claras'), ('San José o Pizote'), ('Bijagua'), ('Delicias'), ('Dos Rios'), ('Yolillal'), ('Canalete'),
--        ('Los Chiles'), ('Caño Negro'), ('El Amparo'), ('San Jorge'),
--        ('San Rafael'), ('Buenavista'), ('Cote'), ('Katira'),
--        ('Río Cuarto'),
--        -- Cartago
--        ('Oriental'), ('Occidental'), ('Carmen'), ('San Nicolás'), ('Aguacaliente o San Francisco'), ('Guadalupe o Arenilla'), ('Corralillo'), ('Tierra Blanca'), ('Dulce Nombre'), ('Llano Grande'), ('Quebradilla'),
--        ('Paraiso'), ('Santiago'), ('Orosi'), ('Cachí'), ('Llanos de Santa Lucía'),
--        ('Tres Rios'), ('San Diego'), ('San Juan'), ('San Rafael'), ('Concepción'), ('Dulce Nombre'), ('San Ramón'), ('Rio Azul'),
--        ('Juan Viñas'), ('Tucurrique'), ('Pejibaye'),
--        ('Turrialba'), ('La Suiza'), ('Peralta'), ('Santa Cruz'), ('Santa Teresita'), ('Pavones'), ('Tuis'), ('Tayutic'), ('Santa Rosa'), ('Tres Equis'), ('La Isabel'), ('Chirripó'),
--        ('Pacayas'), ('Cervantes'), ('Capellades'),
--        ('San Rafael'), ('Cot'), ('Potrero Cerrado'), ('Cipreses'), ('Santa Rosa'),
--        ('El Tejar'), ('San Isidro'), ('Tobosi'), ('Patio De Agua'),
--        -- Heredia
--        ('Heredia'), ('Mercedes'), ('San Francisco'), ('Ulloa'), ('Varablanca'),
--        ('Barva'), ('San Pedro'), ('San Pablo'), ('San Roque'), ('Santa Lucía'), ('San José de la Montaña'),
--        ('Santo Domingo'), ('San Vicente'), ('San Miguel'), ('Paracito'), ('Santo Tomás'), ('Santa Rosa'), ('Tures'), ('Para'),
--        ('Santa Bárbara'), ('San Pedro'), ('San Juan'), ('Jesús'), ('Santo Domingo'), ('Puraba'),
--        ('San Rafael'), ('San Josecito'), ('Santiago'), ('Los Ángeles'), ('Concepción'),
--        ('San Isidro'), ('San José'), ('Concepción'), ('San Francisco'),
--        ('San Antonio'), ('La Ribera'), ('La Asuncion'),
--        ('San Joaquín'), ('Barrantes'), ('Llorente'),
--        ('San Pablo'), ('Rincon De Sabanilla'),
--        ('Puerto Viejo'), ('La Virgen'), ('Las Horquetas'), ('Llanuras Del Gaspar'), ('Cureña'),
--        -- Guanacaste
--        ('Liberia'), ('Cañas Dulces'), ('Mayorga'), ('Nacascolo'), ('Curubande'),
--        ('Nicoya'), ('Mansión'), ('San Antonio'), ('Quebrada Honda'), ('Sámara'), ('Nosara'), ('Belén De Nosarita'),
--        ('Santa Cruz'), ('Bolson'), ('Veintisiete de Abril'), ('Tempate'), ('Cartagena'), ('Cuajiniquil'), ('Diria'), ('Cabo Velas'), ('Tamarindo'),
--        ('Bagaces'), ('La Fortuna'), ('Mogote'), ('Rio Naranjo'),
--        ('Filadelfia'), ('Palmira'), ('Sardinal'), ('Belen'),
--        ('Cañas'), ('Palmira'), ('San Miguel'), ('Bebedero'), ('Porozal'),
--        ('Las Juntas'), ('Sierra'), ('San Juan'), ('Colorado'),
--        ('Tilarán'), ('Quebrada Grande'), ('Tronadora'), ('Santa Rosa'), ('Líbano'), ('Tierras Morenas'), ('Arenal'),
--        ('Carmona'), ('Santa Rita'), ('Zapotal'), ('San Pablo'), ('Porvenir'), ('Bejuco'),
--        ('La Cruz'), ('Santa Cecilia'), ('La Garita'), ('Santa Elena'),
--        ('Hojancha'), ('Monte Romo'), ('Puerto Carrillo'), ('Huacas'),
--        -- Puntarenas
--        ('Puntarenas'), ('Pitahaya'), ('Chomes'), ('Lepanto'), ('Paquera'), ('Manzanillo'), ('Guacimal'), ('Barranca'), ('Monte Verde'), ('Isla Del Coco'), ('Cóbano'), ('Chacarita'), ('Chira'), ('Acapulco'), ('El Roble'), ('Arancibia'),
--        ('Espíritu Santo'), ('San Juan Grande'), ('Macacona'), ('San Rafael'), ('San Jerónimo'),
--        ('Buenos Aires'), ('Volcán'), ('Potrero Grande'), ('Boruca'), ('Pilas'), ('Colinas'), ('Changuena'), ('Biolley'), ('Brunka'),
--        ('Miramar'), ('La Unión'), ('San Isidro'),
--        ('Puerto Cortés'), ('Palmar'), ('Sierpe'), ('Bahía Ballena'), ('Piedras Blancas'), ('Bahía Drake'),
--        ('Quepos'), ('Savegre'), ('Naranjito'),
--        ('Golfito'), ('Puerto Jiménez'), ('Guaycara'), ('Pavón'),
--        ('San Vito'), ('Sabalito'), ('Aguabuena'), ('Limoncito'), ('Pittier'),
--        ('Parrita'),
--        ('Corredor'), ('La Cuesta'), ('Canoas'), ('Laurel'),
--        ('Jacó'), ('Tárcoles'),
--        -- Limón
--        ('Limón'), ('Valle La Estrella'), ('Rio Blanco'), ('Matama'),
--        ('Guapiles'), ('Jiménez'), ('Rita'), ('Roxana'), ('Cariari'), ('Colorado'), ('La Colonia'),
--        ('Siquirres'), ('Pacuarito'), ('Florida'), ('Germania'), ('El Cairo'), ('Alegría'),
--        ('Bratsi'), ('Sixaola'), ('Cahuita'), ('Telire'),
--        ('Matina'), ('Batán'), ('Carrandi'),
--        ('Guácimo'), ('Mercedes'), ('Pocora'), ('Rio Jiménez'), ('Duacari')
--    ) AS d(nombre)
--    WHERE 
--        (p.idProvincia = 1 AND c.canton = 'Central' AND d.nombre IN ('Carmen', 'Merced', 'Hospital', 'Catedral', 'Zapote', 'San Francisco De Dos Rios', 'Uruca', 'Mata Redonda', 'Pavas', 'Hatillo', 'San Sebastián')) OR
--        (p.idProvincia = 1 AND c.canton = 'Escazú' AND d.nombre IN ('Escazú', 'San Antonio', 'San Rafael')) OR
--        (p.idProvincia = 1 AND c.canton = 'Desamparados' AND d.nombre IN ('Desamparados', 'San Miguel', 'San Juan De Dios', 'San Rafael Arriba', 'San Rafael Abajo', 'San Antonio', 'Frailes', 'Patarra', 'San Cristobal', 'Rosario', 'Damas', 'Gravilias', 'Los Guido')) OR
--        (p.idProvincia = 1 AND c.canton = 'Puriscal' AND d.nombre IN ('Santiago', 'Mercedes Sur', 'Barbacoas', 'Grifo Alto', 'San Rafael', 'Candelarita', 'Desamparaditos', 'San Antonio', 'Chires')) OR
--        (p.idProvincia = 1 AND c.canton = 'Tarrazú' AND d.nombre IN ('San Marcos', 'San Lorenzo', 'San Carlos')) OR
--        (p.idProvincia = 1 AND c.canton = 'Aserrí' AND d.nombre IN ('Aserrí', 'Tarbaca', 'Vuelta De Jorco', 'San Gabriel', 'Legua', 'Monterrey', 'Salitrillos')) OR
--        (p.idProvincia = 1 AND c.canton = 'Mora' AND d.nombre IN ('Colón', 'Guayabo', 'Tabarcia', 'Piedras Negras', 'Picagres', 'Jaris')) OR
--        (p.idProvincia = 1 AND c.canton = 'Goicoechea' AND d.nombre IN ('Guadalupe', 'San Francisco', 'Calle Blancos', 'Mata De Platano', 'Ipís', 'Rancho Redondo', 'Purral')) OR
--        (p.idProvincia = 1 AND c.canton = 'Santa Ana' AND d.nombre IN ('Santa Ana', 'Salitral', 'Pozos', 'Uruca', 'Piedades', 'Brasil')) OR
--        (p.idProvincia = 1 AND c.canton = 'Alajuelita' AND d.nombre IN ('Alajuelita', 'San Josecito', 'San Antonio', 'Concepción', 'San Felipe')) OR
--        (p.idProvincia = 1 AND c.canton = 'Vázquez De Coronado' AND d.nombre IN ('San Isidro', 'San Rafael', 'Dulce Nombre De Jesus', 'Patalillo', 'Cascajal')) OR
--        (p.idProvincia = 1 AND c.canton = 'Acosta' AND d.nombre IN ('San Ignacio', 'Guaitil', 'Palmichal', 'Cangrejal', 'Sabanillas')) OR
--        (p.idProvincia = 1 AND c.canton = 'Tibás' AND d.nombre IN ('San Juan', 'Cinco Esquinas', 'Anselmo Llorente', 'Leon XII', 'Colima')) OR
--        (p.idProvincia = 1 AND c.canton = 'Moravia' AND d.nombre IN ('San Vicente', 'San Jeronimo', 'La Trinidad')) OR
--        (p.idProvincia = 1 AND c.canton = 'Montes De Oca' AND d.nombre IN ('San Pedro', 'Sabanilla', 'Mercedes', 'San Rafael')) OR
--        (p.idProvincia = 1 AND c.canton = 'Turrubares' AND d.nombre IN ('San Pablo', 'San Pedro', 'San Juan De Mata', 'San Luis', 'Carara')) OR
--        (p.idProvincia = 1 AND c.canton = 'Dota' AND d.nombre IN ('Santa María', 'Jardin', 'Copey')) OR
--        (p.idProvincia = 1 AND c.canton = 'Curridabat' AND d.nombre IN ('Curridabat', 'Granadilla', 'Sanchez', 'Tirrases')) OR
--        (p.idProvincia = 1 AND c.canton = 'Pérez Zeledón' AND d.nombre IN ('San Isidro De El General', 'El General', 'Daniel Flores', 'Rivas', 'San Pedro', 'Platanares', 'Pejibaye', 'Cajon', 'Baru', 'Rio Nuevo', 'Páramo')) OR
--        (p.idProvincia = 1 AND c.canton = 'León Cortés Castro' AND d.nombre IN ('San Pablo', 'San Andres', 'Llano Bonito', 'San Isidro', 'Santa Cruz', 'San Antonio')) OR
--        -- Alajuela
--        (p.idProvincia = 2 AND c.canton = 'Central' AND d.nombre IN ('Alajuela', 'San José', 'Carrizal', 'San Antonio', 'Guácima', 'San Isidro', 'Sabanilla', 'San Rafael', 'Rio Segundo', 'Desamparados', 'Turrucares', 'Tambor', 'Garita', 'Sarapiquí')) OR
--        (p.idProvincia = 2 AND c.canton = 'San Ramón' AND d.nombre IN ('San Ramón', 'Santiago', 'San Juan', 'Piedades Norte', 'Piedades Sur', 'San Rafael', 'San Isidro', 'Angeles', 'Alfaro', 'Volio', 'Concepción', 'Zapotal', 'Peñas Blancas')) OR
--        (p.idProvincia = 2 AND c.canton = 'Grecia' AND d.nombre IN ('Grecia', 'San Isidro', 'San José', 'San Roque', 'Tacares', 'Rio Cuarto', 'Puente De Piedra', 'Bolivar')) OR
--        (p.idProvincia = 2 AND c.canton = 'San Mateo' AND d.nombre IN ('San Mateo', 'Desmonte', 'Jesús María', 'Labrador')) OR
--        (p.idProvincia = 2 AND c.canton = 'Atenas' AND d.nombre IN ('Atenas', 'Jesús', 'Mercedes', 'San Isidro', 'Concepción', 'San José', 'Santa Eulalia', 'Escobal')) OR
--        (p.idProvincia = 2 AND c.canton = 'Naranjo' AND d.nombre IN ('Naranjo', 'San Miguel', 'San José', 'Cirrí Sur', 'San Jerónimo', 'San Juan', 'El Rosario', 'Palmitos')) OR
--        (p.idProvincia = 2 AND c.canton = 'Palmares' AND d.nombre IN ('Palmares', 'Zaragoza', 'Buenos Aires', 'Santiago', 'Candelaria', 'Esquipulas', 'La Granja')) OR
--        (p.idProvincia = 2 AND c.canton = 'Poás' AND d.nombre IN ('San Pedro', 'San Juan', 'San Rafael', 'Carrillos', 'Sabana Redonda')) OR
--        (p.idProvincia = 2 AND c.canton = 'Orotina' AND d.nombre IN ('Orotina', 'El Mastate', 'Hacienda Vieja', 'Coyolar', 'La Ceiba')) OR
--        (p.idProvincia = 2 AND c.canton = 'San Carlos' AND d.nombre IN ('Quesada', 'Florencia', 'Buenavista', 'Aguas Zarcas', 'Venecia', 'Pital', 'La Fortuna', 'La Tigra', 'La Palmera', 'Venado', 'Cutris', 'Monterrey', 'Pocosol')) OR
--        (p.idProvincia = 2 AND c.canton = 'Zarcero' AND d.nombre IN ('Zarcero', 'Laguna', 'Tapesco', 'Guadalupe', 'Palmira', 'Zapote', 'Brisas')) OR
--        (p.idProvincia = 2 AND c.canton = 'Sarchí' AND d.nombre IN ('Sarchí Norte', 'Sarchí Sur', 'Toro Amarillo', 'San Pedro', 'Rodriguez')) OR
--        (p.idProvincia = 2 AND c.canton = 'Upala' AND d.nombre IN ('Upala', 'Aguas Claras', 'San José o Pizote', 'Bijagua', 'Delicias', 'Dos Rios', 'Yolillal', 'Canalete')) OR
--        (p.idProvincia = 2 AND c.canton = 'Los Chiles' AND d.nombre IN ('Los Chiles', 'Caño Negro', 'El Amparo', 'San Jorge')) OR
--        (p.idProvincia = 2 AND c.canton = 'Guatuso' AND d.nombre IN ('San Rafael', 'Buenavista', 'Cote', 'Katira')) OR
--        (p.idProvincia = 2 AND c.canton = 'Río Cuarto' AND d.nombre IN ('Río Cuarto')) OR
--        -- Cartago
--        (p.idProvincia = 3 AND c.canton = 'Central' AND d.nombre IN ('Oriental', 'Occidental', 'Carmen', 'San Nicolás', 'Aguacaliente o San Francisco', 'Guadalupe o Arenilla', 'Corralillo', 'Tierra Blanca', 'Dulce Nombre', 'Llano Grande', 'Quebradilla')) OR
--        (p.idProvincia = 3 AND c.canton = 'Paraíso' AND d.nombre IN ('Paraiso', 'Santiago', 'Orosi', 'Cachí', 'Llanos de Santa Lucía')) OR
--        (p.idProvincia = 3 AND c.canton = 'La Unión' AND d.nombre IN ('Tres Rios', 'San Diego', 'San Juan', 'San Rafael', 'Concepción', 'Dulce Nombre', 'San Ramón', 'Rio Azul')) OR
--        (p.idProvincia = 3 AND c.canton = 'Jiménez' AND d.nombre IN ('Juan Viñas', 'Tucurrique', 'Pejibaye')) OR
--        (p.idProvincia = 3 AND c.canton = 'Turrialba' AND d.nombre IN ('Turrialba', 'La Suiza', 'Peralta', 'Santa Cruz', 'Santa Teresita', 'Pavones', 'Tuis', 'Tayutic', 'Santa Rosa', 'Tres Equis', 'La Isabel', 'Chirripó')) OR
--        (p.idProvincia = 3 AND c.canton = 'Alvarado' AND d.nombre IN ('Pacayas', 'Cervantes', 'Capellades')) OR
--        (p.idProvincia = 3 AND c.canton = 'Oreamuno' AND d.nombre IN ('San Rafael', 'Cot', 'Potrero Cerrado', 'Cipreses', 'Santa Rosa')) OR
--        (p.idProvincia = 3 AND c.canton = 'El Guarco' AND d.nombre IN ('El Tejar', 'San Isidro', 'Tobosi', 'Patio De Agua')) OR
--        -- Heredia
--        (p.idProvincia = 4 AND c.canton = 'Central' AND d.nombre IN ('Heredia', 'Mercedes', 'San Francisco', 'Ulloa', 'Varablanca')) OR
--        (p.idProvincia = 4 AND c.canton = 'Barva' AND d.nombre IN ('Barva', 'San Pedro', 'San Pablo', 'San Roque', 'Santa Lucía', 'San José de la Montaña')) OR
--        (p.idProvincia = 4 AND c.canton = 'Santo Domingo' AND d.nombre IN ('Santo Domingo', 'San Vicente', 'San Miguel', 'Paracito', 'Santo Tomás', 'Santa Rosa', 'Tures', 'Para')) OR
--        (p.idProvincia = 4 AND c.canton = 'Santa Barbara' AND d.nombre IN ('Santa Bárbara', 'San Pedro', 'San Juan', 'Jesús', 'Santo Domingo', 'Puraba')) OR
--        (p.idProvincia = 4 AND c.canton = 'San Rafael' AND d.nombre IN ('San Rafael', 'San Josecito', 'Santiago', 'Los Ángeles', 'Concepción')) OR
--        (p.idProvincia = 4 AND c.canton = 'San Isidro' AND d.nombre IN ('San Isidro', 'San José', 'Concepción', 'San Francisco')) OR
--        (p.idProvincia = 4 AND c.canton = 'Belén' AND d.nombre IN ('San Antonio', 'La Ribera', 'La Asuncion')) OR
--        (p.idProvincia = 4 AND c.canton = 'Flores' AND d.nombre IN ('San Joaquín', 'Barrantes', 'Llorente')) OR
--        (p.idProvincia = 4 AND c.canton = 'San Pablo' AND d.nombre IN ('San Pablo', 'Rincon De Sabanilla')) OR
--        (p.idProvincia = 4 AND c.canton = 'Sarapiquí' AND d.nombre IN ('Puerto Viejo', 'La Virgen', 'Las Horquetas', 'Llanuras Del Gaspar', 'Cureña')) OR
--        -- Guanacaste
--        (p.idProvincia = 5 AND c.canton = 'Liberia' AND d.nombre IN ('Liberia', 'Cañas Dulces', 'Mayorga', 'Nacascolo', 'Curubande')) OR
--        (p.idProvincia = 5 AND c.canton = 'Nicoya' AND d.nombre IN ('Nicoya', 'Mansión', 'San Antonio', 'Quebrada Honda', 'Sámara', 'Nosara', 'Belén De Nosarita')) OR
--        (p.idProvincia = 5 AND c.canton = 'Santa Cruz' AND d.nombre IN ('Santa Cruz', 'Bolson', 'Veintisiete de Abril', 'Tempate', 'Cartagena', 'Cuajiniquil', 'Diria', 'Cabo Velas', 'Tamarindo')) OR
--        (p.idProvincia = 5 AND c.canton = 'Bagaces' AND d.nombre IN ('Bagaces', 'La Fortuna', 'Mogote', 'Rio Naranjo')) OR
--        (p.idProvincia = 5 AND c.canton = 'Carrillo' AND d.nombre IN ('Filadelfia', 'Palmira', 'Sardinal', 'Belen')) OR
--               (p.idProvincia = 5 AND c.canton = 'Cañas' AND d.nombre IN ('Cañas', 'Palmira', 'San Miguel', 'Bebedero', 'Porozal')) OR
--        (p.idProvincia = 5 AND c.canton = 'Abangares' AND d.nombre IN ('Las Juntas', 'Sierra', 'San Juan', 'Colorado')) OR
--        (p.idProvincia = 5 AND c.canton = 'Tilarán' AND d.nombre IN ('Tilarán', 'Quebrada Grande', 'Tronadora', 'Santa Rosa', 'Líbano', 'Tierras Morenas', 'Arenal')) OR
--        (p.idProvincia = 5 AND c.canton = 'Nandayure' AND d.nombre IN ('Carmona', 'Santa Rita', 'Zapotal', 'San Pablo', 'Porvenir', 'Bejuco')) OR
--        (p.idProvincia = 5 AND c.canton = 'La Cruz' AND d.nombre IN ('La Cruz', 'Santa Cecilia', 'La Garita', 'Santa Elena')) OR
--        (p.idProvincia = 5 AND c.canton = 'Hojancha' AND d.nombre IN ('Hojancha', 'Monte Romo', 'Puerto Carrillo', 'Huacas')) OR
--        -- Puntarenas
--        (p.idProvincia = 6 AND c.canton = 'Central' AND d.nombre IN ('Puntarenas', 'Pitahaya', 'Chomes', 'Lepanto', 'Paquera', 'Manzanillo', 'Guacimal', 'Barranca', 'Monte Verde', 'Isla Del Coco', 'Cóbano', 'Chacarita', 'Chira', 'Acapulco', 'El Roble', 'Arancibia')) OR
--        (p.idProvincia = 6 AND c.canton = 'Esparza' AND d.nombre IN ('Espíritu Santo', 'San Juan Grande', 'Macacona', 'San Rafael', 'San Jerónimo')) OR
--        (p.idProvincia = 6 AND c.canton = 'Buenos Aires' AND d.nombre IN ('Buenos Aires', 'Volcán', 'Potrero Grande', 'Boruca', 'Pilas', 'Colinas', 'Changuena', 'Biolley', 'Brunka')) OR
--        (p.idProvincia = 6 AND c.canton = 'Montes De Oro' AND d.nombre IN ('Miramar', 'La Unión', 'San Isidro')) OR
--        (p.idProvincia = 6 AND c.canton = 'Osa' AND d.nombre IN ('Puerto Cortés', 'Palmar', 'Sierpe', 'Bahía Ballena', 'Piedras Blancas', 'Bahía Drake')) OR
--        (p.idProvincia = 6 AND c.canton = 'Quepos' AND d.nombre IN ('Quepos', 'Savegre', 'Naranjito')) OR
--        (p.idProvincia = 6 AND c.canton = 'Golfito' AND d.nombre IN ('Golfito', 'Puerto Jiménez', 'Guaycara', 'Pavón')) OR
--        (p.idProvincia = 6 AND c.canton = 'Coto Brus' AND d.nombre IN ('San Vito', 'Sabalito', 'Aguabuena', 'Limoncito', 'Pittier')) OR
--        (p.idProvincia = 6 AND c.canton = 'Parrita' AND d.nombre IN ('Parrita')) OR
--        (p.idProvincia = 6 AND c.canton = 'Corredores' AND d.nombre IN ('Corredor', 'La Cuesta', 'Canoas', 'Laurel')) OR
--        (p.idProvincia = 6 AND c.canton = 'Garabito' AND d.nombre IN ('Jacó', 'Tárcoles')) OR
--        -- Limón
--        (p.idProvincia = 7 AND c.canton = 'Central' AND d.nombre IN ('Limón', 'Valle La Estrella', 'Rio Blanco', 'Matama')) OR
--        (p.idProvincia = 7 AND c.canton = 'Pococí' AND d.nombre IN ('Guapiles', 'Jiménez', 'Rita', 'Roxana', 'Cariari', 'Colorado', 'La Colonia')) OR
--        (p.idProvincia = 7 AND c.canton = 'Siquirres' AND d.nombre IN ('Siquirres', 'Pacuarito', 'Florida', 'Germania', 'El Cairo', 'Alegría')) OR
--        (p.idProvincia = 7 AND c.canton = 'Talamanca' AND d.nombre IN ('Bratsi', 'Sixaola', 'Cahuita', 'Telire')) OR
--        (p.idProvincia = 7 AND c.canton = 'Matina' AND d.nombre IN ('Matina', 'Batán', 'Carrandi')) OR
--        (p.idProvincia = 7 AND c.canton = 'Guácimo' AND d.nombre IN ('Guácimo', 'Mercedes', 'Pocora', 'Rio Jiménez', 'Duacari'))
--) AS d