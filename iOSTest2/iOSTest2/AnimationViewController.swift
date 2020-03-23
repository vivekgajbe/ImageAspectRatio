//
//  AnimationViewController.swift
//  iOSTest2
//
//  Created by vivek G on 23/03/20.
//  Copyright © 2020 vivek G. All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController {

     @IBOutlet weak var viwMainContainer: UIView!
        @IBOutlet weak var viwInnerVibrancy: UIView!
        @IBOutlet weak var lblCurrentTime: UILabel!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            RMUtility.shared.setViewWithCronerRadious_Shadow(viw: viwMainContainer)
            self.setControllerPrefrances()
            // Do any additional setup after loading the view, typically from a nib.
        }

        func setCurrentTime()
        {
            lblCurrentTime.text = RMUtility.shared.formatDate(date: NSDate(), format: "hh:mm:ss")
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.setCurrentTime()
            }
        }
        
        func setControllerPrefrances()
        {
            setCurrentTime()
///code is used to add vibrancy/blur effect in view
//            DispatchQueue.main.async {
//                let blurEffect = UIBlurEffect(style: .extraLight)
//                let blurredEffectView = UIVisualEffectView(effect: blurEffect)
//                blurredEffectView.frame = self.viwMainContainer.bounds
//                self.viwMainContainer.addSubview(blurredEffectView)
//            }
//            viwMainContainer.clipsToBounds = true
            
            let imageView = UIView(frame: CGRect(x: 0, y: 0, width: 220, height: 220))
            imageView.backgroundColor = .purple
            imageView.layer.cornerRadius = imageView.frame.height / 2


            viwInnerVibrancy.addSubview(imageView)
            //viwMainContainer.clipsToBounds = true


            let orbit = CAKeyframeAnimation(keyPath: "position")
            var affineTransform = CGAffineTransform(rotationAngle: 300.0)
            affineTransform = affineTransform.rotated(by: CGFloat(Double.pi ))
            let circlePath = UIBezierPath(arcCenter: CGPoint(x: 150,y: 300 ), radius:  CGFloat(200), startAngle: CGFloat(0), endAngle:CGFloat.pi * 2, clockwise: true)
            orbit.path = circlePath.cgPath
            orbit.duration = 3
            orbit.repeatCount = 1000
            orbit.calculationMode = CAAnimationCalculationMode.paced
            orbit.rotationMode = CAAnimationRotationMode.rotateAuto

            imageView.layer.add(orbit, forKey: "orbit")
            viwInnerVibrancy.clipsToBounds = true
            viwInnerVibrancy.sendSubviewToBack(imageView)
            
            //TODO: for left to right
            //self.animation(viewAnimation: imageView)
        }
    //MARK: - method is used to animate view from left to right
        private func animation(viewAnimation: UIView) {
            UIView.animate(withDuration: 1, animations: {
                viewAnimation.frame.origin.x = +viewAnimation.frame.width
            }) { (_) in
                UIView.animate(withDuration: 1, delay: 1, options: [.curveEaseIn], animations: {
                    viewAnimation.frame.origin.x -= viewAnimation.frame.width
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        self.animation(viewAnimation: viewAnimation)
                    }
                })
            }
        }
}
