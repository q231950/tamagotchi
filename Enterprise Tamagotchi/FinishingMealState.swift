//
//  FinishingMealState.swift
//  Enterprise Tamagotchi
//
//  Created by Martin Kim Dung-Pham on 16.07.16.
//  Copyright © 2016 Martin Kim Dung-Pham. All rights reserved.
//

import GameplayKit

class FinishingMealState: TamagotchiState {
    
    required init(home: HomeScene) {
        super.init(home: home, associatedNodeName: "FinishingMealState")
    }
    
    override func didEnter(withPreviousState previousState: GKState?) {
        super.didEnter(withPreviousState: previousState)
        
        updateFeeling(feeling: "finishing meal")
        
        let dispatchTime: DispatchTime = DispatchTime.now() + Double(Int64(2 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        DispatchQueue.main.after(when: dispatchTime, execute: {
            self.stateMachine?.enterState(SleepyState.self)
        })
    }
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        switch stateClass {
        case is SleepyState.Type:
            return true
        case is AwakeState.Type:
            return true
        default:
            return false
        }
    }
}
