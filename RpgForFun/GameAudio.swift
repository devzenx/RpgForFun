//
//  GameStates.swift
//  RpgForFun
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

    
// PROPERTIES
    
    // Inferface sounds
    
    //// Credits > http://freesound.org/people/potentjello/sounds/194114/
    var readySndBtn: AVAudioPlayer!
    let readySndPath = NSBundle.mainBundle().pathForResource("hit_button", ofType: "wav")
    
    //// Credits > http://freesound.org/people/LittleRobotSoundFactory/sounds/316466/
    var knightSndChoice: AVAudioPlayer!
    let knightSndChoicePath = NSBundle.mainBundle().pathForResource("knight.scream", ofType: "wav")
    
    //// Credits > http://freesound.org/people/debsound/sounds/332487/
    var orcSndChoice: AVAudioPlayer!
    let orcSndChoicePath = NSBundle.mainBundle().pathForResource("orc.scream", ofType: "wav")
    
    //// Credits > http://freesound.org/people/qubodup/sounds/161654/
    var drumsForBattle: AVAudioPlayer!
    let drumsForBattlePath = NSBundle.mainBundle().pathForResource("war_drums", ofType: "mp3")
    
    // In-game sounds
    
    //// Credits > http://freesound.org/people/haydensayshi123/sounds/138681/
    var bgmSnd: AVAudioPlayer!
    let bgmSndPath = NSBundle.mainBundle().pathForResource("selection.screen.loop", ofType: "wav")
    
    //// Credits > http://freesound.org/people/Michel88/sounds/76969/
    var knightDiesSnd: AVAudioPlayer!
    let knightDiesSndPath = NSBundle.mainBundle().pathForResource("knight_die", ofType: "wav")
    
    //// Credits > http://freesound.org/people/Michel88/sounds/76965/
    var orcDiesSnd: AVAudioPlayer!
    let orcDiesSndPath = NSBundle.mainBundle().pathForResource("orc_die", ofType: "wav")


// METHODS
    
    // Setting-up the audio path.
    func declareMenuAudio() {
        
        // Set path for the Fighter Selection screen BGM
        let bgmSndURL = NSURL(fileURLWithPath: bgmSndPath!)
        do {
            try bgmSnd = AVAudioPlayer(contentsOfURL: bgmSndURL, fileTypeHint:  nil)
            bgmSnd.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
        // Set path for the war drums before fight
        let drumsForBattleURL = NSURL(fileURLWithPath: drumsForBattlePath!)
        do {
            try drumsForBattle = AVAudioPlayer(contentsOfURL: drumsForBattleURL, fileTypeHint:  nil)
            drumsForBattle.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }

        // Set path for Knight death sound
        let knightDiesSndURL = NSURL(fileURLWithPath: knightDiesSndPath!)
        do {
            try knightDiesSnd = AVAudioPlayer(contentsOfURL: knightDiesSndURL, fileTypeHint:  nil)
            knightDiesSnd.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
        // Set path for Orc death sound
        let orcDiesSndURL = NSURL(fileURLWithPath: orcDiesSndPath!)
        do {
            try orcDiesSnd = AVAudioPlayer(contentsOfURL: orcDiesSndURL, fileTypeHint:  nil)
            orcDiesSnd.prepareToPlay()
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

    // Audio player for the background music
    func playReadyBtn() {
        if readySndBtn.playing {
            readySndBtn.stop()
        } else {
            readySndBtn.currentTime = 0
            readySndBtn.play()
        }
    }
    
    // Audio player for the background music
    func playbgmSnd() {
        bgmSnd.numberOfLoops = -1
        bgmSnd.currentTime = 0
        bgmSnd.volume = 0.2
        bgmSnd.play()
    }
    
    // Audio player for the war drums before battle
    func playWarDrumsSnd() {
        if drumsForBattle.playing {
            drumsForBattle.stop()
        } else {
            drumsForBattle.currentTime = 0
            drumsForBattle.play()
        }
    }
    
    // Audio player for when choosing the Knight on the Figther Selection screen
    func playKnightSndChoice() {
        if knightSndChoice.playing {
            knightSndChoice.stop()
        } else {
            knightSndChoice.currentTime = 0
            knightSndChoice.play()
        }
    }
    
    // Audio player for when choosing the Orc on the Figther Selection screen
    func playOrcSndChoice() {
        if orcSndChoice.playing {
            orcSndChoice.stop()
        } else {
            orcSndChoice.currentTime = 0
            orcSndChoice.play()
        }
    }
    
    // Audio player for the Knight death
    func playKnightDeath() {
        if knightDiesSnd.playing {
            knightDiesSnd.stop()
        } else {
            knightDiesSnd.currentTime = 0
            knightDiesSnd.play()
        }
    }
    
    // Audio player for the Orc death
    func playOrcDeath() {
        if orcDiesSnd.playing {
            orcDiesSnd.stop()
        } else {
            orcDiesSnd.currentTime = 0
            orcDiesSnd.play()
        }
    }
    

}


