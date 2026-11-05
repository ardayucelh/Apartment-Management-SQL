/*
    Apartman Yönetim Sistemi
    SQL Server / T-SQL

    Not: Bu şema, önceki çalışmadan hatırlanan tablo adları temel
    alınarak yeniden oluşturulmuş örnek bir tasarımdır.
*/

IF DB_ID(N'ApartmanYonetimDB') IS NULL
BEGIN
    CREATE DATABASE ApartmanYonetimDB;
END;
GO

USE ApartmanYonetimDB;
GO

CREATE TABLE YonetimBirimi
(
    YonetimBirimiID INT IDENTITY(1,1) PRIMARY KEY,
    AdSoyad NVARCHAR(100) NOT NULL,
    Telefon NVARCHAR(20) NULL,
    Eposta NVARCHAR(150) NULL
);
GO

CREATE TABLE EvSahipleri
(
    EvSahibiID INT IDENTITY(1,1) PRIMARY KEY,
    AdSoyad NVARCHAR(100) NOT NULL,
    Telefon NVARCHAR(20) NULL,
    Eposta NVARCHAR(150) NULL
);
GO

CREATE TABLE Daireler
(
    DaireID INT IDENTITY(1,1) PRIMARY KEY,
    DaireNo NVARCHAR(10) NOT NULL UNIQUE,
    Kat INT NOT NULL,
    Metrekare DECIMAL(8,2) NULL,
    EvSahibiID INT NOT NULL,

    CONSTRAINT FK_Daireler_EvSahipleri
        FOREIGN KEY (EvSahibiID)
        REFERENCES EvSahipleri(EvSahibiID)
);
GO

CREATE TABLE Gelirler
(
    GelirID INT IDENTITY(1,1) PRIMARY KEY,
    DaireID INT NOT NULL,
    YonetimBirimiID INT NOT NULL,
    GelirTuru NVARCHAR(50) NOT NULL,
    Tutar DECIMAL(10,2) NOT NULL,
    GelirTarihi DATE NOT NULL,
    TahsilatDurumu NVARCHAR(20) NOT NULL
        CONSTRAINT DF_Gelirler_TahsilatDurumu DEFAULT N'Bekliyor',
    Aciklama NVARCHAR(250) NULL,

    CONSTRAINT CK_Gelirler_Tutar CHECK (Tutar > 0),
    CONSTRAINT CK_Gelirler_TahsilatDurumu
        CHECK (TahsilatDurumu IN (N'Ödendi', N'Bekliyor')),
    CONSTRAINT FK_Gelirler_Daireler
        FOREIGN KEY (DaireID)
        REFERENCES Daireler(DaireID),
    CONSTRAINT FK_Gelirler_YonetimBirimi
        FOREIGN KEY (YonetimBirimiID)
        REFERENCES YonetimBirimi(YonetimBirimiID)
);
GO
