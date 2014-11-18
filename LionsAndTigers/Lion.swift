//
//  Lion.swift
//  LionsAndTigers
//
//  Created by John Mulholland on 17/11/2014.
//  Copyright (c) 2014 John Mulholland. All rights reserved.
//

import Foundation
import UIKit

class Lion
{
    var age = 0
    var isAlphaMale = false
    var image = UIImage(named:"")
    var name = ""
    var subspecies = ""
    
    func roar()
    {
        println("Lion: Road, Roar")
    }
    
    func changeToAlphaMale() {
        self.isAlphaMale = true
    }
    
    func randomFact() -> String {
        var randomFact :String
        if self.isAlphaMale {
            randomFact = "Male lions are easy to recongise because of their distincitive manes. Males with darker manes are more likely to attract females"
        }
        else {
            randomFact = "Lionesses form the stable social unit and do not tolerate outside females"
        }
        return randomFact
    }
}