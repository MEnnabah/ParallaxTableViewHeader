//
//  ParallaxHeader.swift
//  ParallaxTableViewHeader
//
//  Created by Mohammed Ennabah on 09/03/2018.
//  Copyright © 2018 Mohammed Ennabah. All rights reserved.


///////////////////////////////////////////////////////////////////////////////////////////////////
////// Following sample code is from https://github.com/lucaslouca/parallax-table-view-header/ ////
///////////////////////////////////////////////////////////////////////////////////////////////////

import UIKit

class ParallaxTableHeaderView: UIView {
    let parallaxDeltaFactor: CGFloat = 0.5
    var defaultHeaderFrame: CGRect!
    var scrollView: UIScrollView!
    var subView: UIView!
    
    convenience init(size: CGSize, subView:UIView) {
        self.init(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        
        self.scrollView = UIScrollView(frame: self.bounds)
        self.subView = subView
        self.subView.autoresizingMask = [.flexibleLeftMargin, .flexibleRightMargin, .flexibleTopMargin, .flexibleBottomMargin, .flexibleHeight, .flexibleWidth]
        self.scrollView.addSubview(self.subView)
        self.addSubview(self.scrollView)
    }
    
    /**
     Layout the content of the header view to give the parallax feeling.
     - parameter contentOffset: scroll views content offset
     */
    func layoutForContentOffset(_ contentOffset: CGPoint) {
        var frame = self.scrollView.frame
        defaultHeaderFrame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        
        if (contentOffset.y > 0) {
            frame.origin.y = contentOffset.y * parallaxDeltaFactor
            self.scrollView.frame = frame
            self.clipsToBounds = true
        } else {
            var delta: CGFloat = 0.0
            var rect: CGRect = defaultHeaderFrame
            delta = fabs(contentOffset.y)
            rect.origin.y -= delta
            rect.size.height += delta
            self.scrollView.frame = rect
            self.clipsToBounds = false
        }
    }
}

