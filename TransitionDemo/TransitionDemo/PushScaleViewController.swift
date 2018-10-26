//
//  PushScaleViewController.swift
//  TransitionDemo
//
//  Created by iOS on 2018/10/26.
//  Copyright © 2018年 weiman. All rights reserved.
//

import UIKit

class PushScaleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    class func instance() -> PushScaleViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "PushScaleViewController") as! PushScaleViewController
        return vc
    }

}
