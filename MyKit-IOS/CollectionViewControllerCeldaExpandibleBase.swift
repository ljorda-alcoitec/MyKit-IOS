//
//  CollectionViewControllerCeldaExpandibleBase.swift
//  MyKit-IOS
//
//  Created by Lucía Jordá Hernández on 4/7/16.
//  Copyright © 2016 Lucía Jordá Hernández. All rights reserved.
//

import UIKit

class CollectionViewControllerCeldaExpandibleBase: NavigationDrawerCollectionViewControllerBase {

    var indexPathExpandido: NSIndexPath!;
    
    func esCeldaExpandida(indexPath: NSIndexPath) -> Bool{
        if self.indexPathExpandido == nil {
            return false;
        }
        return self.indexPathExpandido == indexPath;
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        if self.esCeldaExpandida(indexPath) {
            return self.getSizeCeldaExpandida(indexPath);
        }
        return self.getSizeCeldaContraida(indexPath);
    }
    
    func getSizeCeldaContraida(indexPath: NSIndexPath) -> CGSize{
        return CGSizeMake(333.0, 110.0);
    }
    
    func getSizeCeldaExpandida(indexPath: NSIndexPath) -> CGSize{
        return CGSizeMake(333.0, 357.0);
    }
    
    
    @IBAction func eventExpandirCelda(sender: AnyObject) {
        let position: CGPoint = sender.convertPoint(CGPointZero, toView: self.collectionView);
        if let indexPath = self.collectionView?.indexPathForItemAtPoint(position)
        {
            
            var indexPathAContraer: NSIndexPath!;
            if self.indexPathExpandido != nil {
                indexPathAContraer = self.indexPathExpandido;
            }
            self.indexPathExpandido = indexPath;
            
            if indexPathAContraer != nil {
                self.collectionView?.reloadItemsAtIndexPaths([indexPathAContraer, indexPath]);
                return;
            }
            self.collectionView?.reloadItemsAtIndexPaths([indexPath]);
        }
    }
}
