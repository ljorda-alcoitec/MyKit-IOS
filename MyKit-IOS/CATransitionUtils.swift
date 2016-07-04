//
//  CATransitionUtils.swift
//  MyKit-IOS
//
//  Created by Lucía Jordá Hernández on 4/7/16.
//  Copyright © 2016 Lucía Jordá Hernández. All rights reserved.
//

import Foundation
import QuartzCore

class CATransitionUtils{
    
    static func transicionTransparenteASolido()->CATransition{
        
        let transition = CATransition();
        transition.type = kCATransitionReveal;
        transition.duration = 3;
        return transition;
    }
}