CREATE DATABASE Bibliografia 
go

USE Bibliografia

--TipoPublicacion
CREATE TABLE TipoPublicacion(
IdTipo Int IDENTITY  PRIMARY KEY,
NombreTipo  NVARCHAR(50) UNIQUE NOT NULL
)

--Editorial
CREATE TABLE Editorial(
IdEditorial Int IDENTITY  PRIMARY KEY,
Nombre NVARCHAR(100) NOT NULL,
Ciudad NVARCHAR(100),
Pais NVARCHAR(100)
)

--Publicacion
CREATE TABLE Publicacion(
IdPublicacion Int IDENTITY  PRIMARY KEY,
Titulo NVARCHAR(200) NOT NULL,
Año Int,
IdTipo int NOT NULL,
IdEditorial Int NOT NULL,
FOREIGN KEY (IdTipo) REFERENCES TipoPublicacion(IdTipo),
FOREIGN KEY (IdEditorial) REFERENCES Editorial(IdEditorial)
)

--Autor
CREATE TABLE Autor (
IdAutor Int IDENTITY PRIMARY KEY,
Nombre NVARCHAR(150) NOT NULL,
TipoAutor NVARCHAR(20) CHECK (TipoAutor IN ('Persona','Corporativo')),
Pais NVARCHAR(100)
)

--Relacion Publicacion Autor
CREATE TABLE PublicacionAutor(
IdPublicacion Int NOT NULL,
IdAutor Int NOT NULL,
OrdenAutor Int NOT NULL,
PRIMARY KEY (IdPublicacion, IdAutor),
FOREIGN KEY (IdPublicacion) REFERENCES Publicacion(IdPublicacion),
FOREIGN KEY (IdAutor) REFERENCES Autor(IdAutor)
)

--Revista
CREATE TABLE Revista(
 IdPublicacion INT PRIMARY KEY,
 Volumen NVARCHAR(20),
 Numero NVARCHAR(20),
 ISSN NVARCHAR(20),
 FOREIGN KEY (IdPublicacion) REFERENCES Publicacion(IdPublicacion)
 )

 --Descriptor
 CREATE TABLE Descriptor (
	IdDescriptor INT IDENTITY PRIMARY KEY,
    Nombre NVARCHAR(100) UNIQUE NOT NULL
	)

--Relacion Publicacion - Descriptor
	CREATE TABLE PublicacionDescriptor (
	 IdPublicacion INT NOT NULL,
    IdDescriptor INT NOT NULL,
    PRIMARY KEY (IdPublicacion, IdDescriptor),
    FOREIGN KEY (IdPublicacion) REFERENCES Publicacion(IdPublicacion),
    FOREIGN KEY (IdDescriptor) REFERENCES Descriptor(IdDescriptor)
)

