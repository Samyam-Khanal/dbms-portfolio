CREATE SCHEMA media;
CREATE TABLE media.title (
    id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name text NOT NULL CHECK (btrim(name) <> ''),
    release_year integer NOT NULL CHECK (release_year BETWEEN 1888 AND 2200),
    kind text NOT NULL CHECK (kind IN ('film', 'series')),
    UNIQUE (name, release_year, kind)
);
CREATE TABLE media.genre (
    id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name text NOT NULL UNIQUE
);
CREATE TABLE media.title_genre (
    title_id bigint REFERENCES media.title(id),
    genre_id bigint REFERENCES media.genre(id),
    PRIMARY KEY (title_id, genre_id)
);
CREATE TABLE media.watch_log (
    id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title_id bigint NOT NULL REFERENCES media.title(id),
    watched_on date NOT NULL,
    rating integer CHECK (rating BETWEEN 1 AND 5),
    notes text
);
CREATE INDEX watch_log_title_idx ON media.watch_log(title_id);
