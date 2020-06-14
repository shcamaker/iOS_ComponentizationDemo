//
//  SFCycleScrollView.swift
//  SFCloudMusic
//
//  Created by 沈海超 on 2020/2/15.
//  Copyright © 2020 沈海超. All rights reserved.
//

import UIKit

public class SFCycleScrollView: UIView {

    private var currentIndex = 0
    private var nextIndex = 0
    private var timer:Timer?
    public var duration: TimeInterval = 3.0
    
    public var imageArray: [UIImage]? {
        didSet {
            currentImageView.image = self.imageArray?[0]
            pageControl.numberOfPages = self.imageArray?.count ?? 0
            startTimer()
        }
    }
    
    
    enum Direction {
        case None
        case Left
        case Right
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(scrollView)
        scrollView.addSubview(currentImageView)
        scrollView.addSubview(otherImageView)
        addSubview(pageControl)
    }

    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    private lazy var scrollView:UIScrollView = {
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height))
        scrollView.contentSize = CGSize(width: self.bounds.width*3, height: 0)
        scrollView.contentOffset = CGPoint(x: self.bounds.width, y: 0)
        scrollView.isPagingEnabled = true
        scrollView.bounces = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.delegate = self
        return scrollView
    }()
    
    private lazy var currentImageView:UIImageView = {
        let currentImageView = UIImageView(frame: CGRect(x: self.bounds.width, y: 0, width: self.bounds.width, height: self.bounds.height))
        return currentImageView
    }()
    
    private lazy var otherImageView = UIImageView()
    
    private lazy var pageControl:UIPageControl = {
        let pageControl = UIPageControl(frame: CGRect(x: self.bounds.width/2-30, y: self.scrollView.frame.maxY, width: 60, height: 15))
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.currentPageIndicatorTintColor = UIColor.white
        return pageControl
    }()
    
    private var direction:Direction? {
        didSet {
            if direction == .Right {
                otherImageView.frame = CGRect(x: 0, y: 0, width: self.scrollView.bounds.size.width, height: self.scrollView.bounds.size.height)
                self.nextIndex = self.currentIndex - 1
                if self.nextIndex < 0 {
                    self.nextIndex = imageArray!.count - 1
                }
            } else if direction == .Left {
                self.otherImageView.frame = CGRect(x: currentImageView.frame.maxX, y: 0, width: self.scrollView.bounds.size.width, height: self.scrollView.bounds.size.height)
                self.nextIndex = (self.currentIndex + 1)%imageArray!.count
            }
            self.otherImageView.image = self.imageArray![self.nextIndex]
            pageControl.currentPage = currentIndex
        }
    }
    
    private func startTimer() {
        if imageArray?.count == 1 {
            return
        }
        if timer != nil {
            timer!.invalidate()
            timer = nil
        }
        timer = Timer(timeInterval: duration, target: self, selector: #selector(nextPage), userInfo: nil, repeats: true)
        RunLoop.current.add(timer!, forMode: RunLoop.Mode.common)
        
    }
    
    @objc private func nextPage () {
        scrollView.setContentOffset(CGPoint(x: scrollView.bounds.width*2, y: 0), animated: true)
    }
    
}

extension SFCycleScrollView: UIScrollViewDelegate {
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        direction = scrollView.contentOffset.x > UIScreen.main.bounds.width-30 ? .Left : .Right
    }
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        scrollDidStop()
    }
    private func scrollDidStop() {
        self.direction = .None
        let index = scrollView.contentOffset.x/scrollView.bounds.size.width
        if index == 1 { return }
        currentImageView.frame = CGRect(x: scrollView.bounds.size.width, y: 0, width: scrollView.bounds.size.width, height: scrollView.bounds.size.height)
        self.currentIndex = self.nextIndex
        currentImageView.image = self.otherImageView.image
        scrollView.contentOffset = CGPoint(x: scrollView.bounds.size.width, y: 0)
    }
    public func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        scrollDidStop()
    }
    public func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        timer?.invalidate()
    }
    
    public func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        startTimer()
    }
}
