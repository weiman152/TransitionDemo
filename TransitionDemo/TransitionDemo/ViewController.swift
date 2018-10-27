//
//  ViewController.swift
//  TransitionDemo
//
//  Created by iOS on 2018/10/26.
//  Copyright © 2018年 weiman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func pushWithScale(_ sender: Any) {
        
        let vc = PushScaleViewController.instance()
        PushTransition.pushWithTransition(fromVC: self,
                                          toVC: vc,
                                          type: .scale,
                                          duration: 1.0)
        
    }
    
    @IBAction func pushFromTop(_ sender: Any) {
        
        let vc = PushFromTopViewController.instance()
        PushTransition.pushWithTransition(fromVC: self,
                                          toVC: vc,
                                          type: .formTop,
                                          duration: 0.75)
    }
    
    @IBAction func pushFromBottom(_ sender: Any) {
        let vc = PushFromBotomViewController.instance()
        PushTransition.pushWithTransition(fromVC: self,
                                          toVC: vc,
                                          type: .fromBottom,
                                          duration: 2.0)
    }
    
    @IBAction func presentWithScale(_ sender: Any) {
        
        let vc = PresentScaleViewController.instance()
        PresentTransition.presentWithAnimate(fromVC: self, toVC: vc)
    }
    
    @IBAction func presentFromLeft(_ sender: Any) {
        let vc = PresentFromLeftController.instance()
        PresentTransition.presentWithAnimate(fromVC: self,
                                             toVC: vc,
                                             duration: 1.5,
                                             animate: .fromLeft)
    }
    
    @IBAction func presentFromRight(_ sender: Any) {
        let vc = PresentFromRightController.instance()
        PresentTransition.presentWithAnimate(fromVC: self,
                                             toVC: vc,
                                             duration: 1.5,
                                             animate: .fromRight)
    }
}

