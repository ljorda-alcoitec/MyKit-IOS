//
//  AppDelegate.swift
//  MyKit-IOS
//
//  Created by Lucía Jordá Hernández on 22/6/16.
//  Copyright © 2016 Lucía Jordá Hernández. All rights reserved.
//

import UIKit
import DrawerController;

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var centerContainer: DrawerController?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) ->  Bool {let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil);
        
        let centerViewController = mainStoryboard.instantiateViewControllerWithIdentifier("VCNotificacion") as! VCNotificacion;
        
        let menuViewController = mainStoryboard.instantiateViewControllerWithIdentifier("VCSlideOutMenu") as! VCSlideOutMenu;
        
        menuViewController.controladorAperturaFormularioSegunOpcionMenu = centerViewController;
        
        
        let menuSideNav = UINavigationController(rootViewController: menuViewController);
        let centerNav = UINavigationController(rootViewController: centerViewController);
        
        centerContainer = DrawerController(centerViewController: centerNav, leftDrawerViewController: menuSideNav);
        
        self.centerContainer!.openDrawerGestureModeMask = OpenDrawerGestureMode.PanningCenterView;
        self.centerContainer!.closeDrawerGestureModeMask = CloseDrawerGestureMode.PanningCenterView;
        
        window!.rootViewController = centerContainer;
        window!.makeKeyAndVisible();
        
        ControladorVesiones.comprobarVersion();
        
        return true
    }
    
    func cerrarMenuDesplegableIzquierdo(){
        self.centerContainer!.toggleDrawerSide(DrawerSide.Left, animated: true, completion: nil);
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

