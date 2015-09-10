//
//  DevilWizard.swift
//  rpgoop
//
//  Created by Joel Cloralt on 9/10/15.
//  Copyright © 2015 Joel Cloralt. All rights reserved.
//

import Foundation

class DevilWizard: Enemy {
    override var loot: [String] {
        return ["magic wand", "dark amulet", "salted pork"]
    }
    
    override var type: String {
        return "Devil Wizard"
    }
}