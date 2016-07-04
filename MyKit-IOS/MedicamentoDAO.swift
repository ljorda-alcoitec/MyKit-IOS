//
//  MedicamentoDAO.swift
//  MyKit-IOS
//
//  Created by Lucía Jordá Hernández on 23/6/16.
//  Copyright © 2016 Lucía Jordá Hernández. All rights reserved.
//

import Foundation
import SQLite

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
        let stm = conexion.selecccionar(query);
        
        var medicamentos:[Medicamento] = [];
        for row in stm{
            medicamentos.append(MedicamentoBuilder.crearMedicamento(row[0] as! Int64,
                nombre: row[1] as! String,
                tipo: row[2] as! Int64));
        }
        
        return medicamentos;
    }
    
    static func getMedicamentoById(id: Int64) -> Medicamento {
        let query: String = "SELECT nombre, tipo FROM medicamento WHERE id = ?";
        
        let conexion:Conexion = Conexion();
        conexion.abrir();
        let stm = conexion.selecccionar(query, id);
        let row = stm.next();
        if row == nil{
            return Medicamento();
        }
        
        return MedicamentoBuilder.crearMedicamento(row![0] as! String, tipo: row![1] as! Int64);
    }

}
