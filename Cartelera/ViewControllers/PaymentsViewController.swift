//
//  PaymentsViewController.swift
//  Cartelera
//
//  Created by Omar on 9/27/19.
//  Copyright © 2019 Omar Rios. All rights reserved.
//

import UIKit

class PaymentsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    

    @IBOutlet weak var tabla: UITableView!
    @IBOutlet weak var finboton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .init(patternImage: UIImage(named: "bk1")!)
        tabla.backgroundColor = .clear
        tabla.rowHeight = 100
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celdita", for: indexPath) as! PaymentsTableViewCell
        cell.imagen.image = UIImage(named: "icons8-ticket-100")
        cell.nombre.text = "Tarjeta \(indexPath.row+1)"
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    
    @IBAction func finalizar(_ sender: UIButton) {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    

}
