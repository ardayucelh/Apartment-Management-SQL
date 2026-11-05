USE ApartmanYonetimDB;
GO

-- 1. Daireleri ve daire sahiplerini listele.
SELECT
    D.DaireNo,
    D.Kat,
    D.Metrekare,
    E.AdSoyad AS EvSahibi
FROM Daireler AS D
INNER JOIN EvSahipleri AS E
    ON D.EvSahibiID = E.EvSahibiID
ORDER BY D.DaireNo;
GO

-- 2. Gelir kayıtlarını daire ve yönetici bilgileriyle listele.
SELECT
    G.GelirID,
    D.DaireNo,
    E.AdSoyad AS EvSahibi,
    Y.AdSoyad AS Yonetici,
    G.GelirTuru,
    G.Tutar,
    G.GelirTarihi,
    G.TahsilatDurumu
FROM Gelirler AS G
INNER JOIN Daireler AS D
    ON G.DaireID = D.DaireID
INNER JOIN EvSahipleri AS E
    ON D.EvSahibiID = E.EvSahibiID
INNER JOIN YonetimBirimi AS Y
    ON G.YonetimBirimiID = Y.YonetimBirimiID
ORDER BY G.GelirTarihi DESC;
GO

-- 3. Tahsil edilen toplam tutarı hesapla.
SELECT
    SUM(Tutar) AS TahsilEdilenToplam
FROM Gelirler
WHERE TahsilatDurumu = N'Ödendi';
GO

-- 4. Daire bazında bekleyen ödemeleri hesapla.
SELECT
    D.DaireNo,
    SUM(G.Tutar) AS BekleyenToplam
FROM Gelirler AS G
INNER JOIN Daireler AS D
    ON G.DaireID = D.DaireID
WHERE G.TahsilatDurumu = N'Bekliyor'
GROUP BY D.DaireNo
ORDER BY D.DaireNo;
GO

-- 5. Gelir türüne göre toplamları göster.
SELECT
    GelirTuru,
    SUM(Tutar) AS ToplamTutar,
    COUNT(*) AS KayitSayisi
FROM Gelirler
GROUP BY GelirTuru;
GO

-- 6. Belirli tarih aralığındaki gelirleri getir.
SELECT *
FROM Gelirler
WHERE GelirTarihi >= '2026-01-01'
  AND GelirTarihi < '2026-02-01'
ORDER BY GelirTarihi;
GO
