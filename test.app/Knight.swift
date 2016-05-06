//
//  Knight.swift
//  test.app
//
//  Created by Stéphane DEPOILLY on 24/03/2016.
//  Copyright © 2016 Stéphane DEPOILLY. All rights reserved.
//

import Foundation
import UIKit

class Knight: Player {
    
// Public properties
    
//    override var hp: Int {
//        return 300
//            return Int(arc4random_uniform(10)) + 100
//    }
    
    override var attackPwr: Int {
        return Int(arc4random_uniform(5)) + 15
    }
    
    override var fighterSpr: UIImage {
        return UIImage (named: "knight")!
    }
    
    override var attackSndSrc: String? {
        
        return NSBundle.mainBundle().pathForResource("knight_die", ofType: "wav")
    }
    
    override var isDeadSndSrc: String? {
        
        return NSBundle.mainBundle().pathForResource("knight_die", ofType: "wav")
    }
    
    convenience override init() {
        self.init()
    }

    
}