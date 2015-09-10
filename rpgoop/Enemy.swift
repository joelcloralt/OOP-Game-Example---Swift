//
//  Enemy.swift
//  rpgoop
//
//  Created by Joel Cloralt on 9/10/15.
//  Copyright © 2015 Joel Cloralt. All rights reserved.
//

import Foundation

class Enemy:Character {
    var loot : [String] {
        return ["Rusty Dagger", "Cracked Something"]
    }
    
    var type: String {
        return "Grunt"
    }
    
    func dropLoot() -> String? {
        if !isAlive {
            let rand = Int(arc4random_uniform(UInt32(loot.count)))
            return loot[rand]
        }
        
        return nil
    }
}