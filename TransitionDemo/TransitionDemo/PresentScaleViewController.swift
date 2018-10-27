//
//  PresentScaleViewController.swift
//  TransitionDemo
//
//  Created by iOS on 2018/10/27.
//  Copyright © 2018年 weiman. All rights reserved.
//

import UIKit

class PresentScaleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    class func instance() -> PresentScaleViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "PresentScaleViewController") as! PresentScaleViewController
        return vc
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        dismiss(animated: true) { }
    }
    
    deinit {
        print("PresentScaleViewController释放了")
    }
}
