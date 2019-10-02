//
//  SecondViewController.swift
//  Cartelera
//
//  Created by Omar on 9/13/19.
//  Copyright © 2019 Omar Rios. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var tabla: UITableView!
    
    
    var pelicula: Peliculas!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .init(patternImage: UIImage(named: "bk1")!)
        
        tabla.backgroundColor = .clear
        
        poster.image = UIImage(named: pelicula.foto)
        nombre.text = pelicula.nombre
       
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pelicula.screenings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! HorarioTableViewCell
        cell.backgroundColor = .clear
        cell.hora.text = "\(pelicula.screenings[indexPath.row].hora):00"
       
        if pelicula.screenings[indexPath.row].disp == 0 {
            cell.asientos.text = "Sala llena"
            cell.isUserInteractionEnabled = false
            cell.userInteractionEnabledWhileDragging = true
            cell.backgroundColor = .init(white: 1, alpha: 0.5)
            
        } else {
            cell.asientos.text = "Asientos: \(pelicula.screenings[indexPath.row].disp)"
        }
        
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let thirdView = segue.destination as! ThirdViewController
        let myIndexPath = tabla.indexPathForSelectedRow
        thirdView.pelicula = pelicula
        thirdView.screening = myIndexPath?.row
        
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
