//
//  VCSlideOutMenu.swift
//  MyKit-IOS
//
//  Created by Lucía Jordá Hernández on 22/6/16.
//  Copyright © 2016 Lucía Jordá Hernández. All rights reserved.
//

import UIKit

class VCSlideOutMenu: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tablaSlideOutMenu: UITableView!
    
    var controladorAperturaFormularioSegunOpcionMenu:ControladorAperturaFormularioSegunOpcionMenu? = nil;
    
    var opcionesMenuFlotante = ["Notificacion",
                                "Medicamentos"];
    
    var iconosMenuFlotante = ["Notificacion",
                              "Pastilla"];
   
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return opcionesMenuFlotante.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: TVCellSlideOutMenu = tableView.dequeueReusableCellWithIdentifier("celdaOpcionMenu", forIndexPath: indexPath) as! TVCellSlideOutMenu
        
        cell.opcionMenu = OpcionMenu(texto: opcionesMenuFlotante[indexPath.row], nombreImagen: iconosMenuFlotante[indexPath.row]);
        
        return cell;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.controladorAperturaFormularioSegunOpcionMenu!.openMenuOption(indexPath.row);
    }
    
}
