//
//  Orc.swift
//  test.app
//
//  Created by Stéphane DEPOILLY on 24/03/2016.
//  Copyright © 2016 Stéphane DEPOILLY. All rights reserved.
//

import Foundation
import UIKit

class Orc: Player {
    
    // Public properties

//    override var hp: Int {
//        return Int(arc4random_uniform(10)) + 90
//    }
    
    override var attackPwr: Int {
        return Int(arc4random_uniform(5)) + 20
    }
    
    override var fighterSpr: UIImage  {
        return UIImage (named: "orc")!
    }
    
    override var attackSndSrc: String? {
        
        return NSBundle.mainBundle().pathForResource("orc_die", ofType: "wav")
    }
    
    override var isDeadSndSrc: String? {
        
        return NSBundle.mainBundle().pathForResource("orc_die", ofType: "wav")
    }

}