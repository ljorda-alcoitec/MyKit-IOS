//
//  TVCellMedicamento.swift
//  MyKit-IOS
//
//  Created by Lucía Jordá Hernández on 23/6/16.
//  Copyright © 2016 Lucía Jordá Hernández. All rights reserved.
//

import UIKit

class TVCellMedicamento: UITableViewCell {

    @IBOutlet weak var lblMedicamento: UILabel!;
    @IBOutlet weak var imgFormato: UIImageView!;
    
    var datosMedicamento: Medicamento?{
        
        didSet{
            let codigoImagen = TipoMedicamento.tiposMedicamento[(datosMedicamento?.tipo)!]!;
            self.imgFormato.image = UIImage(named: codigoImagen);
            self.lblMedicamento.text = datosMedicamento?.nombre;
        }
    }
}
