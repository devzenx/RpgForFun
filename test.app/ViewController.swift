//
//  ViewController.swift
//  test.app
//
//  Created by Stéphane DEPOILLY on 24/03/2016.
//  Copyright © 2016 Stéphane DEPOILLY. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITextFieldDelegate {
    
// Figthers Selection Screen outlets
    
    @IBOutlet weak var fighterSelectionScreen: UIView!
    
    @IBOutlet weak var p1FighterBg: UIImageView!
    
    @IBOutlet weak var p2FighterBg: UIImageView!

    @IBOutlet weak var p1KnightBtn: UIButton!
    
    @IBOutlet weak var p1OrcBtn: UIButton!
    
    @IBOutlet weak var p2KnightBtn: UIButton!
    
    @IBOutlet weak var p2OrcBtn: UIButton!
    
    @IBOutlet weak var p1ReadyBtn: UIButton!
    
    @IBOutlet weak var p2ReadyBtn: UIButton!
    
    @IBOutlet weak var p1Name: UITextField! {
        didSet {
    p1Name.delegate = self
        }
    }
    
    @IBOutlet weak var p2Name: UITextField! {
        didSet {
            p2Name.delegate = self
        }
    }
    
    @IBOutlet weak var p1OrcStats: UILabel!
    
    @IBOutlet weak var p1KnightStats: UILabel!
    
    @IBOutlet weak var p2OrcStats: UILabel!
    
    @IBOutlet weak var p2KnightStats: UILabel!
    
// Battle Screen outlets

    @IBOutlet weak var battleScreen: UIView!

    @IBOutlet weak var p1ChosenName: UILabel!
    
    @IBOutlet weak var p2ChosenName: UILabel!

    @IBOutlet weak var infoBar: UILabel!
    
    @IBOutlet weak var p1Hp: UILabel!
    
    @IBOutlet weak var p2Hp: UILabel!
    
    @IBOutlet weak var p1FighterSpr: UIImageView!
    
    @IBOutlet weak var p2FighterSpr: UIImageView!
    
    @IBOutlet weak var p1AttackBtn: UIButton!
    
    @IBOutlet weak var p2AttackBtn: UIButton!
    
// Restart Screen outlets

    @IBOutlet weak var restartScreen: UIView!
    
    @IBOutlet weak var goBackSelection: UIButton!
    
    @IBOutlet weak var restartFight: UIButton!
    
    @IBOutlet weak var whoIsTheWinner: UILabel!
    
// Selection Screen variables

    var player1: Player!
    var player2: Player!
    var player1Choice: String?
    var player2Choice: String?
    var knightBg: UIImage = UIImage (named: "knight_choice")!
    var orcBg: UIImage = UIImage (named: "orc_choice")!
    var gStates: GameStates!
    var gAudio: GameAudio!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        player1 = Player()
        player2 = Player()
        gStates = GameStates(vc: self)
        gStates.displayFightersScreen()
    }

    
// Fight Screen variables

    
    // Once the player made a fighter choice, the ready button will be enabled.
    @IBAction func p1KnightTapped(sender: UIButton) {
        p1KnightStats.hidden = false
        p1OrcStats.hidden = true
        p1FighterBg.image = knightBg
        print("P1 BG image:\(p1FighterBg.image)")
        p1KnightBtn.enabled = false
        p1OrcBtn.enabled = true
        player1Choice = "Knight" // We store the choice to later create an instance
        gStates.gAudio.playKnightSndChoice()
        gStates.p1EnableRdyBtn()
        print("P1:\(p1ReadyBtn.titleLabel!.text)")
    }
    
    @IBAction func p1OrcTapped(sender: UIButton) {
        p1OrcStats.hidden = false
        p1KnightStats.hidden = true
        p1FighterBg.image = orcBg
        p1OrcBtn.enabled = false
        p1KnightBtn.enabled = true
        player1Choice = "Orc" // We store the choice to later create an instance
        gStates.gAudio.playOrcSndChoice()
        gStates.p1EnableRdyBtn()
        print("P1:\(p1ReadyBtn.titleLabel!.text)")
    }
    
    @IBAction func p2KnightTapped(sender: UIButton) {
        p2KnightStats.hidden = false
        p2OrcStats.hidden = true
        p2FighterBg.transform = CGAffineTransformMakeScale(-1, 1)
        p2FighterBg.image = knightBg
        p2KnightBtn.enabled = false
        p2OrcBtn.enabled = true
        player2Choice = "Knight" // We store the choice to later create an instance
        gStates.gAudio.playKnightSndChoice()
        gStates.p2EnableRdyBtn()
        print("PLAYER 1 NEEDS TO \(p2ReadyBtn.titleLabel!.text)")
    }
    
    @IBAction func p2OrcTapped(sender: UIButton) {
        p2OrcStats.hidden = false
        p2KnightStats.hidden = true
        p2FighterBg.transform = CGAffineTransformMakeScale(-1, 1)
        p2FighterBg.image = orcBg
        p2OrcBtn.enabled = false
        p2KnightBtn.enabled = true
        player2Choice = "Orc" // We store the choice to later create an instance
        gStates.gAudio.playOrcSndChoice()
        gStates.p2EnableRdyBtn()
        print("PLAYER 2 NEEDS TO \(p2ReadyBtn.currentTitle)")
    }
    
    // Once both players are ready, we switch to the fight screen
    @IBAction func p1ReadyTapped(sender: AnyObject) {
        p1KnightBtn.enabled = false
        p1OrcBtn.enabled = false
        p1Name.enabled = false
        p1ReadyBtn.enabled = false
        p1ReadyBtn.setTitle("READY!", forState: .Normal)
        if self.p1Name.text == "" {
            self.p1Name.text = "PLAYER 1"
        }
        print("PLAYER 1 IS \(p1ReadyBtn.currentTitle)")
        gStates.gAudio.playReadyBtn()
        gStates.createPlayers()

    }

    @IBAction func p2ReadyTapped(sender: AnyObject) {
        p2KnightBtn.enabled = false
        p2OrcBtn.enabled = false
        p2Name.enabled = false
        p2ReadyBtn.enabled = false
        p2ReadyBtn.setTitle("READY!", forState: .Normal)
        if self.p2Name.text == "" {
            self.p2Name.text = "PLAYER 2"
        }
        print("PLAYER 2 IS \(p2ReadyBtn.currentTitle)")
        gStates.gAudio.playReadyBtn()
        gStates.createPlayers()
    }
    
    @IBAction func p1NameInput(sender: AnyObject) {
    }
    

    @IBAction func p2NameInput(sender: AnyObject) {
    }

    
    // Fight Screen Methods
    
    @IBAction func p1AttackTapped(sender: AnyObject) {
        player2!.isAttacked(player1!.attackPwr)
        infoBar.text = "\(player2!.name) took \(player1!.attackPwr) damage from \(player1!.name)!"
//        player2!.playAttackSnd()
        gStates.gAudio.playSwordSwings()
        p2Hp.text = "\(player2!.hp)/\(player2!.initialHp) HP"
        gStates.disableAtkBtn(p1AttackBtn)
        if player2!.isDead() {
            p1AttackBtn.hidden = true
            p2AttackBtn.hidden = true
            infoBar.text = "\(player1!.name) is the winner of the fight!"
//            player2!.playIsDeadSnd()
            p2Hp.text = "DEAD!"
            p2FighterSpr.image = player2!.tombSpr
            whoIsTheWinner.hidden = false
            whoIsTheWinner.text = "\(player2!.name) was defeated!"
             NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(self.tmpDisplayRestartScreen), userInfo: nil, repeats: false)
        }
        
    }
    
    @IBAction func p2AttackTapped(sender: AnyObject) {
        player1!.isAttacked(player2!.attackPwr)
        infoBar.text = "\(player1!.name) took \(player2!.attackPwr) damage from \(player2!.name)!"
//        player1!.playAttackSnd()
        gStates.gAudio.playSwordSwings()
        p1Hp.text = "\(player1!.hp)/\(player1!.initialHp) HP"
        gStates.disableAtkBtn(p2AttackBtn)
        if player1!.isDead() {
            infoBar.text = "\(player2!.name) is the winner of the fight!"
            p1AttackBtn.hidden = true
            p2AttackBtn.hidden = true
//            player1!.playIsDeadSnd()
            p1Hp.text = "DEAD!"
            p1FighterSpr.image = player1!.tombSpr
            whoIsTheWinner.hidden = false
            whoIsTheWinner.text = "\(player1!.name) was defeated!"
            NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(self.tmpDisplayRestartScreen), userInfo: nil, repeats: false)
        }
    }
 
    // Don't know how to solve this problem
    func tmpDisplayRestartScreen() {
        gStates.displayRestartScreen()
    }
    
    @IBAction func goSelectScreenTapped(sender: AnyObject) {
        gStates.displayFightersScreen()
    }
    
    @IBAction func fightRestartTapped(sender: AnyObject) {
        gStates.revenge()
    }
}