# Use the official .NET image
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 80

# Build the application
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY ["Financas21.csproj", "./"]
RUN dotnet restore "./Financas21.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "Financas21.csproj" -c Release -o /app/build

# Publish the application
FROM build AS publish
RUN dotnet publish "Financas21.csproj" -c Release -o /app/publish

# Final stage
FROM base AS final
ENV ASPNETCORE_ENVIRONMENT=Development
ENV DefaultConnection=Host=localhost;Port=5432;Database=main;Username=admin;Password=admin
EXPOSE 80
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Financas21.dll"]