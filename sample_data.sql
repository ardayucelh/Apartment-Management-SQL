/*
    Tamamen temsili deneme kayıtlarıdır.
    Gerçek kişi veya apartman bilgisi içermez.
*/

USE ApartmanYonetimDB;
GO

INSERT INTO YonetimBirimi (AdSoyad, Telefon, Eposta)
VALUES
(N'Örnek Yönetici', N'0500 000 00 01', N'yonetim@example.com');
GO

INSERT INTO EvSahipleri (AdSoyad, Telefon, Eposta)
VALUES
(N'Örnek Kişi 1', N'0500 000 00 02', N'ev1@example.com'),
(N'Örnek Kişi 2', N'0500 000 00 03', N'ev2@example.com'),
(N'Örnek Kişi 3', N'0500 000 00 04', N'ev3@example.com');
GO

INSERT INTO Daireler (DaireNo, Kat, Metrekare, EvSahibiID)
VALUES
(N'1', 0, 85.00, 1),
(N'2', 1, 100.00, 2),
(N'3', 1, 90.00, 3);
GO

INSERT INTO Gelirler
    (DaireID, YonetimBirimiID, GelirTuru, Tutar, GelirTarihi, TahsilatDurumu, Aciklama)
VALUES
(1, 1, N'Aidat', 750.00, '2026-01-05', N'Ödendi', N'Örnek ocak ayı aidatı'),
(2, 1, N'Aidat', 750.00, '2026-01-05', N'Bekliyor', N'Örnek ocak ayı aidatı'),
(3, 1, N'Aidat', 750.00, '2026-01-06', N'Ödendi', N'Örnek ocak ayı aidatı'),
(1, 1, N'Ek Gelir', 250.00, '2026-01-10', N'Ödendi', N'Örnek ortak alan geliri');
GO
