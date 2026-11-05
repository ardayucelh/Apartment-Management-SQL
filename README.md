# Apartman Yönetim Sistemi - SQL Server

SQL Server üzerinde apartman yönetimine yönelik örnek ilişkisel veritabanı projesi.

## Kapsam

Veritabanı aşağıdaki temel tabloları içerir:

- **YonetimBirimi:** Apartman yönetimi iletişim ve sorumlu bilgileri
- **EvSahipleri:** Daire sahiplerinin bilgileri
- **Daireler:** Daire numarası, kat, metrekare ve daire sahibi ilişkisi
- **Gelirler:** Aidat ve diğer gelir kayıtları, tutar ve tahsilat durumu

## Dosyalar

- `schema.sql`: Veritabanı ve tabloların oluşturulması
- `sample_data.sql`: Deneme amacıyla hazırlanmış örnek kayıtlar
- `queries.sql`: JOIN, GROUP BY, filtreleme ve toplama örnekleri

## Çalıştırma

1. SQL Server ve SQL Server Management Studio (SSMS) ortamını açın.
2. Önce `schema.sql` dosyasını çalıştırın.
3. Ardından `sample_data.sql` dosyasını çalıştırın.
4. Raporlama örnekleri için `queries.sql` dosyasındaki sorguları çalıştırın.

## Önemli not

Bu depo, önceki çalışmadan konuşmalarda hatırlanan tablo adları (`YonetimBirimi`, `Daireler`, `EvSahipleri`, `Gelirler`) temel alınarak yeniden oluşturulmuş bir örnek projedir. Orijinal SQL dosyaları ve kolon tanımları mevcut olmadığından, şema ve örnek kayıtlar açıklayıcı amaçla yeniden tasarlanmıştır; eski projenin birebir kopyası olduğu iddia edilmez. Örnek kişi ve kayıt bilgileri tamamen temsili veridir.

## Teknolojiler

- Microsoft SQL Server
- T-SQL
- SQL Server Management Studio (SSMS)
