create database petBD
go

use petBD
go

create table typeDIM(
	typeKey int primary key identity(1,1),
	type nvarchar(3),
	breed1 nvarchar(255),
	breed2 nvarchar(255),
	gender nvarchar(6)
)
go

CREATE INDEX indexTypeKey ON typeDIM (typeKey);
CREATE INDEX indexType ON typeDIM (type ASC, breed1 ASC, breed2 ASC, gender ASC);

go

create table healthDIM(
	healthKey int primary key identity(1,1),
	vaccinated nvarchar(8),
	dewormed nvarchar(8),
	sterilized nvarchar(8),
	health nvarchar(14),
)

go

CREATE INDEX indexHealthKey ON healthDIM (healthKey);
CREATE INDEX indexHealth ON healthDIM (vaccinated ASC, dewormed ASC, sterilized ASC, health ASC);

go

create table appearanceDIM(
	appearanceKey int primary key identity(1,1),
	color1 nvarchar(255),
	color2 nvarchar(255),
	color3 nvarchar(255),
	maturitySize nvarchar(13),
	furLength nvarchar(13)
)

go

CREATE INDEX indexAppearanceKey ON appearanceDIM (appearanceKey);
CREATE INDEX indexHealth ON appearanceDIM (color1 ASC, color2 ASC, color3 ASC, maturitySize ASC, furLength ASC);

go

create table stateDIM(
	stateKey int primary key identity(1,1),
	name nvarchar(255)
)

go

CREATE INDEX indexStateKey ON stateDIM (stateKey);
CREATE INDEX indexState ON stateDIM (name);

go

create table petFACT(
	petKey int primary key identity(1,1),
	petID int,
	age int,
	quantity int,
	fee int,
	typeKey int,
	appearanceKey int,
	stateKey int,
	healthKey int,
	startDate datetime default getdate(),
	endDate datetime,
	foreign key(typeKey) references typeDIM(typeKey),
	foreign key(appearanceKey) references appearanceDIM(appearanceKey),
	foreign key(stateKey) references stateDIM(stateKey),
	foreign key(healthKey) references healthDIM(healthKey),
)
go

select *
from typeDIM

select * from petFACT