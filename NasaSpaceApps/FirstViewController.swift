//
//  FirstViewController.swift
//  NasaSpaceApps
//
//  Created by Vansh Badkul on 09/04/17.
//  Copyright © 2017 Apple. All rights reserved.
//


import UIKit
import Alamofire
import ImageSlideshow

class FirstViewController: UIViewController {
    @IBOutlet weak var Register: UIButton!
    @IBOutlet weak var slideshow: ImageSlideshow!
    
      let localSource = [ImageSource(imageString: "slide1")!, ImageSource(imageString: "slide2")!, ImageSource(imageString: "slide1")!, ImageSource(imageString: "slide2")!]
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        slideshow.backgroundColor = UIColor.white
        slideshow.slideshowInterval = 5.0
        slideshow.pageControlPosition = PageControlPosition.underScrollView
        slideshow.pageControl.currentPageIndicatorTintColor = UIColor.lightGray
        slideshow.pageControl.pageIndicatorTintColor = UIColor.black
        slideshow.contentScaleMode = UIViewContentMode.scaleAspectFill
        slideshow.currentPageChanged = { page in
            print("current page:", page)
            
        }
        
      
        slideshow.setImageInputs(localSource)
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(FirstViewController.didTap))
        slideshow.addGestureRecognizer(recognizer)

    }

 

    func didTap() {
        slideshow.presentFullScreenController(from: self)
    }


}
