//
//  DynamicCollectionPart1ViewController.swift
//  iOSTest2
//
//  Created by vivek G on 22/03/20.
//  Copyright © 2020 vivek G. All rights reserved.
//

import UIKit
import AVFoundation

class DynamicCollectionPart1ViewController: UIViewController {

    @IBOutlet weak var colviwHome:UICollectionView!
    var arrProfile = ["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","34","35","36"]
    var targetWidth: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        targetWidth = (colviwHome.bounds.width - 3 * 5) / 2
        colviwHome?.contentInset = UIEdgeInsets(
            top: 20,
            left: 5,
            bottom: 20,
            right: 5
        )
        // Do any additional setup after loading the view.
    }
    
}


extension DynamicCollectionPart1ViewController : UICollectionViewDelegate,UICollectionViewDataSource , UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrProfile.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = colviwHome.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProfileCollectionViewCell
        let image = UIImage(named:"img\(indexPath.row)")
        cell.imgProfile.image = image
        cell.imgProfile.contentMode = .scaleToFill
        
        cell.imgWidth.constant = targetWidth
        cell.imgHeight.constant = image!.height(forWidth: targetWidth)
        
//        cell.setNeedsLayout()
        cell.layoutIfNeeded()
        print(image!.width(forHeigth: 200))
        cell.imgProfile.layer.cornerRadius = 12
        cell.imgProfile.layer.masksToBounds = true
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cell = colviwHome.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProfileCollectionViewCell
        let image = UIImage(named:"img\(indexPath.row)")
        cell.imgWidth.constant = targetWidth
        cell.imgHeight.constant = image!.height(forWidth: targetWidth)
        
        var size = cell.contentView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        size.width = targetWidth
        size.height = cell.imgHeight.constant
        print(image!.width(forHeigth: 200))
//        cell.setNeedsLayout()
        cell.layoutIfNeeded()
        return size
    }
}

