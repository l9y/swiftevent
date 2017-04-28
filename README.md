# SwiftEvent

## Installation

### Carthage
```
github "l9y/SwiftEvent"
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
