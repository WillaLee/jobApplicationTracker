-- name: CreateJobApp :one
INSERT INTO job_applications (user_id, company_name, job_title, link)
VALUES ($1, $2, $3, $4)
RETURNING *;

-- name: RemoveJobAppById :exec
DELETE FROM job_applications
WHERE id = $1;

-- name: SearchForJobAppByCompanyName :many
SELECT * 
FROM job_applications
WHERE company_name ILIKE '%' || $1 || '%';

-- name: CountJobAppByDate :one
SELECT COUNT(*) 
FROM job_applications
WHERE application_date = $1;

-- name: CountJobAppByMonth :one
SELECT COUNT(*) 
FROM job_applications
WHERE EXTRACT(YEAR FROM application_date) = $1
AND EXTRACT(MONTH FROM application_date) = $2;

-- name: CountJobAppByUserId :one
SELECT COUNT(*)
FROM job_applications
WHERE user_id = $1;