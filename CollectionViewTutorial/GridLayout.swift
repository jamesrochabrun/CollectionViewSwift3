//
//  GridLayout.swift
//  PetMessageApp
//
//  Created by James Rochabrun on 12/12/16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

import UIKit

class GridLayout: UICollectionViewFlowLayout {
    
    let itemHeight: CGFloat = 120
    let innerSpace: CGFloat = 1.0
    
    override init() {
        super.init()
        setUpLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
       // setUpLayout()
    }
    
    func setUpLayout() {
        self.minimumLineSpacing = innerSpace
        self.minimumInteritemSpacing = innerSpace
        self.scrollDirection = .vertical
    }
    
    /// here we define the width of each cell, creating a 2 column layout. In case you would create 3 columns, change the number 2 to 3
    func itemWidth() -> CGFloat {
        return (collectionView!.frame.size.width/3)-self.innerSpace
    }
    
    override var itemSize: CGSize {
        set {
            self.itemSize = CGSize(width:itemWidth(), height:itemWidth())
        }
        get {
            return CGSize(width:itemWidth(),height:itemWidth())
        }
    }
    
 
}
