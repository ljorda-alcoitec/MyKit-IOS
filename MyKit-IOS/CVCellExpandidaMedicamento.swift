//
//  CVCellExpandidaMedicamento.swift
//  MyKit-IOS
//
//  Created by Lucía Jordá Hernández on 7/7/16.
//  Copyright © 2016 Lucía Jordá Hernández. All rights reserved.
//

import UIKit

class CVCellExpandidaMedicamento: UICollectionViewCell {
    
    @IBOutlet weak var lblMedicamento: UILabel!
    @IBOutlet weak var imgExistencias: UIImageView!
    @IBOutlet weak var collectionViewDetalle: UICollectionView!
    
    
    var datosMedicamento: Medicamento?{
        
        didSet{
            self.setFormatoLabel()
            self.lblMedicamento.text = datosMedicamento?.nombre;
            self.imgExistencias.image = UIImage(named: "Existencias");
            self.setFormatoCelda();
            self.setAnimacionCelda();
        }
    }
    
    func setFormatoCelda(){
        self.layer.borderWidth = 2.0;
        self.layer.borderColor = UIColor.blueColor().CGColor;
        self.layer.cornerRadius = 10;
    }
    
    func setAnimacionCelda(){
        self.layer.addAnimation(CATransitionUtils.transicionTransparenteASolido(), forKey: kCATransition);
    }

    func setFormatoLabel(){
        self.lblMedicamento.ajustarTexto();
    }


}
