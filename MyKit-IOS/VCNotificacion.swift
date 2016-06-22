//
//  VCNotificacion.swift
//  MyKit-IOS
//
//  Created by Lucía Jordá Hernández on 22/6/16.
//  Copyright © 2016 Lucía Jordá Hernández. All rights reserved.
//

import UIKit

class VCNotificacion:NavigationDrawerViewControllerBase, ControladorAperturaFormularioSegunOpcionMenu
{
    var identificadoresViewControllers = ["VCNotificacion",
                                          "TVControllerMedicamento"]
    
    func openMenuOption(option: Int){
        self.cargarViewControllerPorIdentificador(identificadoresViewControllers[option]);
    }
}
