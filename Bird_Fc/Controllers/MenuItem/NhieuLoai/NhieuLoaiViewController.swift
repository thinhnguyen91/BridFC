//
//  NhieuLoaiViewController.swift
//  Bird_Fc
//
//  Created by Thinh Nguyen on 12/13/16.
//  Copyright © 2016 Thinh Nguyen. All rights reserved.
//

import UIKit
import SwiftUtils

class NhieuLoaiViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var images = Image.ImageKhac
    var titleLables = StringTitle.TitleKhac
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(PublicViewCell.self)
        // Do any additional setup after loading the view.
    }
}
extension NhieuLoaiViewController: UICollectionViewDelegateFlowLayout,UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeue(PublicViewCell.self, forIndexPath: indexPath)
        cell.imageCell.image = images[(indexPath as NSIndexPath).row]
        cell.titleLabel.text = titleLables[(indexPath as NSIndexPath).row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let width = (screenWidth - 40) / 3
        let height = (width * 130) / 93
        return CGSize(width: width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let detail = DetailViewController.vc()
        detail.stringMm3 = String(indexPath.row) + "11"
        self.navigationController?.pushViewController(detail, animated: true)
        print((indexPath as NSIndexPath).row)
        
    }
    
}

