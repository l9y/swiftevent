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
    
    var observers : [String: NSMutableArray] = [:]
    
    fileprivate override init (){
        super.init()
    }
    
    func register<T>(_ observer: Observer<T>) {
        let value = NSValue(nonretainedObject: observer)
        append(key: "\(type(of: T.self))", value: value)
    }
    
    func unRegister<T>(_ observer: Observer<T>) {
        let value = NSValue(nonretainedObject: observer)
        remove(key: "\(type(of: T.self))", value: value)
    }
    
    
    open func post<T>(_ message: T) {
        if let list = observers["\(type(of: T.self))"]{
            for item in list {
                if let observer = (item as! NSValue).nonretainedObjectValue as? Observer<T> {
                    observer.receive?(message)
                }
            }
        }
    }
    
    
    
    private func append(key: String, value: NSValue) {
        if observers[key] == nil {
            observers[key] = NSMutableArray()
        }
        observers[key]!.add(value)
    }
    
    
    private func remove(key: String, value: NSValue) {
        observers[key]?.remove(value)
        if 0 == observers[key]?.count {
            observers.removeValue(forKey: key)
        }
    }
}
