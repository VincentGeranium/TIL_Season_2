//
//  Users.swift
//  ObserPatternExample
//
//  Created by Kwangjun Kim on 2022/07/16.
//

import Foundation
// Concrete Observer(Subscriber)
class Users: Observer {
    var id: String
    
    init(id: String) {
        self.id = id
    }
    
    func update(message: String) {
        print("\(id)님 \(message)가 \(id)님을 기다리고 있어요 :)\n")
    }
    
    func returnMessage(message: String) {
        print("\(id)님은 \(message). :(\n")
    }
}
