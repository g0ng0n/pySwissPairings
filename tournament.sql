-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

-- Revoking connection from multiple users in order to drop the table if EXIST
SELECT
    pg_terminate_backend(pid)
FROM
    pg_stat_activity
WHERE
    -- don't kill my own connection!
    pid <> pg_backend_pid()
    -- don't kill the connections to other databases
    AND datname = 'tournament'
    ;

DROP DATABASE IF EXISTS tournament;
CREATE DATABASE tournament;
\c tournament

CREATE TABLE players (
    id serial,
    name varchar,
    PRIMARY KEY(id)
);


CREATE TABLE matches (
    match_id serial,
    winner_id integer references players(id) ON DELETE CASCADE,
    losser_id integer references players(id) ON DELETE CASCADE,
    primary key(match_id)
);

-- Creates a view of the standings:

Create view Standings AS
select players.id, players.name,
    (Select count(matches.winner_id)
from matches
    Where players.id = matches.winner_id)
AS total_wins,
    (select count(matches.match_id)
FROM matches
    where players.id = matches.winner_id
    or players.id = matches.losser_id)
As total_matches
    from players
Order by total_wins DESC, total_matches DESC