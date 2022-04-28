//
//  ViewController.swift
//  Test
//
//  Created by Fxxx on 2018/11/30.
//  Copyright © 2018 Aaron Feng. All rights reserved.
//

import UIKit

let SCREENWIDTH = UIScreen.main.bounds.width
let SCREENHEIGHT = UIScreen.main.bounds.height

class ViewController: UIViewController {
    
    private let sphereView:AASphereView = {
        let frame = CGRect.init(x: 10, y: (SCREENHEIGHT - SCREENWIDTH) / 2.0, width: SCREENWIDTH - 20, height: SCREENWIDTH)
        let sphereView = AASphereView.init(frame: frame)
        sphereView.backgroundColor = .green
        return sphereView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       
        self.view.addSubview(sphereView)
        
        var tags = [UIView]()
        for i in 0..<50 {
            
            let button = UIButton.init()
            button.setTitle("aa\(i)", for: .normal)
            button.setTitleColor(UIColor.brown, for: .normal)
            button.addTarget(self, action: #selector(buttonAction(btn:)), for: .touchUpInside)
            //button.sizeToFit()
            button.frame = CGRect(x: 0, y: 0, width: 60, height: 60);
            button.backgroundColor = .red;
            tags.append(button)
            
        }
        sphereView.setTagViews(array: tags)
        
    }
    
    @objc func buttonAction(btn: UIButton) {
        print("abc:\(btn.titleLabel?.text ?? "--")");
        sphereView.timerCtr(action: true)
        UIView.animate(withDuration:0.3, delay: 0) {
            btn.transform = CGAffineTransform.init(scaleX: 2.0, y: 2.0);
        } completion: { aa in
            UIView.animate(withDuration: 0.3, delay: 0) {
                btn.transform = CGAffineTransform.init(scaleX: 1.0, y: 1.0);
            } completion: { bb in
                self.sphereView.timerCtr(action: false)
            }
        }
        
    }

}

