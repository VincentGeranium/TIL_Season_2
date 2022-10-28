//
//  ViewController.swift
//  lottie_demo
//
//  Created by Minseong Kang on 2022/10/28.
//

import UIKit
import Lottie

class ViewController: UIViewController {
	let lottieVC = LottieViewController()
	
	let button: UIButton = {
		let button: UIButton = UIButton()
		button.setTitle("Start", for: .normal)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
		button.setTitleColor(.blue, for: .normal)
		button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
		return button
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = .systemBackground
		
		self.button.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
		self.button.clipsToBounds = true
		self.button.layer.borderWidth = 0.5
		self.button.layer.borderColor = UIColor.blue.cgColor
		self.button.center = self.view.center
		
		self.view.addSubview(button)
	}
	
	@objc func didTapButton() {
		self.present(lottieVC, animated: true)
	}
	
	
}

