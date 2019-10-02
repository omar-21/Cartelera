//
//  ViewController.swift
//  Cartelera
//
//  Created by 2020-1 on 9/18/19.
//  Copyright © 2019 Omar Rios. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {
   
    @IBOutlet weak var coleccion: UICollectionView!
    @IBOutlet weak var cartbutton: UIButton!
    
    
    var carrito: Carrito = Carrito(compras: [Comprados](), numTrans: 0)
    
    
    var cine: [Peliculas] = [
        Peliculas(nombre:"It 2", foto:"it", precioA: 80, precioN: 0,
                  screenings: [Funciones(hora: 9, sala: 13, disp: 23), Funciones(hora: 12, sala: 12, disp: 19), Funciones(hora: 15, sala: 3, disp: 12), Funciones(hora: 18, sala: 4, disp: 6), Funciones(hora: 21, sala: 7, disp: 1), Funciones(hora: 24, sala: 5, disp: 0)]),
        
        Peliculas(nombre:"End Game", foto:"eg", precioA: 100, precioN: 75,
                  screenings: [Funciones(hora: 9, sala: 1, disp: 12), Funciones(hora: 12, sala: 1, disp: 9), Funciones(hora: 15, sala: 12, disp: 7), Funciones(hora: 18, sala: 7, disp: 4), Funciones(hora: 21, sala: 16, disp: 0), Funciones(hora: 24, sala: 17, disp: 15)]),
        
        Peliculas(nombre:"Joker", foto:"joker", precioA: 86, precioN: 0,
                  screenings: [Funciones(hora: 9, sala: 23, disp: 12), Funciones(hora: 12, sala: 5, disp: 9), Funciones(hora: 15, sala: 8, disp: 7), Funciones(hora: 18, sala: 8, disp: 4), Funciones(hora: 21, sala: 12, disp: 0), Funciones(hora: 24, sala: 2, disp: 15)]),
        
        Peliculas(nombre:"Star Wars IX", foto:"sw", precioA: 86, precioN: 60,
                  screenings: [Funciones(hora: 9, sala: 23, disp: 12), Funciones(hora: 12, sala: 5, disp: 9), Funciones(hora: 15, sala: 8, disp: 7), Funciones(hora: 18, sala: 8, disp: 4), Funciones(hora: 21, sala: 12, disp: 0), Funciones(hora: 24, sala: 2, disp: 15)]),
        
        Peliculas(nombre:"Yesterday", foto: "yesterday", precioA: 75, precioN: 40,
                  screenings: [Funciones(hora: 9, sala: 2, disp: 3), Funciones(hora: 12, sala: 18, disp: 23), Funciones(hora: 15, sala: 1, disp: 0), Funciones(hora: 18, sala: 8, disp: 27), Funciones(hora: 21, sala: 21, disp: 33), Funciones(hora: 24, sala: 9, disp: 45)]),
        
        Peliculas(nombre:"Toy Story 4", foto:"ts", precioA: 86, precioN: 60,
                  screenings: [Funciones(hora: 9, sala: 23, disp: 12), Funciones(hora: 12, sala: 5, disp: 9), Funciones(hora: 15, sala: 8, disp: 7), Funciones(hora: 18, sala: 8, disp: 4), Funciones(hora: 21, sala: 12, disp: 0), Funciones(hora: 24, sala: 2, disp: 15)])
    ]
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .init(patternImage: UIImage(named: "bk1")!)
        
        coleccion.backgroundColor = .init(patternImage: UIImage(named: "bk1")!)
        cartbutton.layer.cornerRadius = 40
        
        
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cine.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cuadrito", for: indexPath) as! PelsCollectionViewCell
        
        cell.nombre.text = cine[indexPath.item].nombre
        cell.foto.image = UIImage(named: cine[indexPath.item].foto)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        if segue.identifier == "cart"{
            let cartView = segue.destination as! CartViewController
            cartView.comprado = carrito
        
            
        }else{
            let secondView = segue.destination as! SecondViewController
            let myIndexPath = coleccion.indexPathsForSelectedItems
            secondView.pelicula = cine[myIndexPath!.first!.item]
        }
    
    
    }

}
