/*CREACION DE LA TABLA AUDITORA y LOS TRIGGER POR CADA TABLA QUE VA A SER REGISTRADA POR EL USUARIO*/

create table Auditoria(
idAuditoria int primary key not null, 
Persona varchar (50) not null,
Tabla varchar (50) not null,
Tipo varchar (40) not null,
Fecha date not null 
);

create sequence idAuditoria MINVALUE 0 START WITH 0 cache 2;

create trigger InsertarAuditoria
 after
 insert ON cab_formulario
 begin
  insert into Auditoria values (idAuditoria.nextval,'DESCONOCIDO', 'CABE_FORM', 'INSERT', '08-02-2019');
 end InsertarAuditoria;

create trigger AuditoriaPersona
 after
 insert ON persona
 begin
  insert into Auditoria values (idAuditoria.nextval,'DESCONOCIDO', 'PERSONA', 'INSERT', '08-02-2019');
 end AuditoriaPersona;

select * from Auditoria

