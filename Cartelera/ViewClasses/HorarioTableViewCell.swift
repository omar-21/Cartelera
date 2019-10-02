//
//  HorarioTableViewCell.swift
//  Cartelera
//
//  Created by Omar on 9/13/19.
//  Copyright © 2019 Omar Rios. All rights reserved.
//

import UIKit

class HorarioTableViewCell: UITableViewCell {
    @IBOutlet weak var hora: UILabel!
    @IBOutlet weak var asientos: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
