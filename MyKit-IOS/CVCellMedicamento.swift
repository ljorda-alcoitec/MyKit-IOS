//
//  CVCellMedicamento.swift
//  MyKit-IOS
//
//  Created by Lucía Jordá Hernández on 29/6/16.
//  Copyright © 2016 Lucía Jordá Hernández. All rights reserved.
//

import UIKit

class CVCellMedicamento: UICollectionViewCell {
    
    @IBOutlet weak var lblMedicamento: UILabel!
    @IBOutlet weak var lblComposicion: UILabel!;
    @IBOutlet weak var imgFormato: UIImageView!
    @IBOutlet weak var imgExistencias: UIImageView!
    
    
    var datosMedicamento: Medicamento?{
        
        didSet{
            self.setFormatoLabel()
            self.lblMedicamento.text = datosMedicamento?.nombre;
            self.lblComposicion.text = datosMedicamento?.composicion;
            self.setImageTipo();
            self.imgExistencias.image = UIImage(named: "Existencias");
            self.setFormatoCelda();
            self.setAnimacionCelda();
        }
    }
    
    func setImageTipo(){
        let codigoImagen = TipoMedicamento.tiposMedicamento[(datosMedicamento?.tipo)!]!;
        self.imgFormato.image = UIImage(named: codigoImagen);
    }
    
    func setFormatoCelda(){
        self.layer.borderWidth = 2.0;
        self.layer.borderColor = UIColor.redColor().CGColor;
        self.layer.cornerRadius = 10;
    }
    
    func setAnimacionCelda(){
        self.layer.addAnimation(CATransitionUtils.transicionTransparenteASolido(), forKey: kCATransition);
    }
    
    func setFormatoLabel(){
        self.lblMedicamento.ajustarTexto();
        self.lblComposicion.ajustarLabel();
        //self.lblMedicamento.font = UIFont.familyNames().
    }
    
    func getAlto() -> CGFloat{
        return 100;
    }
   
}

