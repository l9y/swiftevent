//
//  Observer.swift
//  SwiftEvent
//
//  Created by zhiyuan wang on 17/3/9.
//  Copyright © 2017年 l9y. All rights reserved.
//

import UIKit

public class Observer<T>: NSObject {

    public var receive: (T -> ())?
    
    public override init() {
        super.init()
        Event.instance.register(self)
    }
    
    deinit {
        Event.instance.unRegister(self)
    }
}
