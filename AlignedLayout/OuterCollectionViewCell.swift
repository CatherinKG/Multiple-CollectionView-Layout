//
//  OuterCollectionViewCell.swift
//  AlignedLayout
//
//  Created by EVENTORG CATHERINE on 26/11/19.
//  Copyright © 2019 Catherine. All rights reserved.
//

import UIKit
import AlignedCollectionViewFlowLayout

class OuterCollectionViewCell: UICollectionViewCell {

    var textCollectionArray: [String] = ["When you \n try your best, \n but you \n don't succeed ","Hai","New Song"," When you get what you want, but not what you need","When you feel so tired, but you can't sleep","Hai","New Song","When you try your best, but you don't succeed"," When you get what you want, but not what you need","When you feel so tired, but you can't sleep","Checking if this is working for now"]
    
    @IBOutlet weak var innerCollectionView: DynamicCollectionView! {
        didSet {
            innerCollectionView.dataSource = self
            innerCollectionView.delegate = self
        }
    }
    
    
    @IBOutlet weak var innerCollectionLayout: AlignedCollectionViewFlowLayout! {
        didSet {
            innerCollectionLayout.verticalAlignment = .top
            innerCollectionLayout.horizontalAlignment = .left
            innerCollectionLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        innerCollectionView.register(UINib(nibName: "CollectionViewInsiderCell", bundle: nil), forCellWithReuseIdentifier: "insideCell")

    }

}


extension OuterCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return textCollectionArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "insideCell", for: indexPath) as! CollectionViewInsiderCell
        cell.text = textCollectionArray[indexPath.row]
        
//        cell.layoutIfNeeded()
        return cell
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        innerCollectionView.layoutIfNeeded()

        return super.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: horizontalFittingPriority, verticalFittingPriority: verticalFittingPriority)
    }
}
