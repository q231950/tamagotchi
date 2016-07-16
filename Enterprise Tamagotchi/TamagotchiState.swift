//
//  TamagotchiState.swift
//  Enterprise Tamagotchi
//
//  Created by Martin Kim Dung-Pham on 16.07.16.
//  Copyright © 2016 Martin Kim Dung-Pham. All rights reserved.
//

import SpriteKit
import GameplayKit

class TamagotchiState: GKState {
    
    let associatedNodeName: String
    let home: HomeScene

    init(home: HomeScene, associatedNodeName: String) {
        self.home = home
        self.associatedNodeName = associatedNodeName
    }
    
    func updateFeeling(feeling: String) {
        let feelingLabel = home.childNode(withName: "//feelingLabel") as! SKLabelNode
        feelingLabel.text = feeling
    }
}
