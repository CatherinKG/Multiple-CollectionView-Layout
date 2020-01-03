//
//  CollectionViewInsiderCell.swift
//  AlignedLayout
//
//  Created by EVENTORG CATHERINE on 26/11/19.
//  Copyright © 2019 Catherine. All rights reserved.
//

import UIKit

class CollectionViewInsiderCell: UICollectionViewCell {
    
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet private var maxWidthConstraint: NSLayoutConstraint! {
        didSet {
            maxWidthConstraint.isActive = false
        }
    }
    
    var maxWidth: CGFloat? = nil {
        didSet {
            guard let maxWidth = maxWidth else {
                return
            }
            maxWidthConstraint.isActive = true
            maxWidthConstraint.constant = maxWidth
        }
    }
    
    
    var text: String = "" {
        didSet {
            textLabel.text = text
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.leftAnchor.constraint(equalTo: leftAnchor),
            contentView.rightAnchor.constraint(equalTo: rightAnchor),
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
    }
    
    
    

}
