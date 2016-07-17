//
//  TakingMeal.swift
//  Enterprise Tamagotchi
//
//  Created by Martin Kim Dung-Pham on 16.07.16.
//  Copyright © 2016 Martin Kim Dung-Pham. All rights reserved.
//

import GameplayKit

class TakingMealState: TamagotchiState {
    
    let repletion = Level()
    
    required init(home: HomeScene) {
        super.init(home: home, associatedNodeName: "hungerBar")
        
        if let action = SKAction(named: "fill0", duration: 0.5) {
            guard let associatedNode = associatedNode else { return }
            associatedNode.run(action)
        }
    }
    
    override func didEnter(withPreviousState previousState: GKState?) {
        super.didEnter(withPreviousState: previousState)
        
        updateFeeling(feeling: "eating")
    }
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass === FinishingMealState.self
    }
    
    override func update(withDeltaTime seconds: TimeInterval) {
        repletion.level += 1
        
        if let action = SKAction(named: "fill\(repletion.level)", duration: 0.5) {
            guard let associatedNode = associatedNode else { return }
            associatedNode.run(action)
        }
    }
}
