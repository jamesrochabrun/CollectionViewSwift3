//
//  ViewController.swift
//  CollectionViewTutorial
//
//  Created by James Rochabrun on 12/13/16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var gridCollectionView: UICollectionView!
    var gridLayout: GridLayout!
    var fullImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        gridLayout = GridLayout()
        gridCollectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: gridLayout)
        gridCollectionView.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        gridCollectionView.showsVerticalScrollIndicator = false
        gridCollectionView.showsHorizontalScrollIndicator = false
        gridCollectionView.dataSource = self
        gridCollectionView.delegate = self
        gridCollectionView!.register(ImageCell.self, forCellWithReuseIdentifier: "cell")
        self.view.addSubview(gridCollectionView)
        
        fullImageView = UIImageView()
        fullImageView.contentMode = .scaleAspectFit
        fullImageView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        fullImageView.isUserInteractionEnabled = true
        fullImageView.alpha = 0
        self.view.addSubview(fullImageView)
        
        let dismissWihtTap = UITapGestureRecognizer(target: self, action: #selector(hideFullImage))
        fullImageView.addGestureRecognizer(dismissWihtTap)

    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        var frame = gridCollectionView.frame
        frame.size.height = self.view.frame.size.height
        frame.size.width = self.view.frame.size.width
        frame.origin.x = 0
        frame.origin.y = self.view.frame.minY
        gridCollectionView.frame = frame
        fullImageView.frame = gridCollectionView.frame
    }
    
    func showFullImage(of image:UIImage) {
        
        fullImageView.transform = CGAffineTransform(scaleX: 0, y: 0)
        fullImageView.contentMode = .scaleAspectFit

        UIView.animate(withDuration: 0.5, delay: 0, options: [], animations:{[unowned self] in
            
            self.fullImageView.image = image
            self.fullImageView.alpha = 1
            self.fullImageView.transform = CGAffineTransform(scaleX: 1, y: 1)

        }, completion: nil)
    }
    
    func hideFullImage() {

        UIView.animate(withDuration: 0.5, delay: 0, options: [], animations:{[unowned self] in
            self.fullImageView.alpha = 0
        }, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ImageCell
        cell.backgroundColor = #colorLiteral(red: 0.1098039216, green: 0.6392156863, blue: 0.7843137255, alpha: 1)
        cell.imageView.image = UIImage.init(named: "puppy")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! ImageCell
        
        if let image = cell.imageView.image {
            self.showFullImage(of: image)
        } else {
            print("no photo")
        }
    }
    
}










