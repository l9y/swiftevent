//
//  ViewController.swift
//  Example
//
//  Created by zhiyuan wang on 17/3/9.
//  Copyright © 2017年 l9y. All rights reserved.
//

import UIKit
import SwiftEvent

class ViewController: UIViewController {

    let clickEventObserver = Observer<ClickEvent>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clickEventObserver.receive = {[weak self] clickEvent in
            self?.onReceiveClickEvent(clickEvent)
        }
    }


    @IBAction func sendClickEvent(sender: AnyObject) {
        Event.instance.post(ClickEvent())
    }
    
    
    func onReceiveClickEvent(clickEvent: ClickEvent) {
        print("click \(clickEvent)")
    }

}

