//
//  ShoppingCart.swift
//  Cartelera
//
//  Created by Omar on 9/27/19.
//  Copyright © 2019 Omar Rios. All rights reserved.
//

import UIKit

class Carrito{
    var compras: [Comprados]
    var numTrans: Int
    
    init(compras: [Comprados], numTrans: Int) {
        self.compras = compras
        self.numTrans = numTrans
    }
    
    func agregarCompra(compra: Comprados){
        numTrans = numTrans + 1
        compras.append(compra)
    }
    
    func total() -> Int {
        var dineros = 0
        for compra in compras {
            dineros = dineros + compra.precio
        }
        return dineros
    }
    
    func vacio() -> Int {
        if compras.isEmpty == true {
            return 0
        } else {
            return compras.count
        }
    }
    
}
