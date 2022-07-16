//
//  PUMPcompany.swift
//  ObserPatternExample
//
//  Created by Kwangjun Kim on 2022/07/16.
//

import Foundation
// Concrete Subject(Publisher)
class PUMPcompany: Publisher {
    var observers: [Observer]
    var removeObservers: [Observer] = []
    
    init(observers: [Observer]) {
        self.observers = observers
    }
    
    func subscribe(observer: Observer) {
        self.observers.append(observer)
    }
    
    func unSubscribe(observer: Observer) {
        if let index = self.observers.firstIndex(where: { observer in
            observer.id == observer.id
        }) {
            let removeUser = self.observers.remove(at: index)
            self.removeObservers.append(removeUser)
        }
    }
    
    func notify(message: String) {
        for observer in observers {
            observer.update(message: message)
        }
    }
    
    func messageToCompany(message: String) {
        for removeObserver in removeObservers {
            removeObserver.returnMessage(message: message)
        }
    }
}
