// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.26.0

package database

import (
	"database/sql"
	"time"

	"github.com/google/uuid"
)

type JobApplication struct {
	ID              uuid.UUID
	UserID          uuid.UUID
	CompanyName     string
	JobTitle        string
	ApplicationDate time.Time
	Link            sql.NullString
}

type User struct {
	ID       uuid.UUID
	Name     string
	Password string
}
