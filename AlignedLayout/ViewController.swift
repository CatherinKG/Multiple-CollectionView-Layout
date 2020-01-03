//
//  ViewController.swift
//  AlignedLayout
//
//  Created by EVENTORG CATHERINE on 26/11/19.
//  Copyright © 2019 Catherine. All rights reserved.
//

import UIKit
import AlignedCollectionViewFlowLayout

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
        

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableviewCell", for: indexPath) as! OuterTableViewCell
//        cell.layoutIfNeeded()

        return cell
    }
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

class DynamicCollectionView: UICollectionView {
    override func layoutSubviews() {
        super.layoutSubviews()
        if !__CGSizeEqualToSize(bounds.size, self.intrinsicContentSize) {
            self.invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        return collectionViewLayout.collectionViewContentSize
    }
}
