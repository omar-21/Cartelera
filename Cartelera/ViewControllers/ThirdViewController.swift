//
//  ThirdViewController.swift
//  Cartelera
//
//  Created by Omar on 9/13/19.
//  Copyright © 2019 Omar Rios. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var horario: UILabel!
    @IBOutlet weak var numbolA: UILabel!
    @IBOutlet weak var sliderA: UISlider!
    @IBOutlet weak var precio: UILabel!
    @IBOutlet weak var sliderN: UISlider!
    @IBOutlet weak var numbolN: UILabel!
    @IBOutlet weak var total: UILabel!
    
    var pelicula: Peliculas!
    var screening: Int!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .init(patternImage: UIImage(named: "bk1")!)
        
        if pelicula.precioN == 0 {
            sliderN.isEnabled = false
            sliderN.isHidden = true
            numbolN.isHidden = true
        }
        
        
        poster.image = UIImage(named: pelicula.foto)
        titulo.text = pelicula.nombre
        horario.text = "\(pelicula.screenings[screening].hora):00"
        if pelicula.precioN == 0 {
            precio.text = " Adultos: $\(pelicula.precioA)    Niños: 18+"
        } else {
            precio.text = " Adultos: $\(pelicula.precioA)    Niños: $\(pelicula.precioN)"
        }
        
        
        
    }
    

    @IBAction func boletos(_ sender: UISlider) {
        numbolA.text = "\(Int(sliderA.value)) Adultos"
        total.text = "Total: $\((pelicula.precioN * Int(sliderN.value)) + (Int(sliderA.value) * pelicula.precioA))"
    }
    
    @IBAction func boletosN(_ sender: UISlider) {
        numbolN.text = "\(Int(sliderN.value)) Niños"
        total.text = "Total: $\((pelicula.precioN * Int(sliderN.value)) + (Int(sliderA.value) * pelicula.precioA))"
    }
    
    
    
    @IBAction func check(_ sender: UIButton) {
        let totales = Int(sliderN.value)+Int(sliderA.value)
        
        switch totales {
        case 1...pelicula.screenings[screening].disp:
             pelicula.screenings[screening].disp -= totales
            
        case 0:
            let max = UIAlertController(title: "No ha seleccionado ningún boleto", message: nil, preferredStyle: .alert)
            max.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(max, animated: true, completion: nil)
        default:
            let max = UIAlertController(title: "No hay suficientes asientos", message: "Solo quedan \(pelicula.screenings[screening].disp) asientos disponibles", preferredStyle: .alert)
            max.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(max, animated: true, completion: nil)
        }
        
      
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let fourthView = segue.destination as! FourthViewController
        fourthView.pelicula = pelicula
        fourthView.screening = screening
        fourthView.boletos = Int(sliderA.value) + Int(sliderN.value)
        fourthView.precio = Int(sliderA.value)*(pelicula.precioA) + Int(sliderN.value)*(pelicula.precioN)
    }
    
    @IBAction func cerrar(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
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
