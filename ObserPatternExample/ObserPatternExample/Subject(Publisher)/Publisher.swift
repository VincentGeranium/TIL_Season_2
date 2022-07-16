//
//  Publisher.swift
//  ObserPatternExample
//
//  Created by Kwangjun Kim on 2022/07/16.
//

import Foundation
// Subject(Publisher) Interface
protocol Publisher {
    var observers: [Observer] { get set }
    func subscribe(observer: Observer)
    func unSubscribe(observer: Observer)
    func notify(message: String)
}
