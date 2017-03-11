# SwiftEvent

## Installation

### Carthage
####swift 3
```
github "l9y/SwiftEvent"
```
####swift 2.3
```
github "l9y/SwiftEvent" == 1.0
```

## Usage

### Custom your event

```swift
class ClickEvent: NSObject {
}
```

### Instance Event Observer
```swift
let clickEventObserver = Observer<ClickEvent>()

clickEventObserver.receive = {[weak self] clickEvent in
    //TODO: handle event
}
```
### Post event
```swift
Event.instance.post(ClickEvent())

```
