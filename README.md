# StretchyTextView

UITextView with adjustable spacing between text lines.

Current implementation doesn't use `NSAttributedString`, it is based on `NSLayoutManagerDelegate` which defines padding after each line and `NSTextStorageDelegate` which adjusts input caret sizes.

`StretchyTextView` is easy to use. Just change parameter `lineSpacing` to increase or decrease distance between text lines. Default value is `0.0`.

## Installation

### CocoaPods

The preferred installation method is with [CocoaPods](https://cocoapods.org). Add the following to your `Podfile`:

```ruby
pod 'StretchyTextView', '~> 1.0'
```
