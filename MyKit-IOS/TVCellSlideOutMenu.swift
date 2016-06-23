//
//  TVCellSlideOutMenu.swift
//  MyKit-IOS
//
//  Created by Lucía Jordá Hernández on 22/6/16.
//  Copyright © 2016 Lucía Jordá Hernández. All rights reserved.
//

import UIKit

class TVCellSlideOutMenu: UITableViewCell {

    @IBOutlet weak var lblOpcionMenu: UILabel!;
    @IBOutlet weak var imgOpcionMenu: UIImageView!;
    
    var opcionMenu: OpcionMenu?{
        didSet{
            lblOpcionMenu.text = opcionMenu?.texto;
            imgOpcionMenu.image = UIImage(named: (opcionMenu?.nombreImagen)!);
        }
    }
}
