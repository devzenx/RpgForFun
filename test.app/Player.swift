//
//  Player.swift
//  test.app
//
//  Created by Stéphane DEPOILLY on 24/03/2016.
//  Copyright © 2016 Stéphane DEPOILLY. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class Player {

// Private properties
    
    private var _name: String?
    private var _hp: Int = 50
    private var _attackPwr: Int = 10
    private var _isAlive: Bool = true
    private var _fighterSpr: UIImage! = UIImage (named: "no_choice")!
    private var _tombSpr: UIImage! = UIImage (named: "tombstone")!
    private var _attackSndSrc : String?
    private var _isDeadSndSrc : String?
    private var _initialHp: Int = 100 // saves the hp before fight. If the user presses restart fight, new hp won't be generated.
    
// Public properties
    
    var vc: ViewController!
    
// Audio variables
    
    var attackSnd: AVAudioPlayer!
    var isDeadSnd: AVAudioPlayer!
    var bgm: AVAudioPlayer!
    var attackSndArray = ["weapon_swipe_1", "weapon_swipe_2", "weapon_swipe_3", "weapon_swipe_4"]

    
// Computed properties

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

    
    var attackSndSrc: String? {
        get {
            return _attackSndSrc
        }
    }
    
    var isDeadSndSrc: String? {
        get {
            return _isDeadSndSrc
        }
    }

    var initialHp: Int {
        get {
            return _initialHp
    }
        set(newValue){
            return _initialHp = newValue
        }
}
    
// Methods
    
    init (name: String){
        self._name = name
        self._hp = Int(arc4random_uniform(10)) + 90
        self._initialHp = self.hp
    }
    
    // Decrease player's health point according to the 
    // opponent's attack power.
    func isAttacked(amount: Int){
        self._hp -= amount
        print("damage: \(self._hp)")
    }
    
    func isDead() -> Bool {
        
        if self._hp <= 0 {
            return true
            
        } else {
            return false
        }
    }
    
    func playAttackSnd() {
        
        if attackSnd.playing {
            attackSnd.stop()
        } else {
            attackSnd.play()
        }
    }
    
    func playIsDeadSnd() {
        
        if isDeadSnd.playing {
            isDeadSnd.stop()
        } else {
            isDeadSnd.play()
        }
    }
    
    func restoreLastHp() {
        self._hp = self.initialHp
    }
    
    init(){
    
    // Set path for the attack sound
        let attackSndPath = NSBundle.mainBundle().pathForResource("weapon_swipe_1", ofType: "wav")
        let attackSndURL = NSURL(fileURLWithPath: attackSndPath!)
    
        do {
            try attackSnd = AVAudioPlayer(contentsOfURL: attackSndURL, fileTypeHint:  nil)
            attackSnd.prepareToPlay()
            } catch let err as NSError {
                print(err.debugDescription)
            }
        
    // Set path for the death sound
        
        let isDeadSndPath = NSBundle.mainBundle().pathForResource("orc_die", ofType: "wav")
        let isDeadSndURL = NSURL(fileURLWithPath: isDeadSndPath!)
    
    do {
        
        try isDeadSnd = AVAudioPlayer(contentsOfURL: isDeadSndURL, fileTypeHint:  nil)
        isDeadSnd.prepareToPlay()
        
    } catch let err as NSError {
        print(err.debugDescription)
    }
        
    }

}