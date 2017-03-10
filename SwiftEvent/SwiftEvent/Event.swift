//
//  Event.swift
//  SwiftEvent
//
//  Created by zhiyuan wang on 17/3/9.
//  Copyright © 2017年 l9y. All rights reserved.
//

import UIKit

open class Event: NSObject {
    
    open static let instance = Event()
    
    var observers: NSMutableArray = NSMutableArray()
    
    fileprivate override init (){
        super.init()
    }
    
    //MARK: register and unregister
    
    ///register an observer
    func register<T>(_ observer: Observer<T>) {
        let value = NSValue(nonretainedObject: observer)
        observers.add(value)
    }
    
    ///unregister an observer
    func unRegister<T>(_ observer: Observer<T>) {
        let value = NSValue(nonretainedObject: observer)
        observers.remove(value)
    }
    
    
    //MARK: public methods 
    
    open func post<T>(_ message: T) {
        for item in observers {
            if let observer = (item as AnyObject).nonretainedObjectValue as? Observer<T> {
                observer.receive?(message)
            }
        }
    }
}
