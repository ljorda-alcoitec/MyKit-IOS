//
//  UILabelExtension.swift
//  MyKit-IOS
//
//  Created by Lucía Jordá Hernández on 5/7/16.
//  Copyright © 2016 Lucía Jordá Hernández. All rights reserved.
//

import UIKit

extension UILabel{
   func ajustarTexto(){
        self.numberOfLines = 0;
        self.minimumScaleFactor = 0.5;
        self.adjustsFontSizeToFitWidth = true;
    }
    
    
    static func getAltoUILabelPorSimulacion(anchoLabel: CGFloat, fuente:UIFont, texto: String) -> CGFloat{
        let labelSimulacion:UILabel = UILabel(frame: CGRectMake(0, 0, anchoLabel, CGFloat.max));
        labelSimulacion.font = fuente;
        labelSimulacion.text = texto;
        labelSimulacion.numberOfLines = 0;
        labelSimulacion.lineBreakMode = NSLineBreakMode.ByWordWrapping;
        labelSimulacion.sizeToFit();
        return labelSimulacion.frame.height;
    }
}
