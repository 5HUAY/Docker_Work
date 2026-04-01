## Student
- Name: Yuzhankov Artem
- Group: 232/2

## Практичне заняття №2 — NestJS + PostgreSQL + Redis
 
## Структура репозиторію
```
.
├── src/              	# NestJS source code
├── Dockerfile
├── docker-compose.yml
├── .env.example      	# шаблон змінних оточення
└── README.md
```
 
## Запуск проекту
```bash
cp .env.example .env   # налаштувати значення
docker compose up --build
```
## Перевірка сервісів
```text
<вивід docker compose ps>
NAME                     IMAGE                COMMAND                  SERVICE    CREATED        STATUS                  PORTS
docker_work-app-1        docker_work-app      "docker-entrypoint.s…"   app        16 hours ago   Up 16 hours             0.0.0.0:3000->3000/tcp, [::]:3000->3000/tcp
docker_work-postgres-1   postgres:16-alpine   "docker-entrypoint.s…"   postgres   16 hours ago   Up 16 hours (healthy)   0.0.0.0:5432->5432/tcp, [::]:5432->5432/tcp
docker_work-redis-1      redis:7-alpine       "docker-entrypoint.s…"   redis      16 hours ago   Up 16 hours (healthy)   0.0.0.0:6379->6379/tcp, [::]:6379->6379/tcp
 
## Перевірка PostgreSQL
```text
<вивід docker compose exec postgres psql -U nestuser -d nestdb -c '\l'>
                                                      List of databases
   Name    |  Owner   | Encoding | Locale Provider |  Collate   |   Ctype    | ICU Locale | ICU Rules |   Access privileges
-----------+----------+----------+-----------------+------------+------------+------------+-----------+-----------------------
 nestdb    | nestuser | UTF8     | libc            | en_US.utf8 | en_US.utf8 |            |           |
 postgres  | nestuser | UTF8     | libc            | en_US.utf8 | en_US.utf8 |            |           |
 template0 | nestuser | UTF8     | libc            | en_US.utf8 | en_US.utf8 |            |           | =c/nestuser          +
           |          |          |                 |            |            |            |           | nestuser=CTc/nestuser
 template1 | nestuser | UTF8     | libc            | en_US.utf8 | en_US.utf8 |            |           | =c/nestuser          +
           |          |          |                 |            |            |            |           | nestuser=CTc/nestuser
(4 rows)
 
## Перевірка Redis
```text
<вивід docker compose exec redis redis-cli ping>
PONG
 
## Перевірка застосунку
```text
<вивід curl http://localhost:3000>
![alt text](image.png)

## Логи NestJS (фрагмент)
```text
<вивід docker compose logs app (ключові рядки запуску)>
[3:29:07 PM] Starting compilation in watch mode...
app-1  |
app-1  | [3:29:10 PM] Found 0 errors. Watching for file changes.
app-1  |
app-1  | [Nest] 34  - 03/31/2026, 3:29:11 PM     LOG [NestFactory] Starting Nest application...
app-1  | [Nest] 34  - 03/31/2026, 3:29:11 PM     LOG [InstanceLoader] TypeOrmModule dependencies initialized +37ms
app-1  | [Nest] 34  - 03/31/2026, 3:29:11 PM     LOG [InstanceLoader] ConfigHostModule dependencies initialized +1ms
app-1  | [Nest] 34  - 03/31/2026, 3:29:11 PM     LOG [InstanceLoader] AppModule dependencies initialized +0ms
app-1  | [Nest] 34  - 03/31/2026, 3:29:11 PM     LOG [InstanceLoader] ConfigModule dependencies initialized +0ms
app-1  | [Nest] 34  - 03/31/2026, 3:29:11 PM     LOG [InstanceLoader] CacheModule dependencies initialized +7ms
app-1  | [Nest] 34  - 03/31/2026, 3:29:11 PM     LOG [InstanceLoader] TypeOrmCoreModule dependencies initialized +29ms
app-1  | [Nest] 34  - 03/31/2026, 3:29:11 PM     LOG [RoutesResolver] AppController {/}: +3ms
app-1  | [Nest] 34  - 03/31/2026, 3:29:11 PM     LOG [RouterExplorer] Mapped {/, GET} route +2ms
app-1  | [Nest] 34  - 03/31/2026, 3:29:11 PM     LOG [NestApplication] Nest application successfully started +1ms
