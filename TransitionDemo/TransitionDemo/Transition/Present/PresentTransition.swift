//
//  PresentTransition.swift
//  TransitionDemo
//
//  Created by iOS on 2018/10/26.
//  Copyright © 2018年 weiman. All rights reserved.
//

import UIKit

class PresentTransition: NSObject {
    
    enum Animate {
        case scale
        case fromLeft
        case fromRight
    }
    
    enum Transition {
        case present
        case dismiss
    }
    
    private let ScreenWidth = UIScreen.main.bounds.size.width
    private let ScreenHeight = UIScreen.main.bounds.size.height
    // 设置转场代理
    static private let transition = PresentTransition()
    
    static private var duration = 1.0
    static private var type: Animate = .scale
    static private var tran: Transition = .present
    
    static func presentWithAnimate(fromVC: UIViewController,
                            toVC: UIViewController,
                            duration: Double = 1.0,
                            animate: Animate = .scale) {
        PresentTransition.duration = duration
        PresentTransition.type = animate
        
        toVC.transitioningDelegate = PresentTransition.transition
        fromVC.present(toVC, animated: true) { }
    }

}

extension PresentTransition: UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return PresentTransition.duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        switch PresentTransition.tran {
        case .present:
            presentTransition(transitionContext: transitionContext)
        case .dismiss:
            dismissTransition(transitionContext: transitionContext)
        }
    }
}

extension PresentTransition: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        PresentTransition.tran = .present
        return PresentTransition()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        PresentTransition.tran = .dismiss
        return PresentTransition()
    }
}

extension PresentTransition {
    
    private func presentTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        let toVC = transitionContext.viewController(forKey: .to)
        let fromVC = transitionContext.viewController(forKey: .from)
        
        guard let fromView = fromVC?.view,
            let toView = toVC?.view else {
                return
        }
        
        transitionContext.containerView.addSubview(toView)
        
        switch PresentTransition.type {
        case .scale:
            scalePresent(fromView: fromView,
                         toView: toView,
                         transitionContext: transitionContext)
        case .fromLeft:
            fromLeftPresent(fromView: fromView,
                            toView: toView,
                            transitionContext: transitionContext)
        case .fromRight:
            break
        }
        
    }
    
    private func dismissTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        let toVC = transitionContext.viewController(forKey: .to)
        let fromVC = transitionContext.viewController(forKey: .from)
        
        guard let fromView = fromVC?.view,
            let toView = toVC?.view else {
                return
        }
        
        switch PresentTransition.type {
        case .scale:
            scaleDismiss(fromView: fromView,
                         toView: toView,
                         transitionContext: transitionContext)
        case .fromLeft:
            fromLeftDismiss(fromView: fromView,
                            toView: toView,
                            transitionContext: transitionContext)
        case .fromRight:
            break
        }
    }
    
    private func scalePresent(fromView: UIView,
                              toView: UIView,
                              transitionContext: UIViewControllerContextTransitioning)
    {
        toView.alpha = 0.0
        toView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        UIView.animate(withDuration: PresentTransition.duration, animations: {
            toView.alpha = 1.0
            toView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }) { (_) in
            toView.alpha = 1.0
            toView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            transitionContext.completeTransition(true)
        }
    }
    
    private func scaleDismiss(fromView: UIView,
                              toView: UIView,
                              transitionContext: UIViewControllerContextTransitioning)
    {
        transitionContext.containerView.insertSubview(toView, belowSubview: fromView)
        UIView.animate(withDuration: PresentTransition.duration, animations: {
            fromView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        }) { (_) in
            transitionContext.completeTransition(true)
        }
    }
    
    private func fromLeftPresent(fromView: UIView,
                                 toView: UIView,
                                 transitionContext: UIViewControllerContextTransitioning)
    {
        toView.frame = CGRect(x: -ScreenWidth, y: 0, width: ScreenWidth, height: ScreenHeight)
        UIView.animate(withDuration: PresentTransition.duration, animations: {
            toView.frame = CGRect(x: 0, y: 0, width: self.ScreenWidth, height: self.ScreenHeight)
            toView.layoutSubviews()
        }) { (_) in
            transitionContext.completeTransition(true)
        }
        
    }
    
    private func fromLeftDismiss(fromView: UIView,
                                 toView: UIView,
                                 transitionContext: UIViewControllerContextTransitioning)
    {
        transitionContext.containerView.insertSubview(toView, belowSubview: fromView)
        UIView.animate(withDuration: PresentTransition.duration, animations: {
            fromView.transform = CGAffineTransform(translationX: 0, y: self.ScreenHeight)
            fromView.alpha = 0
        }) { (_) in
            transitionContext.completeTransition(true)
        }
        
    }
}
