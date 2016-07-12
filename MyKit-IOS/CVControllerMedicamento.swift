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
        if self.esCeldaExpandida(indexPath){
            let celda = collectionView.dequeueReusableCellWithReuseIdentifier("celdaExpandida", forIndexPath: indexPath) as! CVCellExpandidaMedicamento;
            celda.datosMedicamento = self.listadoMedicamentos[indexPath.row];
            return celda;
            
        }else{
            let celda = collectionView.dequeueReusableCellWithReuseIdentifier("celdaBasica", forIndexPath: indexPath) as! CVCellMedicamento;
            celda.datosMedicamento = self.listadoMedicamentos[indexPath.row];
            return celda;
        }
    }
    
    override func getSizeCeldaContraida(indexPath: NSIndexPath) -> CGSize {
   
       let altoLabel = UILabel.getAltoUILabelPorSimulacion(self.collectionView!.frame.width - 40,fuente: UIFont.systemFontOfSize(17.0), texto: self.listadoMedicamentos[indexPath.row].composicion);
        //self.listadoMedicamentos[indexPath.row].composicion;
        return CGSizeMake(self.getAncho(), altoLabel + 140);
    }
    
    override func getSizeCeldaExpandida(indexPath: NSIndexPath) -> CGSize{
        return CGSizeMake(self.getAncho(), 357.0);
    }
}
