//
//  LectorScriptsSqlDeVersionXML.swift
//  MyKit-IOS
//
//  Created by Lucía Jordá Hernández on 23/6/16.
//  Copyright © 2016 Lucía Jordá Hernández. All rights reserved.
//

import Foundation
import SWXMLHash

class LectorScriptsSqlDeVersionXML{
    
    static func getScripts(version: Int64) -> Array<String>{
        
        let nombreFichero = "version_"+(String)(version);
        
        
        let rutaFichero = NSBundle.mainBundle().pathForResource(nombreFichero, ofType: "xml");
        let data = NSData(contentsOfFile: rutaFichero!);
        let xml = SWXMLHash.parse(data!);
        
        var listaScripts: [String] = [];
        for elem in xml["xml"]["script"]["instruccion"]{
            listaScripts.append(elem["sql"].element!.text!.condensedWhitespace);
        }
        
        return listaScripts;
    }
    
}
