//
//  PaymentsTableViewCell.swift
//  Cartelera
//
//  Created by Omar on 9/27/19.
//  Copyright © 2019 Omar Rios. All rights reserved.
//

import UIKit

class PaymentsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var nombre: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
