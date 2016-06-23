//
//  VersionDAO.swift
//  MyKit-IOS
//
//  Created by Lucía Jordá Hernández on 23/6/16.
//  Copyright © 2016 Lucía Jordá Hernández. All rights reserved.
//

import Foundation
import SQLite;

class VersionDAO{
    
    static func getVersion(conexion: Conexion)-> Int64{
        if !conexion.existTable("vesion"){
            return 0;
        }
        
        return conexion.leeEntero("SELECT version FROM version");
    }
    
}