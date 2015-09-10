//
//  Kimara.swift
//  rpgoop
//
//  Created by Joel Cloralt on 9/10/15.
//  Copyright © 2015 Joel Cloralt. All rights reserved.
//

import Foundation

class Kimara:Enemy{
    let IMMUNE_MAX = 15
    
    override var loot:[String] {
        return ["tuff hide", "kimara venum", "rare trident"]
    }
    
    override var type:String {
        return "Kimara"
    }
    
    override func attemptAttack(attackPwr: Int) -> Bool {
        if attackPwr >= IMMUNE_MAX {
            return super.attemptAttack(attackPwr)
        }
        return false
    }
}