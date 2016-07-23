//
//  Level.swift
//  Enterprise Tamagotchi
//
//  Created by Martin Kim Dung-Pham on 17/07/2016.
//  Copyright © 2016 Martin Kim Dung-Pham. All rights reserved.
//

import Foundation

protocol LevelObserver {
    func updatedLevel(level: Level)
}

class Level {
    var level: Int = 50 {
        didSet {
            observers.forEach { (observer: LevelObserver) in
                observer.updatedLevel(level: self)
            }
        }
    }
    private var observers = [LevelObserver]()
    
    func addObserver(observer: LevelObserver) {
        observers.append(observer)
        observer.updatedLevel(level: self)
    }
}
