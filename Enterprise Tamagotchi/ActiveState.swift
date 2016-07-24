//
//  ActiveState.swift
//  Enterprise Tamagotchi
//
//  Created by Martin Kim Dung-Pham on 16.07.16.
//  Copyright © 2016 Martin Kim Dung-Pham. All rights reserved.
//

import GameplayKit

class ActiveState : TamagotchiState {
    
    required init(home: HomeScene, tamagotchi: Tamagotchi) {
        super.init(home: home, tamagotchi: tamagotchi, associatedNodeName: "activityBar")
        
        self.tamagotchi.activity.addObserver(observer: self)
    }
    
    override func didEnter(withPreviousState previousState: GKState?) {
        super.didEnter(withPreviousState: previousState)
        
        updateFeeling(feeling: "active")
    }
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        switch stateClass {
        case is AsleepState.Type:
            return true
        case is TakingMealState.Type:
            return true
        case is DeadState.Type:
            return true
        default:
            return false
        }
    }
    
    override func update(withDeltaTime seconds: TimeInterval) {
        tamagotchi.increase(level: tamagotchi.activity)
    }
}
