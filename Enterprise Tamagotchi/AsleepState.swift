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
    
    required init(home: HomeScene, tamagotchi: Tamagotchi) {
        super.init(home: home, tamagotchi: tamagotchi, associatedNodeName: "sleepBar")
        
        self.tamagotchi.sleep.addObserver(observer: self)
    }
    
    override func didEnter(withPreviousState previousState: GKState?) {
        super.didEnter(withPreviousState: previousState)
        
        updateFeeling(feeling: "asleep")
    }
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        switch stateClass {
        case is ActiveState.Type:
            return true
        case is TakingMealState.Type:
            return true
        default:
            return false
        }
    }
    
    override func update(withDeltaTime seconds: TimeInterval) {
        tamagotchi.sleep.level += 1
    }
}
