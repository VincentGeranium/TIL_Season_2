//
//  Observer.swift
//  ObserPatternExample
//
//  Created by Kwangjun Kim on 2022/07/16.
//

import Foundation
// Observer(Subscriber) Interface
protocol Observer {
    var id: String { get set }
    func update(message: String)
    func returnMessage(message: String)
}
