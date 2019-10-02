//
//  BoletosComprados.swift
//  Cartelera
//
//  Created by Omar on 9/26/19.
//  Copyright © 2019 Omar Rios. All rights reserved.
//

import UIKit

class Comprados {
    
    var pelicula: Peliculas
    var screen: Int
    var boletos: Int
    var precio: Int
    
    
    init(pelicula: Peliculas, screen: Int, boletos: Int, precio: Int) {
        self.pelicula = pelicula
        self.screen = screen
        self.boletos = boletos
        self.precio = precio
        
    }
    
    func sacarHorario() -> Int {
        return pelicula.screenings[screen].hora
    }
    
    func sacarSala() -> Int {
        return pelicula.screenings[screen].sala
    }
    
    func hacerArreglo(inicio: Comprados) -> [Comprados] {
        let compras: [Comprados] = [inicio]
        return compras
    }
    
    
}
