//
//  MainTableView.swift
//  RxSwiftExample
//
//  Created by Kwangjun Kim on 2022/05/01.
//

import Foundation
import RxSwift
import RxCocoa
import UIKit

class MainTableView: UITableView {
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
