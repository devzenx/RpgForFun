//
//  GameAudio.swift
//  test.app
//
//  Created by Stéphane DEPOILLY on 01/04/2016.
//  Copyright © 2016 Stéphane DEPOILLY. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class GameAudio: NSObject {

    var gStates: NSObject!
    
    override init() {
    }

    
// ** Audio variables
    
    // In-game sounds
    
    var bgmSnd: AVAudioPlayer!
    let bgmSndPath = NSBundle.mainBundle().pathForResource("selection.screen.loop", ofType: "wav")
    
    var swordSwingsSnd: AVAudioPlayer!
    let swordSwingsSndPath = NSBundle.mainBundle().pathForResource("orc_die", ofType: "wav")
    
    var orcDiesSnd: AVAudioPlayer!
    let orcDiesSndPath = NSBundle.mainBundle().pathForResource("orc_die", ofType: "wav")
    
    var knightDiesSnd: AVAudioPlayer!
    let knightDiesPath: String! = NSBundle.mainBundle().pathForResource("knight_die", ofType: "wav")
    
    // Inferface sounds
    var readySndBtn: AVAudioPlayer!
    let readySndPath = NSBundle.mainBundle().pathForResource("weapon_swipe_4", ofType: "wav")
    
    var knightSndChoice: AVAudioPlayer!
    let knightSndChoicePath = NSBundle.mainBundle().pathForResource("knight.scream", ofType: "wav")

    var orcSndChoice: AVAudioPlayer!
    let orcSndChoicePath = NSBundle.mainBundle().pathForResource("orc.scream", ofType: "wav")

    
// ** Path setup for audio files
    
    // Set path for the attack sound
    
    func declareMenuAudio() {
        
        // Set path for the Fighter Selection screen BGM
        let bgmSndURL = NSURL(fileURLWithPath: bgmSndPath!)
        do {
            try bgmSnd = AVAudioPlayer(contentsOfURL: bgmSndURL, fileTypeHint:  nil)
            bgmSnd.prepareToPlay()
            bgmSnd.numberOfLoops = -1
        } catch let err as NSError {
            print(err.debugDescription)
        }

        
        // Set path for Orc death sound
        let orcDiesURL = NSURL(fileURLWithPath: orcDiesSndPath!)

        do {
            try orcDiesSnd = AVAudioPlayer(contentsOfURL: orcDiesURL, fileTypeHint:  nil)
            orcDiesSnd.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
        // Set path for Knight death sound
        let knightDiesURL = NSURL(fileURLWithPath: knightDiesPath!)
        
        do {
            try knightDiesSnd = AVAudioPlayer(contentsOfURL: knightDiesURL, fileTypeHint:  nil)
            knightDiesSnd.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
        // Set path for the attack sound
        let swordSwingsPath = NSBundle.mainBundle().pathForResource("weapon_swipe_1", ofType: "wav")
        let swordSwingsURL = NSURL(fileURLWithPath: swordSwingsPath!)
        
        do {
            try swordSwingsSnd = AVAudioPlayer(contentsOfURL: swordSwingsURL, fileTypeHint:  nil)
            swordSwingsSnd.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
        // Set path for the hit button sound
        let ReadySndURL = NSURL(fileURLWithPath: readySndPath!)
        
        do {
            try readySndBtn = AVAudioPlayer(contentsOfURL: ReadySndURL, fileTypeHint:  nil)
            readySndBtn.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
        // Set path for the knight choice sound
        let knightSndChoiceURL = NSURL(fileURLWithPath: knightSndChoicePath!)
        
        do {
            try knightSndChoice = AVAudioPlayer(contentsOfURL: knightSndChoiceURL, fileTypeHint:  nil)
            knightSndChoice.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
        // Set path for the orc choice sound
        let orcSndChoiceURL = NSURL(fileURLWithPath: orcSndChoicePath!)
        
        do {
            try orcSndChoice = AVAudioPlayer(contentsOfURL: orcSndChoiceURL, fileTypeHint:  nil)
            orcSndChoice.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
 
    }

// ** UI button pressed
    
    // generic audio player
    
    
    
    // Play button for the Fighter Selection background music
    func playbgmSnd() {
        bgmSnd.numberOfLoops = -1
        bgmSnd.currentTime = 0
        bgmSnd.volume = 0.2
        bgmSnd.play()
    }
    
    // Play button for attackbutton
    func playSwordSwings() {
        if swordSwingsSnd.playing {
            swordSwingsSnd.stop()

        } else {
            swordSwingsSnd.currentTime = 0
            swordSwingsSnd.play()
        }
    }
    
    // Hit button for menus
    func playReadyBtn() {
        if readySndBtn.playing {
            readySndBtn.stop()
        } else {
            readySndBtn.currentTime = 0
            readySndBtn.play()
        }
    }
    
    // Play button for Knight choice
    func playKnightSndChoice() {
        if knightSndChoice.playing {
            knightSndChoice.stop()
        } else {
            knightSndChoice.currentTime = 0
            knightSndChoice.play()
        }
    }
    
    // Play button for Knight choice
    func playOrcSndChoice() {
        if orcSndChoice.playing {
            orcSndChoice.stop()
        } else {
            orcSndChoice.currentTime = 0
            orcSndChoice.play()
        }
    }
}


