package com.farm.farm.controller;


import com.farm.farm.entity.pedido_entity;
import com.farm.farm.security.JWTUtil;
import com.farm.farm.service.PedidoService;
import com.farm.farm.utilities.JsonResponseBody;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Optional;

@RestController
@RequestMapping("/pedido")
public class PedidoController {

    @Autowired
    PedidoService pedidoService;

    @Autowired
    JWTUtil  jwtUtil;

    /*public ResponseEntity<JsonResponseBody>getPedidos(@RequestHeader("Authorization") String token){
        if (token.isEmpty() || token.isBlank()){
            return ResponseEntity.status(HttpStatus.FORBIDDEN)
                    .body(new JsonResponseBody(HttpStatus.FORBIDDEN.value(), "Acceso no autorizado"));
        }
        String jwt = token.substring(7);
        String email = jwtUtil.extractUsername(jwt);
        return ResponseEntity.status(HttpStatus.OK)
                .body(new JsonResponseBody(HttpStatus.OK.value(), pedidoService.getPedidosByEmail(email)));
    }
     */

    @GetMapping()
    public ResponseEntity<JsonResponseBody> getAllpedido(){
        return ResponseEntity.status(HttpStatus.OK)
                .body(new JsonResponseBody(HttpStatus.OK.value(), pedidoService.getAllpedido()));
    }
    @PostMapping
    public ResponseEntity<JsonResponseBody> savepedido(@RequestBody pedido_entity data){
        try {
            ArrayList<Object> response = new ArrayList<>();
            response.add(pedidoService.savepedido(data));
            return ResponseEntity.status(HttpStatus.OK)
                    .body(new JsonResponseBody(HttpStatus.OK.value(),response ));
        }catch (Exception e){
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(new JsonResponseBody(HttpStatus.BAD_REQUEST.value(),
                            "Error"));
        }
    }
    @GetMapping(path="/{id}")
    public Optional<pedido_entity> getAttributesById(@PathVariable("id") int id){
        return this.pedidoService.getpedidoById(id);
    }
    @DeleteMapping("/{id}")
    public String deleteAttributeById(@PathVariable("id") int id) {
        boolean ok = this.pedidoService.deletepedidoById(id);
        if (ok) {
            return "Se ha eliminado el pedido con el Id: " + id;
        } else {
            return "Algo ha salido mal, el pedido no ha sido eliminado";
        }
    }



}
