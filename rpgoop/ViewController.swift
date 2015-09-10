//
//  ViewController.swift
//  rpgoop
//
//  Created by Joel Cloralt on 9/10/15.
//  Copyright © 2015 Joel Cloralt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var printLbl: UILabel!
    @IBOutlet weak var playerHpLbl: UILabel!
    @IBOutlet weak var lblEnemyLbl: UILabel!
    @IBOutlet weak var EnemyImg: UIImageView!
    @IBOutlet weak var chestBtn: UIButton!
    @IBOutlet weak var playerHealthLbl: UILabel!
    @IBOutlet weak var enemyHealthLbl: UILabel!
    
    var player : Player!
    var enemy : Enemy!
    var chestMsg : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        player = Player(name: "dirtylaundry21", hp: 110, attackPwr: 20)
        
        generateRandomEnemy()
        
        playerHealthLbl.text = "\(player.hp) HP"
    }

    func generateRandomEnemy(){
        let rand = Int(arc4random_uniform(2))
        
        if rand == 0 {
            enemy = Kimara(startingHp:50, attackPwr:12)
        } else {
            enemy = DevilWizard(startingHp:60, attackPwr:15)
        }
        
        EnemyImg.hidden = false
    }

    
    @IBAction func onChestTap(sender: UIButton) {
        chestBtn.hidden = true
        printLbl.text = chestMsg
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "generateRandomEnemy", userInfo: nil, repeats: false)
    }
    
    @IBAction func attackTapped(sender: UIButton) {
        if enemy.attemptAttack(player.attackPwr) {
            printLbl.text = "Attacked \(enemy.type) for \(player.attackPwr) HP"
            enemyHealthLbl.text = "\(enemy.hp) HP"
        } else {
            printLbl.text = "Attacked unsuccessful!"
        }
        
        if let loot = enemy.dropLoot() {
            player.addItemToInventory(loot)
            chestMsg = "\(player.name) found \(loot)"
            chestBtn.hidden = false
        }
        
        if !enemy.isAlive {
            enemyHealthLbl.text = ""
            printLbl.text = "Killed \(enemy.type)"
            EnemyImg.hidden = true
        }
        
    }
    
    
}

