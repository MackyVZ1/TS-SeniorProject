# Stage 1: Build the application
# ใช้ .NET 8 SDK image สำหรับการ build
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build

WORKDIR /src
# คัดลอกไฟล์ .csproj ก่อนเพื่อใช้ประโยชน์จาก Docker Layer Caching
# ซึ่งจะช่วยให้การ restore dependencies ไม่ต้องทำซ้ำหากไฟล์ .csproj ไม่เปลี่ยนแปลง
COPY *.csproj ./

# Restore project dependencies
RUN dotnet restore

# คัดลอกไฟล์ source code ที่เหลือทั้งหมด
COPY . .

# Build the application ในโหมด Release
# และ publish ผลลัพธ์ไปยังโฟลเดอร์ /app/build
RUN dotnet publish -c Release -o /app/build

# Stage 2: Run the application
# ใช้ .NET 8 ASP.NET Runtime image ซึ่งมีขนาดเล็กกว่าและเหมาะสำหรับ Production
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final

# กำหนด Working Directory ภายใน Container
WORKDIR /app

# คัดลอกไฟล์ที่ publish มาจาก Stage 'build'
COPY --from=build /app/build .

# กำหนด Port ที่แอปพลิเคชันจะเปิดรับการเชื่อมต่อ
# สำหรับ ASP.NET Core โดยทั่วไปจะใช้ Port 80 (HTTP) และ 443 (HTTPS)
EXPOSE 80
EXPOSE 443

# กำหนดคำสั่งเริ่มต้นเมื่อ Container ถูกรัน
# "YourAppName.dll" คือชื่อไฟล์ .dll หลักของแอปพลิเคชันของคุณ
# คุณจะต้องเปลี่ยน "YourAppName.dll" ให้ตรงกับชื่อโปรเจกต์ของคุณ (เช่น MyWebApp.dll)
ENTRYPOINT ["dotnet", "backend_net6.dll"]