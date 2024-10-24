package main

import (
	"github.com/google/uuid"
	"www.github.com/WillaLee/jobApplicationTracker/internal/database"
)

type User struct {
	ID   uuid.UUID `json:"id"`
	Name string    `json:"name"`
}

func databaseUserToUser(dbUser database.User) User {
	return User{
		ID:   dbUser.ID,
		Name: dbUser.Name,
	}
}
