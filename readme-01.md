# DevOps Infrastructure & CI/CD Test Project

## Amaç
Bu proje, GitHub self-hosted runner entegrasyonunu test etmek ve temel bir RabbitMQ mesajlaşma altyapısını ayağa kaldırmak için oluşturulmuştur.

## İçerik
1. **.NET 8 Docker İmaj Testi:** Eklenen basit bir konsol uygulaması (`Forrest Gump is running` çıktısı verir) runner (forrest gump) üzerinden derlenir.
2. **RabbitMQ Altyapısı:** Diğer servislerin haberleşebilmesi için mesaj kuyruğu yapılandırılmıştır.

## Kullanılan Portlar (RabbitMQ)
- `5672`: AMQP (Servislerin mesaj kuyruğuna veri yazıp/okuduğu port)
- `15672`: Management UI (Tarayıcı üzerinden yönetim paneli portu)

## Çalıştırma (Lokal veya Sunucu)
Tüm mimariyi ayağa kaldırmak için projenin ana dizininde şu komutu çalıştırmanız yeterlidir:
`docker-compose up --build -d`