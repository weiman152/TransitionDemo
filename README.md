# TransitionDemo
学习push和present的Transition转场动画

效果截图：
<br>
1. push
<br><br>

![Alt text](https://github.com/weiman152/TransitionDemo/blob/master/screenShot/QQ20181026-211948.gif)

<br><br>

2. present
<br><br>
![Alt text](https://github.com/weiman152/TransitionDemo/blob/master/screenShot/QQ20181027-183358.gif)

<br><br>
![Alt text](https://github.com/weiman152/TransitionDemo/blob/master/screenShot/3333.gif)

<br><br>
<hr>
<br>

主要类：<br>
PushTransition：
负责push的转场动画，这里只是简单的设计了缩放、从上到下、从下到上的动画。

PresentTransition：
负责present的转场动画，这里也只是简单的设计了缩放、从左到右、从右到左的动画。

使用：

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

说明：这里只是一个转场的demo，具体的复杂动画场景还需要根据需求自定义。可以参考这里的动画实现。

如有错漏，还请指教。
