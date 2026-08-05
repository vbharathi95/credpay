# CREDPAY Payment Service

FastAPI service (Python 3.14) that simulates payments against the existing
`credpay` PostgreSQL database. Runs on **port 8000**.

## Folder structure

```
payment-service/
├── requirements.txt
├── README.md
├── .gitignore
└── app/
    ├── __init__.py
    ├── main.py        # FastAPI app + router wiring
    ├── database.py    # engine, SessionLocal, Base, get_db dependency
    ├── models.py      # SQLAlchemy models (users, cards, payments)
    ├── schemas.py     # Pydantic request/response models
    ├── services.py    # business logic (service layer)
    └── routes.py      # API routes
```

## Prerequisites

- Python 3.14 (`python --version`)
- PostgreSQL running locally with the `credpay` database
- The `payments` table must have a `transaction_id` column. If your DB was
  created before that column existed, run the migration once:
  ```powershell
  psql -U postgres -d credpay -f ..\migrations\001_add_transaction_id.sql
  ```

## Install dependencies

```powershell
cd payment-service
python -m venv .venv
.\.venv\Scripts\Activate.ps1
pip install -r requirements.txt
```

## Configure database (optional)

Defaults: `postgres/postgres` @ `localhost:5432/credpay`. Override via env vars:

```powershell
$env:DB_USERNAME = "postgres"
$env:DB_PASSWORD = "yourpassword"
```

## Run locally

```powershell
uvicorn app.main:app --reload --port 8000
```

- Service: http://localhost:8000
- Interactive docs: http://localhost:8000/docs
- Health check: http://localhost:8000/health

## APIs

### Make a payment
```
POST /api/payment/pay
Content-Type: application/json

{ "userId": 3, "cardId": 4, "amount": 2500, "upiId": "bharath@ybl" }
```
Response:
```json
{ "transactionId": "TXN20260624001", "status": "SUCCESS", "amount": 2500 }
```
- User must exist → otherwise `404`.
- Card must exist → otherwise `404`.

### Payment history
```
GET /api/payment/history/{userId}
```
Response:
```json
[ { "transactionId": "TXN20260624001", "amount": 2500, "status": "SUCCESS", "createdAt": "2026-06-24T12:00:00+00:00" } ]
```

## Test with curl

```powershell
curl -X POST http://localhost:8000/api/payment/pay `
  -H "Content-Type: application/json" `
  -d '{"userId":3,"cardId":4,"amount":2500,"upiId":"bharath@ybl"}'

curl http://localhost:8000/api/payment/history/3
```
