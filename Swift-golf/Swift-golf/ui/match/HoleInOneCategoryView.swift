//
//  HoleInOneCategoryView.swift
//  Swift-golf
//
//  Created by xubojoy on 2017/2/20.
//  Copyright © 2017年 xubojoy. All rights reserved.
//

import UIKit
import SnapKit

class HoleInOneCategoryView: UIView {
    
    lazy var collectionView: UICollectionView = { [unowned self] in
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 0 //行间距(最小值)
        flowLayout.minimumInteritemSpacing = 0 //item间距(最小值)
        flowLayout.itemSize = CGSize(width: screen_width/3, height: 70)
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: screen_width, height: 70), collectionViewLayout: flowLayout)
        collectionView.backgroundColor = UIColor.white
        collectionView.delegate = self
        collectionView.dataSource = self
        let nib = UINib(nibName: "CommonCollectionCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "CommonCollectionCell")

        return collectionView
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        self.addSubview(collectionView)
    }
}

extension HoleInOneCategoryView: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CommonCollectionCell", for: indexPath) as! CommonCollectionCell
//        cell.backgroundColor = UIColor.cyan
        cell.renderCommonCollectionCell(item: indexPath.item)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    }
    

}
