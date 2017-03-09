//
//  Event.swift
//  SwiftEvent
//
//  Created by zhiyuan wang on 17/3/9.
//  Copyright © 2017年 l9y. All rights reserved.
//

import UIKit

public class Event: NSObject {
    
    public static let instance = Event()
    
    var observers: NSMutableArray = NSMutableArray()
    
    private override init (){
        super.init()
    }
    
    ///register an observer
    func register<T>(observer: Observer<T>) {
        let value = NSValue(nonretainedObject: observer)
        observers.addObject(value)
    }
    
    ///unregister an observer
    func unRegister<T>(observer: Observer<T>) {
        let value = NSValue(nonretainedObject: observer)
        observers.removeObject(value)
    }
    
    
    public func post<T>(message: T) {
        for item in observers {
            if let observer = item.nonretainedObjectValue as? Observer<T> {
                observer.receive?(message)
            }
        }
    }
}
