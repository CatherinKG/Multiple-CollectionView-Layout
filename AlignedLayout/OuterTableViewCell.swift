//
//  OuterTableViewCell.swift
//  AlignedLayout
//
//  Created by EVENTORG CATHERINE on 26/11/19.
//  Copyright © 2019 Catherine. All rights reserved.
//

import UIKit
import AlignedCollectionViewFlowLayout

class OuterTableViewCell: UITableViewCell {

    var textCollectionArray: [String] = ["Hai","New Song","When you try your best, but you don't succeed"," When you get what you want, but not what you need","When you feel so tired, but you can't sleep","Hai","New Song","When you try your best, but you don't succeed"," When you get what you want, but not what you need","When you feel so tired, but you can't sleep"]

    @IBOutlet weak var collectionView: DynamicCollectionView! {
        didSet {
            collectionView.dataSource = self
            collectionView.delegate = self
        }
    }
    
    @IBOutlet weak var collectionLayout: AlignedCollectionViewFlowLayout! {
        didSet {
            collectionLayout.verticalAlignment = .top
            collectionLayout.horizontalAlignment = .left
            collectionLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(UINib(nibName: "OuterCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "outerCell")
        collectionView.register(UINib(nibName: "CollectionViewInsiderCell", bundle: nil), forCellWithReuseIdentifier: "insideCell")
        

    }
    

}
extension OuterTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return textCollectionArray.count
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "insideCell", for: indexPath) as! CollectionViewInsiderCell
//        cell.text = textCollectionArray[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "outerCell", for: indexPath) as! OuterCollectionViewCell
//        cell.layoutIfNeeded()
        return cell
    }
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        collectionView.layoutSubviews()
        return super.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: horizontalFittingPriority, verticalFittingPriority: verticalFittingPriority)
    }
    
    
    
}


