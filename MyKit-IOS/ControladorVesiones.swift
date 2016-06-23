//
//  ControladorVesiones.swift
//  MyKit-IOS
//
//  Created by Lucía Jordá Hernández on 23/6/16.
//  Copyright © 2016 Lucía Jordá Hernández. All rights reserved.
//

import Foundation

class ControladorVesiones{
    
    static let versionFinal:Int64 = 1;
    
    static func comprobarVersion(){
        
        let conexion: Conexion = Conexion();
        conexion.abrir();
        
        let version = VersionDAO.getVersion(conexion);
     
        ControladorVesiones.actualizaVersionBD(version);
    }
    
    static func actualizaVersionBD(versionActual: Int64){
        if versionActual == ControladorVesiones.versionFinal{
            return;
        }
        
        let conexion: Conexion = Conexion();
        conexion.abrir();
        
        for version in versionActual+1 ... ControladorVesiones.versionFinal{
            ControladorVesiones.ejecutarScriptCambioVersion(conexion, version: version);
        }
    }
    
    static func ejecutarScriptCambioVersion(conexion: Conexion, version: Int64){
        let listadoScripts = LectorScriptsSqlDeVersionXML.getScripts(version);
        for script in listadoScripts{
            conexion.modificaEsquema(script);
        }
    }
}

