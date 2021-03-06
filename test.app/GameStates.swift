//
//  GameStates.swift
//  test.app
//
//  Created by Stéphane DEPOILLY on 01/04/2016.
//  Copyright © 2016 Stéphane DEPOILLY. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class GameStates: NSObject {

    var vc: ViewController!
    var gAudio: GameAudio!
    var unknownBg: UIImage? = UIImage (named: "no_choice")!

    init(vc: ViewController) {
        super.init()
        self.gAudio = GameAudio()
        self.vc = vc
        self.gAudio.declareMenuAudio()
    }
    
// Audio variable
    
    // Menu audio (selection, fight and restart screen)

    
    
    
// Selection Screen Methods

    func displayFightersScreen() {
        gAudio.playbgmSnd()
        vc.p1KnightStats.hidden = true
        vc.p1OrcStats.hidden = true
        vc.p2KnightStats.hidden = true
        vc.p2OrcStats.hidden = true
        vc.p1FighterBg.image = unknownBg
        vc.p2FighterBg.transform = CGAffineTransformMakeScale(-1, 1)
        vc.p2FighterBg.image = unknownBg
        vc.p1Name.text = ""
        vc.p1Name.placeholder = "TAP TO ENTER YOUR NAME"
        vc.p2Name.text = ""
        vc.p2Name.placeholder = "TAP TO ENTER YOUR NAME"
        vc.p1KnightBtn.enabled = true
        vc.p2KnightBtn.enabled = true
        vc.p1OrcBtn.enabled = true
        vc.p2OrcBtn.enabled = true
        vc.p1ReadyBtn.enabled = false
        vc.p1ReadyBtn.setTitle("CHOOSE A FIGHTER", forState: .Normal)
        vc.p2ReadyBtn.enabled = false
        vc.p2ReadyBtn.setTitle("CHOOSE A FIGHTER", forState: .Normal)
        vc.p1Name.enabled = true
        vc.p2Name.enabled = true
        vc.restartScreen.hidden = true
        vc.battleScreen.hidden = true
        vc.fighterSelectionScreen.hidden = false
        vc.whoIsTheWinner.hidden = true
    }
    
    func displayBattleScreen() {
        self.vc.restartScreen.hidden = true
        self.vc.whoIsTheWinner.hidden = true
        self.vc.fighterSelectionScreen.hidden = true
        self.vc.battleScreen.hidden = false
        self.vc.infoBar.hidden = false
        self.vc.p1AttackBtn.hidden = false
        self.vc.p2AttackBtn.hidden = false
        self.vc.p1ChosenName.text = "\(self.vc.player1!.name)"
        self.vc.p2ChosenName.text = "\(self.vc.player2!.name)"
        self.vc.p1Hp.text = "\(self.vc.player1!.hp)/\(self.vc.player1!.initialHp) HP"
        self.vc.p2Hp.text = "\(self.vc.player2!.hp)/\(self.vc.player2!.initialHp) HP"
        self.vc.infoBar.text = "Press Attack to start the fight!"
        
    }
    
    func displayRestartScreen() {
        self.vc.p1AttackBtn.hidden = true
        self.vc.p2AttackBtn.hidden = true
        self.vc.infoBar.hidden = true
        self.vc.battleScreen.hidden = true
        self.vc.restartScreen.hidden = false

    }
    
    func revenge() {
        self.vc.p1FighterSpr.image = self.vc.player1!.fighterSpr
        self.vc.p2FighterSpr.image = self.vc.player2!.fighterSpr
        self.vc.player1.hp = self.vc.player1.initialHp
        print("player 1 HP: \(self.vc.player1.hp)/\(self.vc.player1.initialHp) HP")
        self.vc.player2.hp = self.vc.player2.initialHp
        print("player 2 HP: \(self.vc.player2.hp)/\(self.vc.player2.initialHp) HP")
        displayBattleScreen()
    }
    
    
    func p1EnableRdyBtn() {
        if (vc.p1FighterBg.image != unknownBg) {
            vc.p1ReadyBtn.setTitle("TAP WHEN READY", forState: .Normal)
            vc.p1ReadyBtn.enabled = true
        }
    }
    
    func p2EnableRdyBtn() {
        if (vc.p2FighterBg.image != unknownBg) {
            vc.p2ReadyBtn.setTitle("TAP WHEN READY", forState: .Normal)
            vc.p2ReadyBtn.enabled = true
        }
    }
    
    // A. Both players tapped the ready buttons.
    // B. The fight screen is displayed.
    // C. Instances of Player are created
    
    func createPlayers() {
        
        if (vc.p1ReadyBtn.currentTitle == "READY!") && (vc.p2ReadyBtn.currentTitle == "READY!") {

            if self.vc.player1Choice == "Knight" {
                
                self.vc.player1 = Knight(name: self.vc.p1Name.text!)
                self.vc.p1FighterSpr.image = self.vc.player1!.fighterSpr
                print("player 1 HP: \(self.vc.player1.hp)/\(self.vc.player1.initialHp) HP")
            } else {
                self.vc.player1 = Orc(name: self.vc.p1Name.text!)
                self.vc.p1FighterSpr.image = self.vc.player1!.fighterSpr
                print("player 1 HP: \(self.vc.player1.hp)/\(self.vc.player1.initialHp) HP")
            }
            if self.vc.player2Choice == "Knight" {
                self.vc.player2 = Knight(name: self.vc.p2Name.text!)
                self.vc.p2FighterSpr.image = self.vc.player2!.fighterSpr
                self.vc.p2FighterSpr.transform = CGAffineTransformMakeScale(-1, 1)
                print("player 2 HP: \(self.vc.player2.hp)/\(self.vc.player2.initialHp) HP")
            } else {
                self.vc.player2 = Orc(name: self.vc.p2Name.text!)
                self.vc.p2FighterSpr.image = self.vc.player2!.fighterSpr
                self.vc.p2FighterSpr.transform = CGAffineTransformMakeScale(-1, 1)
                print("player 2 HP: \(self.vc.player2.hp)/\(self.vc.player2.initialHp) HP")
            }
            NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(self.displayBattleScreen), userInfo: nil, repeats: false)
        }
    }
    
    func disableAtkBtn(attackButton: UIButton) {
        attackButton.enabled = false
        attackButton.setTitle("WAITING", forState: .Normal)
        NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(GameStates.enableAtkBtn(_:)), userInfo: attackButton, repeats: false)
    }
    
    func enableAtkBtn(timer: NSTimer) {
        let buttonToEnable = timer.userInfo as! UIButton
        buttonToEnable.enabled = true
        buttonToEnable.setTitle("ATTACK", forState: .Normal)
    }
    
}