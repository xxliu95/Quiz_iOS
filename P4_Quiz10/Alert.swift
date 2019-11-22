//
//  Alert.swift
//  P4_Quiz10
//
//  Created by Xinxin Liu on 22/11/2019.
//  Copyright © 2019 Xinxin Liu. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func alert(msg: String, completionHandler: (() -> ())? = nil) {
        
        print("Alert: \(msg)")
        
        let avc = UIAlertController(title: "Result", message: msg, preferredStyle: .alert)
        
        avc.addAction(UIAlertAction(title: "OK", style: .default) { (action) in completionHandler?()})
        
        present(avc, animated: true)
    }
}
