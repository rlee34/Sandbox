//
//  ViewController.swift
//  Animation
//
//  Created by Ryan Lee on 2/21/17.
//  Copyright © 2017 Ryan Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tap: UIButton!
    @IBAction func tapped(_ sender: Any) {
        tap.isHidden = true
        
        UIView.animate(withDuration: 1, delay: 0, options: [],
           animations: { [unowned self] in
            switch self.currentAnimation {
            case 0:
                self.imageView.transform = CGAffineTransform(scaleX: 2, y: 2)
                
            default:
                break
            }
        }) { [unowned self] (finished: Bool) in
            self.tap.isHidden = false
        }
        
        currentAnimation += 1
        
        if currentAnimation > 7 {
            currentAnimation = 0
        }
    }

    var imageView: UIImageView!
    var currentAnimation = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView = UIImageView(image: UIImage(named: "penguin"))
        imageView.center = CGPoint(x: 512, y: 384)
        view.addSubview(imageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

