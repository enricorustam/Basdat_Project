create table Nasabah
(
id_nasabah char(10) not null enable,
nama_nasabah varchar(20),
no_telp number,
alamat varchar(20),
constraint Nasabah_pk primary key (id_nasabah) enable
);

create table Rekening
(
no_rekening char(20) not null enable,
nama_rekening varchar(20),
saldo number,
constraint Rekening_pk primary key (no_rekening) enable
);

create table Memiliki 
(
id_kepemilikan char(10) not null enable,
no_rekening char(10),
id_nasabah char(10),
constraint Memiliki_pk primary key (id_kepemilikan) enable,
constraint Memiliki_fk foreign key (no_rekening) references Rekening (no_rekening) on delete cascade,
constraint Memiliki_fk2 foreign key (id_nasabah) references Nasabah (id_nasabah) on delete cascade
);

create table Melayani 
(
id_melayani char(10) not null enable,
id_kepemilikan char(10),
id_petugas char(10),
constraint Melayani_pk primary key (id_melayani) enable,
constraint Melayani_fk foreign key (id_kepemilikan) references Kepemilikan (id_kepemilikan) on delete cascade,
constraint Melayani_fk2 foreign key (id_petugas) references Petugas (id_petugas) on delete cascade
);

create table Petugas
(
id_petugas char(10) not null enable,
nama_petugas varchar(20),
no_telp number,
alamat varchar(20),
constraint Nasabah_pk primary key (id_nasabah) enable
);

create table Teller
(
id_teller char(10) not null enable,
id_petugas char(10),
constraint Teller_pk primary key (id_teller) enable,
constraint Teller_fk foreign key (id_petugas) references Petugas (id_petugas) on delete cascade
);

create table CS
(
id_cs char(10) not null enable,
id_petugas char(10),
constraint CS_pk primary key (id_cs) enable,
constraint CS_fk foreign key (id_petugas) references Petugas (id_petugas) on delete cascade
);

create table Cabang
(
kode_cabang char(10) not null enable,
nama_cabang varchar(20),
alamat varchar(20),
constraint Cabang_pk primary key (kode_cabang) enable
);

create table Peminjaman
(
no_peminjaman char(10) not null enable,
tanggal_peminjaman date,
jumlah_peminjaman varchar(10),
id_nasabah char(10),
kode_cabang char(10),
constraint Peminjaman_pk primary key (no_peminjaman) enable,
constraint Peminjaman_fk foreign key (id_nasabah) references Nasabah (id_nasabah) on delete cascade,
constraint Peminjaman_fk2 foreign key (kode_cabang) references Cabang (kode_cabang) on delete cascade
):

create table Pembayaran 
(
no_Pembayaran char(10) not null enable,
jumlah_pembayaran varchar(10),
tanggal_pembayaran date,
no_peminjaman 
);

create table Akun
(
id_akun char(10) not null enable,
nama_akun varchar(20),
constraint Akun_pk primary key (id_akun) enable
);

create table Tabungan
(
suku_bunga char(10) not null enable,
id_akun char(10),
constraint Tabungan_pk primary key (suku_bunga) enable,
constraint Tabungan_fk foreign key (id_akun) references Akun (id_akun) on delete cascade
);

create table Rekening_Giro
(
jumlah_cerukan char(10) not null enable,
id_akun char(10),
constraint Rekening_Giro_pk primary key (jumlah_cerukan) enable,
constraint Rekening_Giro_fk foreign key (id_akun) references Akun (id_akun) on delete cascade
);

create table Depositor
(
id_depositor char(10) not null enable,
id_nasabah char(10),
id_akun char(10),
constraint Depositor_pk primary key (id_depositor) enable,
constraint Depositor_fk foreign key (id_nasabah) references Nasabah (id_nasabah) on delete cascade,
constraint Depositor_fk2 foreign key (id_akun) references Akun (id_akun) on delete cascade
);