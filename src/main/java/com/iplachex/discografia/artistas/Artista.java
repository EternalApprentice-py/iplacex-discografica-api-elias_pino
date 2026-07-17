/* Evaluación 2 - Elías Pino - PWS */
package com.iplachex.discografia.artistas;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;
import java.util.List;

@Document("artistas")
public class Artista {

    @Id
    public String _id;

    @Field("nombre")
    public String nombre;

    @Field("estilos")
    public List<String> estilos;

    @Field("anioFundacion")
    public int anioFundacion;

    @Field("estaActivo")
    public boolean estaActivo;

    @Field("paisOrigen")
    public String paisOrigen;

    @Field("sitioWeb")
    public String sitioWeb;
}