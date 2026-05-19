/* Evaluación 2 - Elías Pino - PWS */
package com.iplachex.discografia.artistas;

import org.springframework.data.mongodb.repository.MongoRepository;

public interface IArtistaRepository extends MongoRepository<Artista, String> {
}