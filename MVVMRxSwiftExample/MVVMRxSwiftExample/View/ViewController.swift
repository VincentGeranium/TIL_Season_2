//
//  ViewController.swift
//  MVVMRxSwiftExample
//
//  Created by Minseong Kang on 2022/10/01.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
	
	@IBOutlet weak var countLabel: UILabel!
	@IBOutlet weak var plusButton: UIButton!
	@IBOutlet weak var subtractButton: UIButton!
	
	var disposeBag = DisposeBag()
	var viewModel = CounterViewModel()
	
	private lazy var input = CounterViewModel.Input(refresh: .just(()),
													plusAction: plusButton.rx.tap.asObservable(),
													subtractAction: subtractButton.rx.tap.asObservable())
	
	private lazy var output = viewModel.transform(input: input)
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.bindViewModel()
	}
}

extension ViewController {
	private func bindViewModel() {
		output.countedValue
			.map { outputValue in
				String(outputValue)
			}
			.drive(countLabel.rx.text)
			.disposed(by: disposeBag)
	}
}

