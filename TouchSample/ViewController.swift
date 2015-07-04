//
//  ViewController.swift
//  TouchSample
//
//  Created by shinobu okano on 2015/07/04.
//  Copyright (c) 2015年 shinobu okano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var SampleView : UIView!
    @IBOutlet weak var text: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var rect : CGRect = CGRectMake(0, 0, 80, 80)
        SampleView = UIView(frame:rect)
        SampleView.backgroundColor = UIColor.redColor()
        SampleView.hidden = true
        self.view.addSubview(SampleView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        var touch = touches.first as! UITouch
        var nowP = touch.locationInView(self.view)
        SampleView.center = nowP
        if SampleView.hidden { SampleView.hidden = false }
        
        let tapCount = touch.tapCount
        text.text = "\(tapCount)"
    }
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        var touch = touches.first as! UITouch
        var nowP : CGPoint = touch.locationInView(self.view)  // 現在タッチした位置
        var oldP : CGPoint = touch.previousLocationInView(self.view)  // 前回タッチした位置
        var deltaX : CGFloat = nowP.x - oldP.x  // 2点の差を現在の矩形の位置に加算して
        var deltaY : CGFloat = nowP.y - oldP.y  // 指が移動した位置に矩形を表示
        SampleView.center = CGPointMake(SampleView.center.x + deltaX, SampleView.center.y + deltaY)
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        if !SampleView.hidden { SampleView.hidden = true }
    }

}

