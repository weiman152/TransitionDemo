//
//  PresentAutumnController.swift
//  TransitionDemo
//
//  Created by iOS on 2018/10/27.
//  Copyright © 2018年 weiman. All rights reserved.
//

import UIKit

class PresentAutumnController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    class func instance() -> PresentAutumnController {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "PresentAutumnController") as! PresentAutumnController
        return vc
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        dismiss(animated: true, completion: {})
    }

}
