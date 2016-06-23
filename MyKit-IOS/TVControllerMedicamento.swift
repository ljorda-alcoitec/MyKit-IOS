//
//  TVControllerMedicamento.swift
//  MyKit-IOS
//
//  Created by Lucía Jordá Hernández on 22/6/16.
//  Copyright © 2016 Lucía Jordá Hernández. All rights reserved.
//

import UIKit

class TVControllerMedicamento: NavigationDrawerTableViewControllerBase {
    
    @IBOutlet var tablaMedicamentos: UITableView!;
    
    var listadoMedicamentos: [Medicamento]!;
    
    override func viewDidLoad() {
        self.listadoMedicamentos = MedicamentoDAO.getMedicamentos();
        self.tablaMedicamentos.estimatedRowHeight = 90.0;
        self.tablaMedicamentos.rowHeight = UITableViewAutomaticDimension;
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listadoMedicamentos.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: TVCellMedicamento = tableView.dequeueReusableCellWithIdentifier("celdaMedicamento", forIndexPath: indexPath) as! TVCellMedicamento;
        
        cell.datosMedicamento = MedicamentoBuilder.crearMedicamento(listadoMedicamentos[indexPath.row].nombre!,
                                                                    tipo:listadoMedicamentos[indexPath.row].tipo!);
        return cell;
    }
 }
