//
//  StarRateView2.swift
//  StarRate
//
//  Created by Chunxi on 2021/2/7.
//  Copyright © 2021 Jason. All rights reserved.
//

import UIKit

public class CXStarRatingView: UIView {

    // MARK: - 最小评分模式
    public enum Style {
        case half  // 半星
        case whole // 整星
        case any   // 任意长度
    }

    var backgroundStarImage: UIImage?
    var foregroundStarImage: UIImage?
    let style: Style
    let starSpacing: CGFloat
    let totalStarCount: Int

    // MARK: - init
    public init(forgroundStarImage: UIImage?,
         backgroundStarImage: UIImage?,
         style: Style = .whole,
         starSpacing: CGFloat = 5,
         totalStarCount: Int = 5) {
        self.foregroundStarImage = forgroundStarImage
        self.backgroundStarImage = backgroundStarImage
        self.style = style
        self.starSpacing = starSpacing
        self.totalStarCount = totalStarCount
        super.init(frame: .zero)
        setup()
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - property
    public var isEnabledGes = true {
        didSet {
            isEnabledPanGes = isEnabledGes
            isEnabledTapGes = isEnabledGes
        }
    }

    public var isEnabledPanGes = true {
        didSet {
            panGes.isEnabled = isEnabledPanGes
        }
    }
    public var isEnabledTapGes = true {
        didSet {
            tapGes.isEnabled = isEnabledTapGes
        }
    }

    public var currentValueDidChangeBlock: ((CGFloat) -> Void) = { _ in }

    public var currentStarValue: CGFloat = 0 {
        didSet {
            let intValue = Int(currentStarValue)
            let decimalValue = currentStarValue - CGFloat(intValue)
            switch style {
            case .whole:
                for (index, v) in backgroundStackView.arrangedSubviews.enumerated() {
                    let starIcon = v as! StarIconView
                    if index < intValue {
                        starIcon.value = 1
                    } else {
                        starIcon.value = 0
                    }
                }
            case .half:
                for (index, v) in backgroundStackView.arrangedSubviews.enumerated() {
                    let starIcon = v as! StarIconView
                    if index < intValue {
                        starIcon.value = 1
                    } else if index == intValue, decimalValue > 0 {
                        //半个星星采用四舍五入
                        if decimalValue > 0.5 {
                            starIcon.value = 1
                        } else {
                            starIcon.value = 0.5
                        }
                    } else {
                        starIcon.value = 0
                    }
                }
            case .any:
                for (index, v) in backgroundStackView.arrangedSubviews.enumerated() {
                    let starIcon = v as! StarIconView
                    if index < intValue {
                        starIcon.value = 1
                    } else if index == intValue, decimalValue > 0 {
                        starIcon.value = decimalValue
                    } else {
                        starIcon.value = 0
                    }
                }
            }
        }
    }

    lazy var panGes = UIPanGestureRecognizer(target: self, action: #selector(panAction(_:)))
    lazy var tapGes = UITapGestureRecognizer(target: self, action: #selector(tapAction(_:)))
    public lazy var backgroundStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .center
        stack.spacing = starSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    internal func setup() {
        addSubview(backgroundStackView)
        let constraints = [backgroundStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
                           backgroundStackView.topAnchor.constraint(equalTo: topAnchor),
                           backgroundStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
                           backgroundStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
                          ]
        NSLayoutConstraint.activate(constraints)
        for _ in 0..<totalStarCount {
            let v = StarIconView.init(foregroundImage: foregroundStarImage,
                                      backgroundImage: backgroundStarImage)
            backgroundStackView.addArrangedSubview(v)
        }
        addGestureRecognizer(panGes)
        addGestureRecognizer(tapGes)
    }

    internal func updateWithPoint(_ point: CGPoint) {
        for (index, v) in backgroundStackView.arrangedSubviews.enumerated() where v.frame.contains(point) {
            switch style {
            case .whole:
                currentStarValue = CGFloat(index) + 1
            case .half:
                var currentStar = CGFloat(index) + 1
                var prefix = v.frame
                prefix.size.width = v.frame.width / 2
                if prefix.contains(point) {
                    currentStar -= 0.5
                }
                currentStarValue = currentStar
            case .any:
                var decimalValue = (point.x - v.frame.minX) / v.frame.width
                // 滑动或者点击只能无限接近于1，为了防止用户无法达到1，采用0.9阀值
                if decimalValue > 0.9 {
                    decimalValue = 1
                }
                currentStarValue = CGFloat(index) + decimalValue
            }
        }
        currentValueDidChangeBlock(currentStarValue)
    }

    // MARK: - Ges action
    @objc private func tapAction(_ ges: UITapGestureRecognizer) {
        let point = ges.location(in: backgroundStackView)
        updateWithPoint(point)
    }

    @objc private func panAction(_ ges: UIPanGestureRecognizer) {
        switch ges.state {
        case .changed:
            let point = ges.location(in: backgroundStackView)
            updateWithPoint(point)
        case .ended:
            let point = ges.location(in: backgroundStackView)
            updateWithPoint(point)
        default:
            break
        }
    }
}
