//
//  ViewController.swift
//  CustomDraw
//
//  Created by Kwangjun Kim on 2022/07/10.
//

import UIKit

class ViewController: UIViewController {
    
    let shapeView: UIView = {
        let view: UIView = UIView()
        
        view.backgroundColor = .lightGray
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        // MARK: - Base UIView to draw our shape
        self.view.addSubview(shapeView)
        
        shapeView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            shapeView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            shapeView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            shapeView.widthAnchor.constraint(equalToConstant: 100),
            shapeView.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        drawShape()
    }
    
    
    func drawShape() {
        // Actual shape and its path
        let path = CGMutablePath()
        // Move path to beginning of part-1
        path.move(to: CGPoint(x: 10, y: 0))
        
        // Draw above divided parts
        // part - 1
        path.addLine(to: CGPoint(x: 90, y: 0))
        // part - 2
        path.addCurve(to: CGPoint(x: 95, y: 22), control1: CGPoint(x: 93, y: 6.6), control2: CGPoint(x: 95, y: 14))
        // part - 3
        path.addCurve(to: CGPoint(x: 90, y: 44), control1: CGPoint(x: 95, y: 30), control2: CGPoint(x: 93, y: 37))
        // part - 4
        path.addLine(to: CGPoint(x: 10, y: 44))
        // part - 5
        path.addCurve(to: CGPoint(x: 5, y: 22), control1: CGPoint(x: 7, y: 37), control2: CGPoint(x: 5, y: 30))
        // part - 6
        path.addCurve(to: CGPoint(x: 10, y: 0), control1: CGPoint(x: 5, y: 14), control2: CGPoint(x: 6, y: 6.6))
        
        let arcLayer = CAShapeLayer()
        arcLayer.path = path
        arcLayer.fillColor = UIColor.black.cgColor
        
        shapeView.layer.insertSublayer(arcLayer, at: 0)
    }


}

