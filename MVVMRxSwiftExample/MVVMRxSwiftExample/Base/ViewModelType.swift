//
//  ViewModelType.swift
//  MVVMRxSwiftExample
//
//  Created by Minseong Kang on 2022/10/01.
//

import Foundation

protocol ViewModelType: class {
  associatedtype Input
  associatedtype Output
  
  func transform(input: Input) -> Output
}
