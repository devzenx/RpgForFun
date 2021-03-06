//
//  GameStates.swift
//  RpgForFun
//
//  Created by Stéphane DEPOILLY on 24/03/2016.
//  Copyright © 2016 Stéphane DEPOILLY. All rights reserved.
//

import Foundation
import UIKit

class Knight: Player {
    
// PROPERTIES
    
    var knightHp: Int = Int(arc4random_uniform(10)) + 100

    override var hp: Int {
        get {
            return super.hp
        }
        set {
            super.hp = knightHp
        }
    }

    var knightAp: Int { return genRandAp() }
    
    override var attackPwr: Int {
        
        get {
            return super.attackPwr
        }
        
        set {
            super.attackPwr = knightAp
        }
    }
    
    override var fighterSpr: UIImage {
        return UIImage (named: "knight")!
    }

    
    // METHODS

    override func genRandAp() -> Int {
        let ap = Int(arc4random_uniform(5)) + 15
        return ap
    }
    
    convenience init() {
        self.init()
        
    }

}