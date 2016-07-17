//
//  AsleepState.swift
//  Enterprise Tamagotchi
//
//  Created by Martin Kim Dung-Pham on 16.07.16.
//  Copyright © 2016 Martin Kim Dung-Pham. All rights reserved.
//

import SpriteKit
import GameplayKit

class AsleepState : TamagotchiState {
    
    let sleep = Sleep()
    
    required init(home: HomeScene) {
        super.init(home: home, associatedNodeName: "sleepBar")
        
        if let action = SKAction(named: "fill0", duration: 0.5) {
            guard let associatedNode = associatedNode else { return }
            associatedNode.run(action)
        }
    }
    
    override func didEnter(withPreviousState previousState: GKState?) {
        super.didEnter(withPreviousState: previousState)
        
        updateFeeling(feeling: "asleep")
    }
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass === WakingUpState.self
    }
    
    override func update(withDeltaTime seconds: TimeInterval) {
        sleep.level += 1
        
        if let action = SKAction(named: "fill\(sleep.level)", duration: 0.5) {
            guard let associatedNode = associatedNode else { return }
            associatedNode.run(action)
        }
    }
}
