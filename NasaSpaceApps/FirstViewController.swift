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
import Firebase
import FirebaseDatabase

struct postStruct{
    let title : String!
    let message : String!
    
}

class FirstViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    var posts=[postStruct]()
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var Register: UIButton!
    @IBOutlet weak var slideshow: ImageSlideshow!
    
      let localSource = [ImageSource(imageString: "slide1")!, ImageSource(imageString: "slide2")!, ImageSource(imageString: "slide1")!, ImageSource(imageString: "slide2")!]
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let connectedRef = FIRDatabase.database().reference(withPath: ".info/connected")
        connectedRef.observe(.value, with: { snapshot in
            if let connected = snapshot.value as? Bool, connected {
                print("Connected")
            } else {
                print("Not connected")
            }
        })
        // Do any additional setup after loading the view, typically from a nib.
        let databaseRef = FIRDatabase.database().reference()
        databaseRef.child("Posts").queryOrderedByKey().observe(.childAdded, with: {
        snapshot in
            
            let snapshotValue = snapshot.value as? NSDictionary
            let title = snapshotValue?["title"] as! String
            let message = snapshotValue?["message"] as! String
            //self.posts.append(postStruct(title:title,message:message))

            self.posts.insert(postStruct(title:title,message:message), at: 0)
            self.tableview.reloadData()
            
      
            
            self.tableview.delegate = self
            self.tableview.dataSource = self
            
        })
        
        
      // post()

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
    
    func post(){
        
        let title = "Title"
        let message = "message"
        let post:[String:AnyObject]=["title": title as AnyObject,
                                     "message": message as AnyObject]
        
        let databaseRef=FIRDatabase.database().reference()
        databaseRef.child("Posts").childByAutoId().setValue(post)
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableview.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let label1 = cell.viewWithTag(1)as! UILabel
        label1.text=posts[indexPath.row].title
        print(label1)
        let label2 = cell.viewWithTag(2)as! UILabel
        label2.text=posts[indexPath.row].message
        
        return cell
        
    }

}
