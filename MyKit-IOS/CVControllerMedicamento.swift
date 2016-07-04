//
//  CVControllerMedicamento.swift
//  MyKit-IOS
//
//  Created by Lucía Jordá Hernández on 29/6/16.
//  Copyright © 2016 Lucía Jordá Hernández. All rights reserved.
//

import UIKit

class CVControllerMedicamento: CollectionViewControllerCeldaExpandibleBase {

    var listadoMedicamentos: [Medicamento]!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         self.listadoMedicamentos = MedicamentoDAO.getMedicamentos();
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1;
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listadoMedicamentos.count;
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: CVCellMedicamento;
        if self.esCeldaExpandida(indexPath){
            cell = collectionView.dequeueReusableCellWithReuseIdentifier("celdaExpandida", forIndexPath: indexPath) as! CVCellMedicamento;
        }else{
            cell = collectionView.dequeueReusableCellWithReuseIdentifier("celdaBasica", forIndexPath: indexPath) as! CVCellMedicamento;
        }
    
        cell.datosMedicamento = self.listadoMedicamentos[indexPath.row];
        return cell
    }
    
    override func getSizeCeldaContraida(indexPath: NSIndexPath) -> CGSize{
        return CGSizeMake(333.0, 110.0);
    }
    
    override func getSizeCeldaExpandida(indexPath: NSIndexPath) -> CGSize{
        return CGSizeMake(333.0, 357.0);
    }

  
}