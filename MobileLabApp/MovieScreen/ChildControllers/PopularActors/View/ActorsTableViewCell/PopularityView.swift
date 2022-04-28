//
//  PopularityView.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 22.03.2022.
//

import UIKit
import Then

class PopularityView: UIView {
    
    private var progressLayer = CAShapeLayer()
    
    private var ratingLabel = UILabel().then {
        $0.font = UIFont.boldSystemFont(ofSize: 20)
        $0.adjustsFontSizeToFitWidth = true
        $0.textColor = Colors.MovieCell.white
        $0.textAlignment = .center
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        createLinePath()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.layer.masksToBounds = true
        self.addSubview(ratingLabel)
    }
    
    func setRating(_ rating: Int, with duration: Double) {
        let progress = Float(rating) / 200
        setProgressWithAnimation(duration: duration, value: progress)
    }
    
    fileprivate func createLinePath() {
       
        let linePath = UIBezierPath()
        linePath.move(to: CGPoint(x: 0, y: 0))
        linePath.addLine(to: CGPoint(x: self.frame.width, y: 0))

        progressLayer.path = linePath.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = UIColor.green.cgColor
        progressLayer.lineWidth = 10.0
        progressLayer.strokeEnd = 1.0
        layer.addSublayer(progressLayer)
    }
    
    private func setProgressWithAnimation(duration: TimeInterval, value: Float) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = duration
        animation.fromValue = 0
        animation.toValue = value
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        progressLayer.strokeEnd = CGFloat(value)
        progressLayer.add(animation, forKey: "animateprogress")
    }
    
    
}
