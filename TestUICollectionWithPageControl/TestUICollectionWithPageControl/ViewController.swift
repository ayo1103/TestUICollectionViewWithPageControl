//
//  ViewController.swift
//  TestUICollectionWithPageControl
//
//  Created by Bryan Lin on 6/24/15.
//  Copyright (c) 2015 ayo1103. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var myCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!

    var tableData = [   "1", "2", "3", "4",
                        "5", "6", "7", "8",
                        "9", "-1", "-1", "-1"]

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tableData.count
    }

    @IBAction func pageControlValueChanged(sender: UIPageControl) {
        let pageWidth = myCollectionView.frame.size.width
        let scrollTo = CGPoint(x: CGFloat(sender.currentPage) * pageWidth, y: 0)
        myCollectionView.setContentOffset(scrollTo, animated: true)
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! MyCollectionViewCell


        if (tableData[indexPath.row] == "-1") {
            cell.label.text = ""
            cell.imageView.image = nil

        } else {
            cell.label.text = tableData[indexPath.row]
            cell.imageView.image = UIImage(named: "gamtlemen")
        }
        return cell
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {

        let height = collectionView.frame.height * 0.5
        let width  = collectionView.frame.width * 0.5
        return CGSizeMake(width, height)
    }

    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        self.pageControl.currentPage = Int(myCollectionView.contentOffset.x / myCollectionView.frame.size.width)
    }

}

