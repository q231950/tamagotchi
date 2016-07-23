//
//  TamagotchiState.swift
//  Enterprise Tamagotchi
//
//  Created by Martin Kim Dung-Pham on 16.07.16.
//  Copyright © 2016 Martin Kim Dung-Pham. All rights reserved.
//

import SpriteKit
import GameplayKit

class TamagotchiState: GKState, LevelObserver {
    
    let tamagotchi: Tamagotchi
    let associatedNodeName: String
    let home: HomeScene

    init(home: HomeScene, tamagotchi: Tamagotchi, associatedNodeName: String) {
        self.tamagotchi = tamagotchi
        self.home = home
        self.associatedNodeName = associatedNodeName
    }
    
    var associatedNode: SKSpriteNode? {
        return home.childNode(withName: "//\(associatedNodeName)") as? SKSpriteNode
    }
    
    func updateFeeling(feeling: String) {
        let feelingLabel = home.childNode(withName: "//feelingLabel") as! SKLabelNode
        feelingLabel.text = feeling
    }
    
    // MARK: LevelObserver
    
    func updatedLevel(level: Level) {
        if let action = SKAction(named: "fill\(level.level)", duration: 1/gameSpeed) {
            guard let associatedNode = associatedNode else { return }
            associatedNode.run(action)
        }
    }
}
