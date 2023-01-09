package com.farm.farm.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.List;

@Entity
public class categoria_entity {

    @Id
    @Getter
    @Setter
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true)
    private Integer idcategoria;
    @Getter
    @Setter
    private String nombre;
    @Getter
    @Setter
    private String descripcion;
    @Getter
    @Setter
    private String portada;
    @Getter
    @Setter
    private Timestamp datacreated;
    @Getter
    @Setter
    private String ruta;
    @Getter
    @Setter
    private Integer status;

    @OneToMany(mappedBy = "cat")
    @Setter@Getter
    @JsonIgnore
    private List<producto_entity> prod;


}
