//
//  GameStates.swift
//  RpgForFun
//
//  Created by Stéphane DEPOILLY on 24/03/2016.
//  Copyright © 2016 Stéphane DEPOILLY. All rights reserved.
//

import Foundation
import UIKit

class Orc: Player {
    
// PROPERTIES
    
    var orcHp: Int = Int(arc4random_uniform(10)) + 90
    
    override var hp: Int {
        
        get {
            return super.hp
        }
        set {
            super.hp = orcHp
        }
    }
    
    var orcAp: Int { return genRandAp() }
   
    override var attackPwr: Int {
        
        get {
            return super.attackPwr
        }
        set {
            super.attackPwr = orcAp
        }
    }
    
    override var fighterSpr: UIImage  {
        return UIImage (named: "orc")!
    }

    
// METHODS

    override func genRandAp() -> Int {
        let ap = Int(arc4random_uniform(5)) + 20
        return ap
    }

    convenience init() {
        self.init()
    }
    
}