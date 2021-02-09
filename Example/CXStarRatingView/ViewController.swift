//
//  ViewController.swift
//  CXStarRatingView
//
//  Created by 1193700248@qq.com on 02/09/2021.
//  Copyright (c) 2021 1193700248@qq.com. All rights reserved.
//

import UIKit
import CXStarRatingView

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: - 自动布局
        let starView = CXStarRatingView.init(forgroundStarImage: UIImage(named: "star_red"),
                                           backgroundStarImage: UIImage(named: "star_gray"),
                                           style: .whole)
        starView.translatesAutoresizingMaskIntoConstraints = false
        starView.currentStarValue = 3.5
        starView.currentValueDidChangeBlock = { value in
            print(value)
        }
        view.addSubview(starView)
        NSLayoutConstraint.activate([
            starView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            starView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            starView.widthAnchor.constraint(equalToConstant: 200),
            starView.heightAnchor.constraint(equalToConstant: 40),
        ])

        // MARK: - 手动布局
        let star2View = CXStarRatingView.init(forgroundStarImage: UIImage(named: "star_red"),
                                           backgroundStarImage: UIImage(named: "star_gray"),
                                           style: .half)
        star2View.frame = CGRect.init(x: 0, y: 0, width: 200, height: 40)
        star2View.center = CGPoint.init(x: view.center.x, y: 300)
        star2View.currentStarValue = 3
        star2View.currentValueDidChangeBlock = { value in
            print(value)
        }
        view.addSubview(star2View)

        // MARK: - 手动布局
        let star3View = CXStarRatingView.init(forgroundStarImage: UIImage(named: "star_red"),
                                           backgroundStarImage: UIImage(named: "star_gray"),
                                           style: .any)
        star3View.frame = CGRect.init(x: 0, y: 0, width: 200, height: 40)
        star3View.center = CGPoint.init(x: view.center.x, y: 400)
        star3View.currentStarValue = 3
        star3View.currentValueDidChangeBlock = { value in
            print(value)
        }
        view.addSubview(star3View)

    }

}

