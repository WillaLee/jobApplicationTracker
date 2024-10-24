-- name: CreateUser :one
INSERT INTO users (name, password)
VALUES ($1, $2)
RETURNING *;

-- name: GetUserIdByName :one
SELECT id 
FROM users
WHERE name = $1
LIMIT 1;