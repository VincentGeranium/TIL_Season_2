//
//  ViewController.swift
//  MVVM-example
//
//  Created by Minseong Kang on 2022/10/14.
//

import UIKit

class ViewController: UIViewController {
	
	let viewModel = ViewModel()
	
	@IBOutlet weak var datetimeLabel: UILabel!
	
	
	@IBAction func onYesterday(_ sender: UIButton) {
		viewModel.moveDay(day: -1)
	}
	
	@IBAction func onNow(_ sender: Any) {
		viewModel.reload()
	}
	
	@IBAction func onTomorrow(_ sender: UIButton) {
		viewModel.moveDay(day: +1)
	}
	

	override func viewDidLoad() {
		super.viewDidLoad()
		viewModel.onUpdated = { [weak self] in
			DispatchQueue.main.async {
				self?.datetimeLabel.text = self?.viewModel.dateTimeString
			}
			
			
		}
		
		viewModel.reload()
	}


}

