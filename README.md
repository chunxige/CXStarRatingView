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

![demo.gif](https://github.com/chunxige/CXStarRatingView/blob/master/Example/demo.gif)
```
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
        
```

## Requirements
iOS9 or later
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
