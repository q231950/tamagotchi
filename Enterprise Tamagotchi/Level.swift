//
//  Level.swift
//  Enterprise Tamagotchi
//
//  Created by Martin Kim Dung-Pham on 17/07/2016.
//  Copyright © 2016 Martin Kim Dung-Pham. All rights reserved.
//

import Foundation

protocol LevelCoordinator {
    func reachedLethalLevel(level: Level)
}

protocol LevelObserver {
    func updatedLevel(level: Level)
}

class Level {
    var levelInternal: Int = 0
    var level: Int {
        set(newValue) {
            if newValue > 0 {
                self.levelInternal = newValue
                observers.forEach { (observer: LevelObserver) in
                    observer.updatedLevel(level: self)
                }
            } else {
                self.reachedLethalLevel()
            }
        }
        get {
            return self.levelInternal
        }
    }
    var levelCoordinator: LevelCoordinator?
    private var observers = [LevelObserver]()
    
    init() {
        level = 50
    }
    
    func addObserver(observer: LevelObserver) {
        observers.append(observer)
        observer.updatedLevel(level: self)
    }
    
    private func reachedLethalLevel() {
        if let coordinator = levelCoordinator {
            coordinator.reachedLethalLevel(level: self)
        }
    }
}
