//
//  ViewController.swift
//  UILongPressGestureSample
//
//  Created by satoshi.marumoto on 2020/03/31.
//  Copyright © 2020 satoshi.marumoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label:UILabel!
    
    var count = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture:UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(ViewController.tapped(_:)))
        tapGesture.delegate = self
        view.addGestureRecognizer(tapGesture)
        
        // ロングプレス
        let longPressGesture =
            UILongPressGestureRecognizer(target: self,
                                         action: #selector(ViewController.longPress(_:)))
        longPressGesture.delegate = self
        // Viewに追加.
        view.addGestureRecognizer(longPressGesture)
    }
    
    @objc func tapped(_ sender: UITapGestureRecognizer){
        if sender.state == .ended {
            label.text = "Tapped ! \(count)"
            count += 1
        } else if sender.state == .began {
            print("Tap began")
        }
    }
    
    @objc func longPress(_ sender: UILongPressGestureRecognizer){
           if sender.state == .began {
               print("LongPress began")
           }
           else if sender.state == .ended {
            label.text = "Long Pressed !"
        }
    }

}

extension ViewController: UIGestureRecognizerDelegate {
    
}
