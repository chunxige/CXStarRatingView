# CXStarRatingView

[![CI Status](https://img.shields.io/travis/1193700248@qq.com/CXStarRatingView.svg?style=flat)](https://travis-ci.org/1193700248@qq.com/CXStarRatingView)
[![Version](https://img.shields.io/cocoapods/v/CXStarRatingView.svg?style=flat)](https://cocoapods.org/pods/CXStarRatingView)
[![License](https://img.shields.io/cocoapods/l/CXStarRatingView.svg?style=flat)](https://cocoapods.org/pods/CXStarRatingView)
[![Platform](https://img.shields.io/cocoapods/p/CXStarRatingView.svg?style=flat)](https://cocoapods.org/pods/CXStarRatingView)

## Feature
- 支持手动布局和自动布局
- 支持点击和滑动手势
- 支持半星、整星、任意星


 
## Example

![screen_shot.gif](https://github.com/chunxige/CXStarRatingView/blob/master/Example/screen_shot.gif)
```
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
    starView.heightAnchor.constraint(equalToConstant: 40)
    ])
        
 // MARK: - 手动布局
let star2View = CXStarRatingView.init(forgroundStarImage: UIImage(named:     "star_red"),
                                           backgroundStarImage: UIImage(named: "star_gray"),
                                           style: .half)
star2View.frame = CGRect.init(x: 0, y: 0, width: 200, height: 40)
star2View.center = CGPoint.init(x: view.center.x, y: 300)
star2View.currentStarValue = 3
star2View.currentValueDidChangeBlock = { value in
     print(value)
}
view.addSubview(star2View)
```

## Requirements
iOS9
## Installation

CXStarRatingView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
target 'Project' do
pod 'CXStarRatingView'
end
```

## Author

1193700248@qq.com

## License

CXStarRatingView is available under the MIT license. See the LICENSE file for more info.
