//
//  NavigationDrawerTableViewControllerBase.swift
//  MyKit-IOS
//
//  Created by Lucía Jordá Hernández on 22/6/16.
//  Copyright © 2016 Lucía Jordá Hernández. All rights reserved.
//

import UIKit

class NavigationDrawerTableViewControllerBase: UITableViewController {

    func cargarViewControllerPorIdentificador(identificador: String){
        
        let centerViewController = self.storyboard!.instantiateViewControllerWithIdentifier(identificador) as UIViewController;
        
        let centerNavContoller = UINavigationController(rootViewController: centerViewController);
        
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate;
        
        appDelegate.centerContainer!.centerViewController = centerNavContoller;
        mostrarOcultarMenuDesplegable();
    }
    
    @IBAction func btnMostrarMenu(sender: AnyObject) {
        mostrarOcultarMenuDesplegable();
        
    }
    
    func mostrarOcultarMenuDesplegable(){
        
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate;
        appDelegate.cerrarMenuDesplegableIzquierdo();
        
    }
}
