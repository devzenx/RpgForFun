//
//  GameStates.swift
//  RpgForFun
//
//  Created by Stéphane DEPOILLY on 24/03/2016.
//  Copyright © 2016 Stéphane DEPOILLY. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class Player {

// PRIVATE PROPERTIES
    
    private var _name: String?
    private var _hp: Int = 100
    private var _attackPwr: Int = 10
    private var _isAlive: Bool = true
    private var _fighterSpr: UIImage! = UIImage (named: "no_choice")!
    private var _tombSpr: UIImage! = UIImage (named: "tombstone")!
    private var _initialHp: Int = 100 // saves the hp before fight. If the user presses restart fight, new hp won't be generated.
  
    
// PUBLIC PROPERTIES
    
    var vc: ViewController!
    var randAtk: Int { return genRandAp() }
    var hpBefAtk: Int!
   
    
// COMPUTED PROPERTIES

    var name: String! {
        get {
            return _name
        }
    }

    var hp: Int {
        get {
            return _hp
        }
        set (newValue) {
            return _hp = newValue
        }
    }
    
    var attackPwr: Int {
        get {
            return _attackPwr
        }
        
        set (newValue) {
            return _attackPwr = newValue
        }
    }

    var fighterSpr: UIImage {
        get {
            return _fighterSpr
        }
    }
    
    var tombSpr: UIImage {
        get {
            return _tombSpr
        }
    }

    var initialHp: Int {
        get {
            return _initialHp
    }
        set(newValue) {
            return _initialHp = newValue
        }
}
    
    
// INITIALIZER
    
    init (name: String){
        self._name = name
        self.hp = 50
        self.attackPwr = 10
        self._initialHp = self.hp // We store the HP of the player into "Initial HP". Since we generate random HP according to the fighter type, we want to reuse the last HP if we want to fight again the same fight (revenge) with the same specs.
    }
    
    
// METHODS
    
    func isAttacked(amount: Int){
        self._hp -= amount
        print("", separator:" ")
        print("Current Player \(amount)AP Target:\(self.hp)/\(self.initialHp)HP (\(amount + self.hp))")
        
    }
    
    func genRandAp() -> Int {
        let ap = Int(arc4random_uniform(50)) + 5
        return ap
    }
    
    func isDead() -> Bool {
        
        if self._hp <= 0 {
            return true
            
        } else {
            return false
        }
    }

}