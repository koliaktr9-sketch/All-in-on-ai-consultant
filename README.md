# All-in-One AI Consultant

Advanced full-stack starter for a multi-consultant AI SaaS platform.

## Architecture
- **Web:** Next.js App Router, TypeScript, Tailwind CSS.
- **API:** FastAPI, SQLAlchemy 2 async, Pydantic settings, JWT bearer auth.
- **Data:** PostgreSQL + pgvector extension; Redis for rate-limit/cache integration.
- **AI:** Provider abstraction (OpenAI-compatible + Gemini adapter placeholder), consultant-specific system instructions, streaming endpoint.
- **Ops:** Docker Compose for local PostgreSQL/Redis/API/web.

```text
Browser -> Next.js -> FastAPI -> Auth/RBAC -> Consultant Router -> LLM Provider
                                  |                  |
                                  v                  v
                             PostgreSQL <--- RAG/pgvector
                                  |
                                Redis
```

## Quick start
1. Copy `.env.example` to `.env` and set `JWT_SECRET`, `DATABASE_URL`, and an LLM key.
2. Run `docker compose up --build`.
3. API docs: http://localhost:8000/docs
4. Web: http://localhost:3000

For running without Docker:
- API: `cd backend && python -m venv .venv && source .venv/bin/activate && pip install -r requirements.txt && uvicorn app.main:app --reload`
- Web: `cd frontend && npm install && npm run dev`

## Implemented in this starter
- Registration/login/current-user endpoints with bcrypt password hashing and JWT.
- SQLAlchemy models for users, roles, consultants, conversations, messages, plans, subscriptions, payments, usage and audit logs.
- Consultant modes and specialized prompts.
- Provider interface and OpenAI chat adapter.
- Authenticated conversation CRUD and chat/stream routes.
- Upload endpoint with size/type checks (local storage starter; replace with private object storage in production).
- Admin-only analytics/settings endpoints.
- Responsive Next.js landing/dashboard/chat/admin starter UI.
- Docker setup, environment template and basic tests.

## Production work required before launch
This is a runnable foundation, not a certified production deployment. Configure HTTPS, managed secrets, object storage malware scanning, email verification/password reset, OAuth provider credentials, migrations/backup automation, observability, billing provider webhooks, payment signature verification, moderation, retention policies, and load/security testing. Payment routes intentionally do not mark payments paid without a verified provider webhook. Do not expose provider API keys in the browser.

## Security notes
- Set a long random `JWT_SECRET`.
- Use a private network for PostgreSQL/Redis in production.
- Add strict CORS origins and HTTPS.
- Enforce per-user quotas in Redis/database before production.
- Admin routes require the `admin` role.
- Uploaded files are private and never served as public static assets.
- Medical/legal/financial content is informational only; consult qualified professionals.
