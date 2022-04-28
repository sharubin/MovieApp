//
//  RatingView.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 10.03.2022.
//

import UIKit
import Then

class RatingView: UIView {
    
    private var progressLayer = CAShapeLayer()
    private var trackLayer = CAShapeLayer()
    
    private var ratingLabel = UILabel().then {
        $0.font = UIFont.boldSystemFont(ofSize: 20)
        $0.adjustsFontSizeToFitWidth = true
        $0.textColor = Colors.MovieCell.white
        $0.textAlignment = .center
    }
    
    private var progressColor: UIColor? = UIColor.green {
        didSet {
            progressLayer.strokeColor = progressColor?.cgColor
        }
    }
    
    private var trackColor = UIColor.black {
        didSet {
            trackLayer.strokeColor = trackColor.cgColor
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        createCircularPath()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.backgroundColor = .black
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.frame.size.height / 2
        self.addSubview(ratingLabel)
        setFrames()
    }
    
    private func setFrames() {
        ratingLabel.frame = CGRect(
            x: 10,
            y: 10,
            width: self.frame.size.width - 20 ,
            height: self.frame.size.height - 20
        )
    }
    
    func setRating(_ rating: Int, with duration: Double) {
        ratingLabel.text = String(rating)
        setProgressColor(for: rating)
        let progress = Float(rating) / 100
        setProgressWithAnimation(duration: duration, value: progress)
    }
    
    private func setProgressColor(for rating: Int) {
        if rating > 75 {
            progressColor = Colors.MovieCell.green
        } else if rating > 45 {
            progressColor = Colors.MovieCell.yellow
        } else {
            progressColor = Colors.MovieCell.red
        }
    }
    
    fileprivate func createCircularPath() {
        let circlePath = UIBezierPath(
            arcCenter: CGPoint(
                x: frame.size.width/2,
                y: frame.size.height/2
            ),
            radius: (frame.size.width - 1.5)/2,
            startAngle: CGFloat(-0.5 * .pi),
            endAngle: CGFloat(1.5 * .pi),
            clockwise: true
        )
        trackLayer.path = circlePath.cgPath
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.backgroundColor = UIColor.black.cgColor
        trackLayer.strokeColor = trackColor.cgColor
        trackLayer.lineWidth = 2.0
        trackLayer.strokeEnd = 1.0
        layer.addSublayer(trackLayer)
        
        progressLayer.path = circlePath.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = progressColor?.cgColor
        progressLayer.lineWidth = 10.0
        progressLayer.strokeEnd = 0.0
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
