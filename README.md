# live-streaming-demo
## Description
The purpose of this project is to practice and learn how to build beautiful UI by UICollectionViews.

The APIs and images are public powered by DouYu, a live-streaming company.
## Libraries and tools used
- [Alamofire](https://github.com/Alamofire/Alamofire) - Alamofire is an HTTP networking library written in Swift.
- [Kingfisher](https://github.com/onevcat/Kingfisher) - A lightweight, pure-Swift library for downloading and caching images from the web.

## Repository is archived, here is the demo what I have done.
![](https://github.com/zijiazhai/live-streaming-demo/blob/master/Github-Gif/ezgif.com-video-to-gif.gif)

## Issues
#### Issue 1: SetValueForKeys is not working in swift 4
```
class CycleModel: NSObject {
   @objc var title : String = ""
   @objc var pic_url : String = ""
   @objc var room : [String : NSObject]? {
        didSet {
            guard let room = room else  { return }
            anchor = AnchorModel(dict: room)
        }
    }
  @objc  var anchor : AnchorModel?
    init(dict : [String : NSObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}
```
```
The reason for why setValuesForKeys not working is due to @objc flag. 
In Swift 3, @objc was implanted automatically, but in Swift 4, this no longer is the case.
Therefore, for this API to work in Swift 4, simply make your attributes @objc attributes.
```
