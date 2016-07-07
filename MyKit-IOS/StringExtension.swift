//
//  StringExtension.swift
//  MyKit-IOS
//
//  Created by Lucía Jordá Hernández on 23/6/16.
//  Copyright © 2016 Lucía Jordá Hernández. All rights reserved.
//

import Foundation

extension String {
    
    //Elemina los saltos de linea y los espacios
    var condensedWhitespace: String {
        let components = self.componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet());
        return components.filter { !$0.isEmpty }.joinWithSeparator(" ");
    }
}