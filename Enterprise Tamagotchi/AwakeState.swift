//
//  AwakeState.swift
//  Enterprise Tamagotchi
//
//  Created by Martin Kim Dung-Pham on 16.07.16.
//  Copyright © 2016 Martin Kim Dung-Pham. All rights reserved.
//

import GameplayKit

class AwakeState : TamagotchiState {
    
    let activity = Level()
    
    required init(home: HomeScene) {
        super.init(home: home, associatedNodeName: "activityBar")
        
        if let action = SKAction(named: "fill0", duration: 0.5) {
            guard let associatedNode = associatedNode else { return }
            associatedNode.run(action)
        }
    }
    
    override func didEnter(withPreviousState previousState: GKState?) {
        super.didEnter(withPreviousState: previousState)
        
        updateFeeling(feeling: "awake")
    }
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        switch stateClass {
        case is SleepyState.Type:
            return true
        case is PrepareForMealState.Type:
            return true
        default:
            return false
        }
    }
    
    override func update(withDeltaTime seconds: TimeInterval) {
        activity.level += 1
        
        if let action = SKAction(named: "fill\(activity.level)", duration: 0.5) {
            guard let associatedNode = associatedNode else { return }
            associatedNode.run(action)
        }
    }
}
