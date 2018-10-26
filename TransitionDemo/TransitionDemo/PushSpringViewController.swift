//
//  PushSpringViewController.swift
//  TransitionDemo
//
//  Created by iOS on 2018/10/26.
//  Copyright © 2018年 weiman. All rights reserved.
//

import UIKit

class PushSpringViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    class func instance() -> PushSpringViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "PushSpringViewController") as! PushSpringViewController
        return vc
    }
}
