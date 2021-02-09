//
//  StarIconView.swift
//  StarRate
//
//  Created by Chunxi on 2021/2/7.
//  Copyright © 2021 Jason. All rights reserved.
//

import UIKit

class StarIconView: UIView {
    let foregroundImage: UIImage?
    let backgroundImage: UIImage?
    lazy var foregroundView: StarForegroundView = {
        let iv = StarForegroundView.init(image: foregroundImage)
        return iv
    }()
    let backgroundView: UIImageView = {
        let iv = UIImageView()
        return iv
    }()

    init(foregroundImage: UIImage?, backgroundImage: UIImage?) {
        self.foregroundImage = foregroundImage
        self.backgroundImage = backgroundImage
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        foregroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.translatesAutoresizingMaskIntoConstraints = false

        foregroundView.image = foregroundImage
        backgroundView.image = backgroundImage
        addSubview(backgroundView)
        addSubview(foregroundView)
        
        NSLayoutConstraint.activate([
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),

            foregroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            foregroundView.topAnchor.constraint(equalTo: topAnchor),
            foregroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            foregroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

    // 0...1之间
    var value: CGFloat = 0 {
        didSet {
            setNeedsLayout()
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        foregroundView.imageView.frame.size.width = frame.width
        foregroundView.frame.size.width = frame.width * min(max(value, 0), 1)
    }
}
