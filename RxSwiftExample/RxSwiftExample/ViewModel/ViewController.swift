//
//  ViewController.swift
//  RxSwiftExample
//
//  Created by Kwangjun Kim on 2022/05/01.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    let tableView = MainTableView()
    
    private var viewModel = ProductViewModel()
    
    private var bag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        self.view.addSubview(tableView)
        tableView.frame = view.bounds
        bindTableData()
    }
    
    func bindTableData() {
        // bind items to table
        viewModel.items.bind(to: tableView.rx.items(
            cellIdentifier: "cell",
            cellType: UITableViewCell.self)
        ) { row, model, cell in
            cell.textLabel?.text = model.title
            cell.imageView?.image = UIImage(systemName: model.imageName)
        }.disposed(by: bag)
        
        // bind a model selected handler
        tableView.rx.modelSelected(ProductModel.self).bind { product in
            print(product.title)
        }
        
        viewModel.fetchItems()
    }
    
    
}

