// =====================================================
// 1. CONSTRAINTS
// =====================================================

CREATE CONSTRAINT user_id IF NOT EXISTS
FOR (u:User)
REQUIRE u.userId IS UNIQUE;

CREATE CONSTRAINT movie_id IF NOT EXISTS
FOR (m:Movie)
REQUIRE m.movieId IS UNIQUE;

CREATE CONSTRAINT series_id IF NOT EXISTS
FOR (s:Series)
REQUIRE s.seriesId IS UNIQUE;

CREATE CONSTRAINT actor_id IF NOT EXISTS
FOR (a:Actor)
REQUIRE a.actorId IS UNIQUE;

CREATE CONSTRAINT director_id IF NOT EXISTS
FOR (d:Director)
REQUIRE d.directorId IS UNIQUE;

CREATE CONSTRAINT genre_name IF NOT EXISTS
FOR (g:Genre)
REQUIRE g.name IS UNIQUE;


// =====================================================
// 2. GÊNEROS
// =====================================================

MERGE (:Genre {name: "Sci-Fi"});
MERGE (:Genre {name: "Action"});
MERGE (:Genre {name: "Drama"});
MERGE (:Genre {name: "Comedy"});
MERGE (:Genre {name: "Fantasy"});
MERGE (:Genre {name: "Crime"});
MERGE (:Genre {name: "Animation"});
MERGE (:Genre {name: "Family"});
MERGE (:Genre {name: "Superhero"});
MERGE (:Genre {name: "Thriller"});


// =====================================================
// 3. ATORES
// =====================================================

MERGE (:Actor {actorId: "a1", name: "Leonardo DiCaprio"});
MERGE (:Actor {actorId: "a2", name: "Joseph Gordon-Levitt"});
MERGE (:Actor {actorId: "a3", name: "Keanu Reeves"});
MERGE (:Actor {actorId: "a4", name: "Carrie-Anne Moss"});
MERGE (:Actor {actorId: "a5", name: "Matthew McConaughey"});
MERGE (:Actor {actorId: "a6", name: "Anne Hathaway"});
MERGE (:Actor {actorId: "a7", name: "Tom Hanks"});
MERGE (:Actor {actorId: "a8", name: "Tim Allen"});
MERGE (:Actor {actorId: "a9", name: "Robert Downey Jr."});
MERGE (:Actor {actorId: "a10", name: "Chris Evans"});
MERGE (:Actor {actorId: "a11", name: "Millie Bobby Brown"});
MERGE (:Actor {actorId: "a12", name: "David Harbour"});
MERGE (:Actor {actorId: "a13", name: "Bryan Cranston"});
MERGE (:Actor {actorId: "a14", name: "Aaron Paul"});
MERGE (:Actor {actorId: "a15", name: "Henry Cavill"});
MERGE (:Actor {actorId: "a16", name: "Jennifer Aniston"});


// =====================================================
// 4. DIRETORES
// =====================================================

MERGE (:Director {directorId: "d1", name: "Christopher Nolan"});
MERGE (:Director {directorId: "d2", name: "Lana Wachowski"});
MERGE (:Director {directorId: "d3", name: "Lilly Wachowski"});
MERGE (:Director {directorId: "d4", name: "John Lasseter"});
MERGE (:Director {directorId: "d5", name: "Anthony Russo"});
MERGE (:Director {directorId: "d6", name: "Joe Russo"});
MERGE (:Director {directorId: "d7", name: "Matt Duffer"});
MERGE (:Director {directorId: "d8", name: "Ross Duffer"});
MERGE (:Director {directorId: "d9", name: "Vince Gilligan"});
MERGE (:Director {directorId: "d10", name: "Lauren Schmidt Hissrich"});
MERGE (:Director {directorId: "d11", name: "Marta Kauffman"});
MERGE (:Director {directorId: "d12", name: "Todd Phillips"});


// =====================================================
// 5. FILMES
// =====================================================

MERGE (m1:Movie {movieId: "m1", title: "Inception", year: 2010, duration: 148});
MERGE (m2:Movie {movieId: "m2", title: "The Matrix", year: 1999, duration: 136});
MERGE (m3:Movie {movieId: "m3", title: "Interstellar", year: 2014, duration: 169});
MERGE (m4:Movie {movieId: "m4", title: "Toy Story", year: 1995, duration: 81});
MERGE (m5:Movie {movieId: "m5", title: "Avengers: Endgame", year: 2019, duration: 181});
MERGE (m6:Movie {movieId: "m6", title: "Joker", year: 2019, duration: 122});


// =====================================================
// 6. SÉRIES
// =====================================================

MERGE (s1:Series {seriesId:"s1", title:"Stranger Things", startYear:2016, seasons:4});
MERGE (s2:Series {seriesId:"s2", title:"Breaking Bad", startYear:2008, seasons:5});
MERGE (s3:Series {seriesId:"s3", title:"The Witcher", startYear:2019, seasons:3});
MERGE (s4:Series {seriesId:"s4", title:"Friends", startYear:1994, seasons:10});


// =====================================================
// 7. RELACIONAMENTOS IN_GENRE
// =====================================================

// Movies
MATCH (m1:Movie {movieId:"m1"}), (g1:Genre {name:"Sci-Fi"}) MERGE (m1)-[:IN_GENRE]->(g1);
MATCH (m1:Movie {movieId:"m1"}), (g2:Genre {name:"Action"}) MERGE (m1)-[:IN_GENRE]->(g2);

MATCH (m2:Movie {movieId:"m2"}), (g1:Genre {name:"Sci-Fi"}) MERGE (m2)-[:IN_GENRE]->(g1);
MATCH (m2:Movie {movieId:"m2"}), (g2:Genre {name:"Action"}) MERGE (m2)-[:IN_GENRE]->(g2);

MATCH (m3:Movie {movieId:"m3"}), (g1:Genre {name:"Sci-Fi"}) MERGE (m3)-[:IN_GENRE]->(g1);
MATCH (m3:Movie {movieId:"m3"}), (g3:Genre {name:"Drama"}) MERGE (m3)-[:IN_GENRE]->(g3);

MATCH (m4:Movie {movieId:"m4"}), (g4:Genre {name:"Animation"}) MERGE (m4)-[:IN_GENRE]->(g4);
MATCH (m4:Movie {movieId:"m4"}), (g5:Genre {name:"Family"}) MERGE (m4)-[:IN_GENRE]->(g5);

MATCH (m5:Movie {movieId:"m5"}), (g2:Genre {name:"Action"}) MERGE (m5)-[:IN_GENRE]->(g2);
MATCH (m5:Movie {movieId:"m5"}), (g9:Genre {name:"Superhero"}) MERGE (m5)-[:IN_GENRE]->(g9);

MATCH (m6:Movie {movieId:"m6"}), (g10:Genre {name:"Thriller"}) MERGE (m6)-[:IN_GENRE]->(g10);
MATCH (m6:Movie {movieId:"m6"}), (g3:Genre {name:"Drama"}) MERGE (m6)-[:IN_GENRE]->(g3);

// Series
MATCH (s1:Series {seriesId:"s1"}), (g1:Genre {name:"Sci-Fi"}) MERGE (s1)-[:IN_GENRE]->(g1);
MATCH (s1:Series {seriesId:"s1"}), (g3:Genre {name:"Drama"}) MERGE (s1)-[:IN_GENRE]->(g3);

MATCH (s2:Series {seriesId:"s2"}), (g3:Genre {name:"Drama"}) MERGE (s2)-[:IN_GENRE]->(g3);
MATCH (s2:Series {seriesId:"s2"}), (g6:Genre {name:"Crime"}) MERGE (s2)-[:IN_GENRE]->(g6);

MATCH (s3:Series {seriesId:"s3"}), (g7:Genre {name:"Fantasy"}) MERGE (s3)-[:IN_GENRE]->(g7);
MATCH (s3:Series {seriesId:"s3"}), (g2:Genre {name:"Action"}) MERGE (s3)-[:IN_GENRE]->(g2);

MATCH (s4:Series {seriesId:"s4"}), (g8:Genre {name:"Comedy"}) MERGE (s4)-[:IN_GENRE]->(g8);


// =====================================================
// 8. RELACIONAMENTOS ACTED_IN
// =====================================================

MATCH (a1:Actor {actorId:"a1"}), (m1:Movie {movieId:"m1"}) MERGE (a1)-[:ACTED_IN]->(m1);
MATCH (a2:Actor {actorId:"a2"}), (m1:Movie {movieId:"m1"}) MERGE (a2)-[:ACTED_IN]->(m1);

MATCH (a3:Actor {actorId:"a3"}), (m2:Movie {movieId:"m2"}) MERGE (a3)-[:ACTED_IN]->(m2);
MATCH (a4:Actor {actorId:"a4"}), (m2:Movie {movieId:"m2"}) MERGE (a4)-[:ACTED_IN]->(m2);

MATCH (a5:Actor {actorId:"a5"}), (m3:Movie {movieId:"m3"}) MERGE (a5)-[:ACTED_IN]->(m3);
MATCH (a6:Actor {actorId:"a6"}), (m3:Movie {movieId:"m3"}) MERGE (a6)-[:ACTED_IN]->(m3);

MATCH (a7:Actor {actorId:"a7"}), (m4:Movie {movieId:"m4"}) MERGE (a7)-[:ACTED_IN]->(m4);
MATCH (a8:Actor {actorId:"a8"}), (m4:Movie {movieId:"m4"}) MERGE (a8)-[:ACTED_IN]->(m4);

MATCH (a9:Actor {actorId:"a9"}), (m5:Movie {movieId:"m5"}) MERGE (a9)-[:ACTED_IN]->(m5);
MATCH (a10:Actor {actorId:"a10"}), (m5:Movie {movieId:"m5"}) MERGE (a10)-[:ACTED_IN]->(m5);

MATCH (a11:Actor {actorId:"a11"}), (s1:Series {seriesId:"s1"}) MERGE (a11)-[:ACTED_IN]->(s1);
MATCH (a12:Actor {actorId:"a12"}), (s1:Series {seriesId:"s1"}) MERGE (a12)-[:ACTED_IN]->(s1);

MATCH (a13:Actor {actorId:"a13"}), (s2:Series {seriesId:"s2"}) MERGE (a13)-[:ACTED_IN]->(s2);
MATCH (a14:Actor {actorId:"a14"}), (s2:Series {seriesId:"s2"}) MERGE (a14)-[:ACTED_IN]->(s2);

MATCH (a15:Actor {actorId:"a15"}), (s3:Series {seriesId:"s3"}) MERGE (a15)-[:ACTED_IN]->(s3);

MATCH (a16:Actor {actorId:"a16"}), (s4:Series {seriesId:"s4"}) MERGE (a16)-[:ACTED_IN]->(s4);


// =====================================================
// 9. RELACIONAMENTOS DIRECTS
// =====================================================

MATCH (d1:Director {directorId:"d1"}), (m1:Movie {movieId:"m1"}) MERGE (d1)-[:DIRECTS]->(m1);
MATCH (d1:Director {directorId:"d1"}), (m3:Movie {movieId:"m3"}) MERGE (d1)-[:DIRECTS]->(m3);

MATCH (d2:Director {directorId:"d2"}), (m2:Movie {movieId:"m2"}) MERGE (d2)-[:DIRECTS]->(m2);
MATCH (d3:Director {directorId:"d3"}), (m2:Movie {movieId:"m2"}) MERGE (d3)-[:DIRECTS]->(m2);

MATCH (d4:Director {directorId:"d4"}), (m4:Movie {movieId:"m4"}) MERGE (d4)-[:DIRECTS]->(m4);

MATCH (d5:Director {directorId:"d5"}), (m5:Movie {movieId:"m5"}) MERGE (d5)-[:DIRECTS]->(m5);
MATCH (d6:Director {directorId:"d6"}), (m5:Movie {movieId:"m5"}) MERGE (d6)-[:DIRECTS]->(m5);

MATCH (d12:Director {directorId:"d12"}), (m6:Movie {movieId:"m6"}) MERGE (d12)-[:DIRECTS]->(m6);

MATCH (d7:Director {directorId:"d7"}), (s1:Series {seriesId:"s1"}) MERGE (d7)-[:DIRECTS]->(s1);
MATCH (d8:Director {directorId:"d8"}), (s1:Series {seriesId:"s1"}) MERGE (d8)-[:DIRECTS]->(s1);

MATCH (d9:Director {directorId:"d9"}), (s2:Series {seriesId:"s2"}) MERGE (d9)-[:DIRECTS]->(s2);

MATCH (d10:Director {directorId:"d10"}), (s3:Series {seriesId:"s3"}) MERGE (d10)-[:DIRECTS]->(s3);

MATCH (d11:Director {directorId:"d11"}), (s4:Series {seriesId:"s4"}) MERGE (d11)-[:DIRECTS]->(s4);


// =====================================================
// 10. USUÁRIOS
// =====================================================

MERGE (u1:User  {userId:"u1", name:"Alice",    country:"BR", age:22});
MERGE (u2:User  {userId:"u2", name:"Bruno",    country:"BR", age:25});
MERGE (u3:User  {userId:"u3", name:"Carla",    country:"BR", age:19});
MERGE (u4:User  {userId:"u4", name:"Diego",    country:"BR", age:30});
MERGE (u5:User  {userId:"u5", name:"Eduarda",  country:"BR", age:27});
MERGE (u6:User  {userId:"u6", name:"Felipe",   country:"BR", age:35});
MERGE (u7:User  {userId:"u7", name:"Giovana",  country:"BR", age:24});
MERGE (u8:User  {userId:"u8", name:"Henrique", country:"BR", age:21});
MERGE (u9:User  {userId:"u9", name:"Isabela",  country:"BR", age:26});
MERGE (u10:User {userId:"u10", name:"João",    country:"BR", age:29});


// =====================================================
// 11. RELACIONAMENTOS WATCHED
// =====================================================

// Alice
MATCH (u1:User {userId:"u1"}), (m1:Movie {movieId:"m1"})
MERGE (u1)-[:WATCHED {rating:5, watchedAt:date("2025-11-01")}]->(m1);

MATCH (u1:User {userId:"u1"}), (s1:Series {seriesId:"s1"})
MERGE (u1)-[:WATCHED {rating:4, watchedAt:date("2025-11-05")}]->(s1);

// Bruno
MATCH (u2:User {userId:"u2"}), (m2:Movie {movieId:"m2"})
MERGE (u2)-[:WATCHED {rating:5, watchedAt:date("2025-10-20")}]->(m2);

MATCH (u2:User {userId:"u2"}), (s2:Series {seriesId:"s2"})
MERGE (u2)-[:WATCHED {rating:5, watchedAt:date("2025-09-15")}]->(s2);

// Carla
MATCH (u3:User {userId:"u3"}), (m3:Movie {movieId:"m3"})
MERGE (u3)-[:WATCHED {rating:4, watchedAt:date("2025-08-10")}]->(m3);

// Diego
MATCH (u4:User {userId:"u4"}), (m4:Movie {movieId:"m4"})
MERGE (u4)-[:WATCHED {rating:3, watchedAt:date("2025-07-01")}]->(m4);

MATCH (u4:User {userId:"u4"}), (s3:Series {seriesId:"s3"})
MERGE (u4)-[:WATCHED {rating:4, watchedAt:date("2025-10-02")}]->(s3);

// Eduarda
MATCH (u5:User {userId:"u5"}), (m5:Movie {movieId:"m5"})
MERGE (u5)-[:WATCHED {rating:5, watchedAt:date("2025-05-15")}]->(m5);

// Felipe
MATCH (u6:User {userId:"u6"}), (m6:Movie {movieId:"m6"})
MERGE (u6)-[:WATCHED {rating:4, watchedAt:date("2025-06-18")}]->(m6);

// Giovana
MATCH (u7:User {userId:"u7"}), (s4:Series {seriesId:"s4"})
MERGE (u7)-[:WATCHED {rating:5, watchedAt:date("2025-03-10")}]->(s4);

// Henrique
MATCH (u8:User {userId:"u8"}), (m1:Movie {movieId:"m1"})
MERGE (u8)-[:WATCHED {rating:4, watchedAt:date("2025-02-20")}]->(m1);

// Isabela
MATCH (u9:User {userId:"u9"}), (s1:Series {seriesId:"s1"})
MERGE (u9)-[:WATCHED {rating:5, watchedAt:date("2025-01-11")}]->(s1);

// João
MATCH (u10:User {userId:"u10"}), (m2:Movie {movieId:"m2"})
MERGE (u10)-[:WATCHED {rating:5, watchedAt:date("2025-04-09")}]->(m2);
