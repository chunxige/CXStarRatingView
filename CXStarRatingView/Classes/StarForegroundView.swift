//
//  StarForegroundView.swift
//  StarRate
//
//  Created by Chunxi on 2021/2/7.
//  Copyright © 2021 Jason. All rights reserved.

import UIKit

class StarForegroundView: UIView {
    var image: UIImage?
    let imageView = UIImageView()
    init(image: UIImage?) {
        self.image = image
        super.init(frame: .zero)
        clipsToBounds = true
        imageView.image = image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
