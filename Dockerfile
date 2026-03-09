# 1. AŞAMA: Derleme (Build) Ortamı
# Uygulamayı derlemek için içinde .NET 8 SDK (yazılım geliştirme kiti) olan ağır imajı kullanıyoruz.
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Önce sadece proje dosyasını kopyalayıp bağımlılıkları indiriyoruz (Docker önbelleğini verimli kullanmak için)
COPY ["App/BasicApp.csproj", "App/"]
RUN dotnet restore "App/BasicApp.csproj"

# Şimdi tüm C# kodlarını kopyalayıp projeyi yayına (Release) hazır hale getiriyoruz
COPY ["App/", "App/"]
WORKDIR "/src/App"
RUN dotnet publish "BasicApp.csproj" -c Release -o /app/publish /p:UseAppHost=false

# 2. AŞAMA: Çalıştırma (Runtime) Ortamı
# Uygulamayı çalıştırmak için sadece .NET 8 Runtime (çalışma zamanı) olan çok daha hafif bir imaj kullanıyoruz.
FROM mcr.microsoft.com/dotnet/runtime:8.0 AS final
WORKDIR /app

# İlk aşamada derlenen hazır dosyaları, bu hafif imajın içine kopyalıyoruz
COPY --from=build /app/publish .

# Konteyner ayağa kalktığında çalıştırılacak nihai komut
ENTRYPOINT ["dotnet", "BasicApp.dll"]