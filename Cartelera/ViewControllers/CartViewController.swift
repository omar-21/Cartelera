//
//  CartViewController.swift
//  Cartelera
//
//  Created by Omar on 9/26/19.
//  Copyright © 2019 Omar Rios. All rights reserved.
//

import UIKit

class CartViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var comprado: Carrito!

    @IBOutlet weak var tabla: UITableView!
    @IBOutlet weak var total: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var t = 0
        view.backgroundColor = .init(patternImage: UIImage(named: "bk1")!)
        tabla.backgroundColor = .clear
        tabla.rowHeight = 135
        for compra in comprado.compras{
            t = t + compra.precio
        }
        total.text = "Total: $\(t).00"
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comprado.numTrans
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! CartTableViewCell
        cell.backgroundColor = .clear
        cell.poster.image = UIImage(named: comprado.compras[indexPath.row].pelicula.foto)
        cell.titulo.text = comprado.compras[indexPath.row].pelicula.nombre
        cell.horario.text = "\(comprado.compras[indexPath.row].sacarHorario()):00  Sala \(comprado.compras[indexPath.row].sacarSala())"
        cell.boletos.text = "\(comprado.compras[indexPath.row].boletos) boletos    $\(comprado.compras[indexPath.row].precio)"
        
        return cell
        
    }
    

    @IBAction func inicio(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
        
    }
    

}
