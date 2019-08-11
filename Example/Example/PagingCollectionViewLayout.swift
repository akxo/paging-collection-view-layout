//
//  PagingCollectionViewLayout.swift
//  Example
//
//  Created by Alex Kerendian on 8/11/19.
//  Copyright © 2019 Alexander Kerendian. All rights reserved.
//

import UIKit

class PagingCollectionViewLayout: UICollectionViewFlowLayout {
    
    var velocityThresholdPerPage: CGFloat = 2
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard let collectionView = collectionView else { return proposedContentOffset }
        
        let pageLength: CGFloat
        let approxPage: CGFloat
        let speed: CGFloat
        
        if scrollDirection == .horizontal {
            pageLength = self.itemSize.width + self.minimumLineSpacing
            approxPage = collectionView.contentOffset.x / pageLength
            speed = velocity.x
        } else {
            pageLength = self.itemSize.height + self.minimumLineSpacing
            approxPage = collectionView.contentOffset.y / pageLength
            speed = velocity.y
        }
        
        let currentPage = (speed < 0) ? ceil(approxPage) : floor(approxPage)
        
        guard speed != 0 else {
            if scrollDirection == .horizontal {
                return CGPoint(x: currentPage * pageLength, y: 0)
            } else {
                return CGPoint(x: 0, y: currentPage * pageLength)
            }
        }
        
        var nextPage: CGFloat = currentPage + (speed > 0 ? 1 : -1)
        
        let increment = speed / velocityThresholdPerPage
        nextPage += (speed < 0) ? ceil(increment) : floor(increment)
        
        if scrollDirection == .horizontal {
            return CGPoint(x: nextPage * pageLength, y: 0)
        } else {
            return CGPoint(x: 0, y: nextPage * pageLength)
        }
    }
}
