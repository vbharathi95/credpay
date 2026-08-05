# CREDPAY User Service

Spring Boot 3.5.x / Java 21 service exposing user **register** and **login** APIs,
backed by the existing PostgreSQL `credpay` database (`users` table).

## Prerequisites

- Java 21 (`java -version`)
- Maven 3.9+ (`mvn -version`)
- PostgreSQL running locally with the `credpay` database and `users` table
  (created by `../schema.sql`)

## Configure database credentials

Defaults assume `postgres/postgres` on `localhost:5432`. Override via env vars:

```powershell
$env:DB_USERNAME = "postgres"
$env:DB_PASSWORD = "yourpassword"
```

## Run

```powershell
mvn spring-boot:run
```

The service starts on **http://localhost:8080**.

## APIs

### Register
```
POST /api/users/register
Content-Type: application/json

{ "fullName": "Bharath Reddy", "email": "bharath@test.com", "password": "Password123" }
```
Response: `{ "message": "User registered successfully" }`
Duplicate email → `409 { "message": "Email already exists" }`

### Login
```
POST /api/users/login
Content-Type: application/json

{ "email": "bharath@test.com", "password": "Password123" }
```
Response: `{ "message": "Login successful" }`
Wrong email/password → `401 { "message": "Invalid email or password" }`

## Test with curl

```powershell
curl -X POST http://localhost:8080/api/users/register `
  -H "Content-Type: application/json" `
  -d '{"fullName":"Bharath Reddy","email":"bharath@test.com","password":"Password123"}'

curl -X POST http://localhost:8080/api/users/login `
  -H "Content-Type: application/json" `
  -d '{"email":"bharath@test.com","password":"Password123"}'
```

## Notes

- Passwords are hashed with **BCrypt** before being stored in `users.password_hash`.
- `spring.jpa.hibernate.ddl-auto=validate` — the app validates against the existing
  schema and never alters it.
- The sample rows in `schema.sql` use placeholder (non-BCrypt) hashes, so login works
  only for users created through `/api/users/register`.
