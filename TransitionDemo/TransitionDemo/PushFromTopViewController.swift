//
//  PushFromTopViewController.swift
//  TransitionDemo
//
//  Created by iOS on 2018/10/26.
//  Copyright © 2018年 weiman. All rights reserved.
//

import UIKit

class PushFromTopViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    class func instance() -> PushFromTopViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "PushFromTopViewController") as! PushFromTopViewController
        return vc
    }
    
    @IBAction func gotoVCAction(_ sender: Any) {
        // 测试正常跳转
        let vc = PushSpringViewController.instance()
        navigationController?.pushViewController(vc, animated: true)
    }
}
