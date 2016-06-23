//
//  MedicamentoBuilder.swift
//  MyKit-IOS
//
//  Created by Lucía Jordá Hernández on 23/6/16.
//  Copyright © 2016 Lucía Jordá Hernández. All rights reserved.
//

import Foundation
class MedicamentoBuilder{
    
    static func crearMedicamento(id:Int64, nombre:String, tipo:Int64) -> Medicamento{
        let medicamento:Medicamento = MedicamentoBuilder.crearMedicamento(nombre,
                                                                          tipo: tipo);
        medicamento.id = id;
        return medicamento;
        
    }
    
    static func crearMedicamento(nombre:String, tipo:Int64) -> Medicamento{
        let medicamento:Medicamento = Medicamento();
        medicamento.nombre = nombre;
        medicamento.tipo = tipo;
        return medicamento;
    }
}


