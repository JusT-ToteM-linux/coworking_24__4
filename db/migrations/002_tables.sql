-- Здание
CREATE TABLE locations (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    parent_id REFERENCES locations(id) ON DELETE CASCADE,
    name TEXT NOT NULL,
    kind location_kind NOT NULL,
    CHECK((kind = 'building') = (parent_id IS NULL)),
    UNIQUE NULLS NOT DISTINCT (parent_id, name)
);

CREATE TABLE users (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    email email_address NOT NULL,
    full_name TEXT NOT NULL CHECK(length(trim(full_name)) > 0),
    password_hash TEXT NOT NULL,
    role user_role NOT NULL default 'user',
    created_at TIMESTAMPZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPZ NOT NULL DEFAULT now()
);

CREATE UNIQUE INDEX users_email_uq ON users (lower(email::text))