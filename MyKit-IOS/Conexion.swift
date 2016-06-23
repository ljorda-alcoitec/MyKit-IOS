//
//  Conexion.swift
//  MyKit-IOS
//
//  Created by Lucía Jordá Hernández on 23/6/16.
//  Copyright © 2016 Lucía Jordá Hernández. All rights reserved.
//

import Foundation
import SQLite

class Conexion{
    
    var conexion: Connection!;
    
    func abrir(){
        let docsDir = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).last!;
        print(docsDir.debugDescription);
        let baseDatosPath = (docsDir as NSString).stringByAppendingPathComponent("MyKit-IOS.sqlite");
        self.conexion = try! Connection(baseDatosPath);
    }
    
    func existTable(tableName: String) -> Bool!{
        let query = "SELECT COUNT(*) FROM sqlite_master WHERE type = 'table' AND name = ?;";
        return self.conexion.scalar(query, tableName) as! Int64 > 0;
    }
    
    func modificaEsquema(queryString: String){
        try! self.conexion.execute(queryString);
    }
    
    func leeEntero(queryString:String, _ bindings: Binding?...) -> Int{
        let stmt = try! self.conexion.prepare(queryString);
        return stmt.scalar(bindings) as! Int;
    }
}