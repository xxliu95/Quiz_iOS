//
//  ImageStore.swift
//  P4_Quiz10
//
//  Created by Xinxin Liu on 22/11/2019.
//  Copyright © 2019 Xinxin Liu. All rights reserved.
//

import UIKit

var imageCache = [URL: UIImage]()

func image(url: URL) -> UIImage {
    
    if let img = imageCache[url] {
        return img
    }
    
    if let data = try? Data(contentsOf: url),
        let img = UIImage(data: data) {
        imageCache[url] = img
        return img
    }
    
    return UIImage(named: "error")!
}
