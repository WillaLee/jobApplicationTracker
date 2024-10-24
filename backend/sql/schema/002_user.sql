-- +goose Up
CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(100) NOT NULL,
    password VARCHAR(225) NOT NULL
);
-- +goose Down
DROP TABLE users;
