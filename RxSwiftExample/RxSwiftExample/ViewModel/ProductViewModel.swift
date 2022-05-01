//
//  ProductViewModel.swift
//  RxSwiftExample
//
//  Created by Kwangjun Kim on 2022/05/01.
//

import Foundation
import RxSwift
import RxCocoa

struct ProductViewModel {
    var items = PublishSubject<[ProductModel]>()
    
    func fetchItems() {
        let products = [
            ProductModel(title: "Home", imageName: "house"),
            ProductModel(title: "Setting", imageName: "gear"),
            ProductModel(title: "Profile", imageName: "person.circle"),
            ProductModel(title: "Flight", imageName: "airplane"),
            ProductModel(title: "Activity", imageName: "bell"),
        ]
        
        items.onNext(products)
        items.onCompleted()
    }
}
