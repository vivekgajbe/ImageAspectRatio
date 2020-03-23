//
//  DynamicCollectionPart2ViewController.swift
//  iOSTest2
//
//  Created by vivek G on 22/03/20.
//  Copyright © 2020 vivek G. All rights reserved.
//

import UIKit
import AVFoundation

class DynamicCollectionPart2ViewController: UIViewController
{
    
    @IBOutlet weak var colviwHome:UICollectionView!
    var arrProfile = ["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","34","35","36"]
    var cellWidth: CGFloat = 0.0
    var estimatedTableHeight: CGFloat = 160.0
    override func viewDidLoad() {
        cellWidth = colviwHome.bounds.width - 15
        super.viewDidLoad()
        colviwHome?.contentInset = UIEdgeInsets(
            top: 20,
            left: 5,
            bottom: 20,
            right: 5
        )
        // Do any additional setup after loading the view.
    }
}


extension DynamicCollectionPart2ViewController : UICollectionViewDelegate,UICollectionViewDataSource , UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrProfile.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = colviwHome.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProfileCollectionViewCell
        let image = UIImage(named:"img\(indexPath.row)")
        cell.imgProfile.image = image
        
        var cellWidth : CGFloat = 0.0
        var callHeight : CGFloat = 0.0
        if indexPath.row % 2 == 0
        {
            let image = UIImage(named:"img\(indexPath.row)")
            let image1 = UIImage(named:"img\(indexPath.row + 1)")
            cellWidth = self.getTagetedWidth(img1: image!, img2: image1!,bIsOdd: true).cellwidth
            callHeight = self.getTagetedWidth(img1: image!, img2: image1!,bIsOdd: true).cellheight
        }
        else
        {
            let image = UIImage(named:"img\(indexPath.row - 1)")
            let image1 = UIImage(named:"img\(indexPath.row)")
            cellWidth = self.getTagetedWidth(img1: image!, img2: image1!,bIsOdd:false).cellwidth
            callHeight = self.getTagetedWidth(img1: image!, img2: image1!,bIsOdd: true).cellheight
        }
        
        cell.imgWidth.constant = cellWidth
        cell.imgHeight.constant = callHeight
        
        cell.setDefaultParam()
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cell = colviwHome.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProfileCollectionViewCell
        
        var cellWidth : CGFloat = 0.0
        var callHeight : CGFloat = 0.0
        if indexPath.row % 2 == 0
        {
            let image = UIImage(named:"img\(indexPath.row)")
            let image1 = UIImage(named:"img\(indexPath.row + 1)")
            cellWidth = self.getTagetedWidth(img1: image!, img2: image1!,bIsOdd: true).cellwidth
            callHeight = self.getTagetedWidth(img1: image!, img2: image1!,bIsOdd: true).cellheight
        }
        else
        {
            let image = UIImage(named:"img\(indexPath.row - 1)")
            let image1 = UIImage(named:"img\(indexPath.row)")
            cellWidth = self.getTagetedWidth(img1: image!, img2: image1!,bIsOdd:false).cellwidth
            callHeight = self.getTagetedWidth(img1: image!, img2: image1!,bIsOdd: true).cellheight
        }
        
        cell.imgWidth.constant = cellWidth
        cell.imgHeight.constant = callHeight
        
        var size = cell.contentView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        size.width = cellWidth
        size.height = callHeight
        return size
    }
    func getTagetedWidth(img1:UIImage,img2:UIImage,bIsOdd:Bool = true) -> (cellwidth:CGFloat,cellheight:CGFloat)
    {
        let img1_Width = img1.width(forHeigth: estimatedTableHeight)
        let img2_Width = img2.width(forHeigth: estimatedTableHeight)
        let dynamicCellWidthRatio = cellWidth / (img1_Width + img2_Width)
        let iDynamicCellWidth = bIsOdd ? (img1_Width * dynamicCellWidthRatio) : (img2_Width * dynamicCellWidthRatio)
        let iCellHeight = ( img1.height(forWidth: img1_Width) > img2.height(forWidth: img2_Width) ? img1.height(forWidth: img1_Width) : img2.height(forWidth: img2_Width))
        let iDynamicCellHeight = iCellHeight * dynamicCellWidthRatio
        return (iDynamicCellWidth,iDynamicCellHeight)
    }
}
class ProfileCollectionViewCell: UICollectionViewCell
{
    @IBOutlet weak var imgProfile : UIImageView!
    @IBOutlet weak var imgHeight: NSLayoutConstraint!
    @IBOutlet weak var imgWidth: NSLayoutConstraint!
    
    func setDefaultParam()
    {
        self.imgProfile.contentMode = .scaleAspectFit
        self.setNeedsLayout()
        self.layoutIfNeeded()
        self.imgProfile.layer.cornerRadius = 12
        self.imgProfile.layer.masksToBounds = true
    }
}

public extension UIImage {
     //Calculates the best height of the image for available width.
    public func height(forWidth width: CGFloat) -> CGFloat {
        let boundingRect = CGRect(
            x: 0,
            y: 0,
            width: width,
            height: CGFloat(MAXFLOAT)
        )
        let rect = AVMakeRect(
            aspectRatio: size,
            insideRect: boundingRect
        )
        return rect.size.height
    }
    //Calculates the best width of the image for available height.
    public func width(forHeigth height: CGFloat) -> CGFloat {
        let boundingRect = CGRect(
            x: 0,
            y: 0,
            width: CGFloat(MAXFLOAT),
            height: height
        )
        let rect = AVMakeRect(
            aspectRatio: size,
            insideRect: boundingRect
        )
        return rect.size.width
    }
}
