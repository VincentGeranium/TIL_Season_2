//
//  LottieViewController.swift
//  lottie_demo
//
//  Created by Minseong Kang on 2022/10/28.
//

import Foundation
import Lottie
import UIKit

class LottieViewController: UIViewController {
	let animationView = LottieAnimationView(name: "xingxing_test") // AnimationView(name: "lottie json 파일 이름")으로 애니메이션 뷰 생성
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = .systemBackground
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		animationView.frame = CGRect(x: 0, y: 0, width: 300, height: 300) // 애니메이션뷰의 크기 설정
		animationView.center = self.view.center // 애니메이션뷰의 위치설정
		animationView.contentMode = .scaleAspectFill // 애니메이션뷰의 콘텐트모드 설정
		
		view.addSubview(animationView) // 애니메이션뷰를 메인뷰에 추가
		
		animationView.play()
	}
}
