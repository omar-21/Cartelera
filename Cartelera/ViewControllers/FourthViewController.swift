//
//  FourthViewController.swift
//  Cartelera
//
//  Created by Omar on 9/13/19.
//  Copyright © 2019 Omar Rios. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {

    var pelicula: Peliculas!
    var screening: Int!
    var boletos: Int!
    var precio: Int!
    
    
    
    @IBOutlet weak var fotoFin: UIImageView!
    @IBOutlet weak var nombreF: UILabel!
    @IBOutlet weak var horarioF: UILabel!
    @IBOutlet weak var numbolF: UILabel!
    @IBOutlet weak var carrito: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .init(patternImage: UIImage(named: "bk1")!)
        carrito.layer.cornerRadius = 40
        fotoFin.image = UIImage(named: pelicula.foto)
        nombreF.text = pelicula.nombre
        horarioF.text = "\(pelicula.screenings[screening].hora):00"
        if boletos == 1 {
            numbolF.text = "\(String(boletos)) boleto"
        } else {
        numbolF.text = "\(String(boletos)) boletos"
        }
        
    }
    
    @IBAction func falso(_ sender: UIButton) {
        let falso = UIAlertController(title: "Ingrese desde la pantalla de inicio", message: nil, preferredStyle: .alert)
        falso.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(falso, animated: true, completion: nil)
    }
    
    
    
    @IBAction func inicio(_ sender: UIButton) {
        let comprado: Comprados = Comprados(pelicula: pelicula, screen: screening, boletos: boletos, precio: precio)
        let firstView = presentingViewController?.presentingViewController?.presentingViewController as? ViewController
        firstView!.carrito.agregarCompra(compra: comprado)
        
        self.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
       
        
            }
    
    
   
    

        
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
