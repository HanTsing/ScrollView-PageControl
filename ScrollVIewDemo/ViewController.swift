//
//  ViewController.swift
//  ScrollVIewDemo
//
//  Created by hanqing on 2/25/15.
//  Copyright (c) 2015 hanqing. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    var screenWidth  = 0
    var screenHeight = 0
    
    var images = ["tutorial_background_00","tutorial_background_01","tutorial_background_02","tutorial_background_03","tutorial_background_04"]
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        screenWidth  = Int(self.view.frame.width)
        screenHeight = Int(self.view.frame.height)
        
        scrollView.contentSize = CGSize(width: screenWidth*5, height: screenHeight)
        pageControl.addTarget(self, action: "pageChanged", forControlEvents: UIControlEvents.ValueChanged)
        
        for(var i=0; i<5; i++){
            var image = UIImageView(frame: CGRect(x: i*screenWidth, y: 0, width: screenWidth, height: screenHeight))

            image.image = UIImage(named: images[i])
            scrollView.addSubview(image)
        }
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView){
        var currentPage = Int(scrollView.contentOffset.x/320)
        pageControl.currentPage = Int(currentPage)
    }
    
    func pageChanged(){
        var currentPage = pageControl.currentPage
        scrollView.scrollRectToVisible(CGRect(x: currentPage*screenWidth, y: 0, width: screenWidth, height: screenHeight), animated: true)
    }
    
    
}

