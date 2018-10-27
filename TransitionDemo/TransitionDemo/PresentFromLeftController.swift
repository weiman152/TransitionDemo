//
//  PresentFromLeftController.swift
//  TransitionDemo
//
//  Created by iOS on 2018/10/27.
//  Copyright © 2018年 weiman. All rights reserved.
//

import UIKit

class PresentFromLeftController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    class func instance() -> PresentFromLeftController {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "PresentFromLeftController") as! PresentFromLeftController
        return vc
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        dismiss(animated: true) { }
    }
    
    deinit {
        print("PresentFromLeftController释放了")
    }

}
