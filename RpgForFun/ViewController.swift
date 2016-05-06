//
//  GameStates.swift
//  RpgForFun
//
//  Created by Stéphane DEPOILLY on 24/03/2016.
//  Copyright © 2016 Stéphane DEPOILLY. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITextFieldDelegate {
    
// OUTLETS
    
    //  Figthers Selection Screen
    
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
    
    //  Battle Screen

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
    
    // Restart Screen

    @IBOutlet weak var restartScreen: UIView!
    
    @IBOutlet weak var goBackSelection: UIButton!
    
    @IBOutlet weak var restartFight: UIButton!
    

// VARIABLES

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
        player1 = Player(name:"PLAYER 1")
        player2 = Player(name:"PLAYER 2")
        gStates = GameStates(vc: self)
        gStates.displayFightersScreen()
    }

    
// IBACTIONS
    
    // Figthers Selection Screen
    
    //// Player 1 chooses the "Knight" fighter
    @IBAction func p1KnightTapped(sender: UIButton) {
        p1KnightStats.hidden = false
        p1OrcStats.hidden = true
        p1FighterBg.image = knightBg
        p1KnightBtn.enabled = false
        p1OrcBtn.enabled = true
        player1Choice = "Knight" // We store the choice so we can later instantiate a Knight object for player 1
        gStates.gAudio.playKnightSndChoice()
        gStates.p1EnableRdyBtn()
    }
    
    //// Player 1 chooses the "Orc" fighter
    @IBAction func p1OrcTapped(sender: UIButton) {
        p1OrcStats.hidden = false
        p1KnightStats.hidden = true
        p1FighterBg.image = orcBg
        p1OrcBtn.enabled = false
        p1KnightBtn.enabled = true
        player1Choice = "Orc" // We store the choice so we can later instantiate a Orc object for player 1
        gStates.gAudio.playOrcSndChoice()
        gStates.p1EnableRdyBtn()
    }
    
    //// Player 2 chooses the "Knight" fighter
    @IBAction func p2KnightTapped(sender: UIButton) {
        p2KnightStats.hidden = false
        p2OrcStats.hidden = true
        p2FighterBg.transform = CGAffineTransformMakeScale(-1, 1)
        p2FighterBg.image = knightBg
        p2KnightBtn.enabled = false
        p2OrcBtn.enabled = true
        player2Choice = "Knight"
        gStates.gAudio.playKnightSndChoice()
        gStates.p2EnableRdyBtn()
    }
    
    //// Player 2 chooses the "Orc" fighter
    @IBAction func p2OrcTapped(sender: UIButton) {
        p2OrcStats.hidden = false
        p2KnightStats.hidden = true
        p2FighterBg.transform = CGAffineTransformMakeScale(-1, 1)
        p2FighterBg.image = orcBg
        p2OrcBtn.enabled = false
        p2KnightBtn.enabled = true
        player2Choice = "Orc"
        gStates.gAudio.playOrcSndChoice()
        gStates.p2EnableRdyBtn()
    }

    @IBAction func p1NameInput(sender: AnyObject) {
    }
    
    
    @IBAction func p2NameInput(sender: AnyObject) {
    }
    
    //// Once a player chose a fighter, "tap when ready" button is available. If both players are ready, then the battle screen is triggered.
    @IBAction func p1ReadyTapped(sender: AnyObject) {
        p1KnightBtn.enabled = false
        p1OrcBtn.enabled = false
        p1Name.enabled = false
        p1ReadyBtn.enabled = false
        p1ReadyBtn.setTitle("READY!", forState: .Normal)
        // If Player 1 didn't enter his name, then it'll be "PLAYER 1"
        if self.p1Name.text == "" {
            self.p1Name.text = "PLAYER 1"
        }
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
    
 
    // Battle Screen
    
    //// Player 1 presses the attack button and check if player 2 gets killed.
    @IBAction func p1AttackTapped(sender: AnyObject) {
        player1!.genRandAp()
        player2!.isAttacked(player1!.randAtk)
        infoBar.text = "\(player2!.name) took \(player1!.randAtk) damage from \(player1!.name)!"
        print("Player 1(\(player1.hp)/\(player1.initialHp)HP) AP: \(player1.attackPwr) ")
        print("Player 2(\(player2.hp)/\(player2.initialHp)HP) AP: \(player2.attackPwr) ")
        p2Hp.text = "\(player2!.hp)/\(player2!.initialHp) HP"
        gStates.disableAtkBtn(p1AttackBtn)
        if player2!.isDead() {
            gStates.playerDiesSnd(player2Choice!)
            p1AttackBtn.hidden = true
            p2AttackBtn.hidden = true
            infoBar.text = "\(player1!.name) is the winner of the fight!"
            p2Hp.text = "DEAD!"
            p2FighterSpr.image = player2!.tombSpr
            NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(self.tmpDisplayRestartScreen), userInfo: nil, repeats: false)
        }
        
    }
    
    //// Player 2 presses the attack button and check if player 1 gets killed.
    @IBAction func p2AttackTapped(sender: AnyObject) {
        player2!.genRandAp()
        player1!.isAttacked(player2!.randAtk)
        infoBar.text = "\(player1!.name) took \(player2!.randAtk) damage from \(player2!.name)!"
        print("Player 1(\(player1.hp)/\(player1.initialHp)HP) AP: \(player1.attackPwr)")
        print("Player 2(\(player2.hp)/\(player2.initialHp)HP) AP: \(player2.attackPwr)")
        p1Hp.text = "\(player1!.hp)/\(player1!.initialHp) HP"
        gStates.disableAtkBtn(p2AttackBtn)
        if player1!.isDead() {
            gStates.playerDiesSnd(player1Choice!)
            p1AttackBtn.hidden = true
            p2AttackBtn.hidden = true
            p1Hp.text = "DEAD!"
            p1FighterSpr.image = player1!.tombSpr
            infoBar.text = "\(player2!.name) is the winner of the fight!"
            NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(self.tmpDisplayRestartScreen), userInfo: nil, repeats: false)
        }
    }
    
    // Restart Screen
    
    @IBAction func goSelectScreenTapped(sender: AnyObject) {
        gStates.gAudio.playReadyBtn()
        gStates.displayFightersScreen()
    }
    
    @IBAction func fightRestartTapped(sender: AnyObject) {
        gStates.gAudio.playReadyBtn()
        gStates.revenge()
    }

// METHODS
    
    // Don't know how to solve this problem regarding the selector for the timer. It doesn't find "gStates.displayRestartScreen" (line 239).
    func tmpDisplayRestartScreen() {
        gStates.displayRestartScreen()
    }
    
    // It hides the keyboard when pressing the return key. "UITextFieldDelegate" has been associated to the class "ViewController".
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
}