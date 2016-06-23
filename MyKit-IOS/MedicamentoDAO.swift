//
//  MedicamentoDAO.swift
//  MyKit-IOS
//
//  Created by Lucía Jordá Hernández on 23/6/16.
//  Copyright © 2016 Lucía Jordá Hernández. All rights reserved.
//

import Foundation

class MedicamentoDAO{
    
    static func getNumeroMedicamentos()-> Int64{
        let query = "SELECT COUNT(*) FROM medicamento";
        let conexion: Conexion = Conexion();
        conexion.abrir();
        return conexion.leeEntero(query);
    }
    
    static func getMedicamentos() -> Array<Medicamento>{
        let query: String = "SELECT id, nombre, tipo FROM medicamento";
        
        let conexion: Conexion = Conexion();
        conexion.abrir();
        let stmt = conexion.selecccionar(query);
        
        var medicamentos:[Medicamento] = [];
        for row in stmt{
            medicamentos.append(MedicamentoBuilder.crearMedicamento(row[0] as! Int64,
                nombre: row[1] as! String,
                tipo: row[2] as! Int64));
        }
        
        return medicamentos;
    }

}
