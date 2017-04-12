//
//  OnboardViewController.swift
//  NasaSpaceApps
//
//  Created by Saransh Mittal on 12/04/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit
import paper_onboarding

class ViewController: UIViewController {
    
    @IBOutlet weak var DoneButton: UIButton!
    @IBOutlet var onboarding: PaperOnboarding!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        DoneButton.isHidden = true
        onboarding.dataSource = self
        onboarding.delegate = self
        DoneButton.layer.cornerRadius = 15
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func DoneAction(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController")
        self.present(vc!, animated: true, completion: nil)
    }
}

extension ViewController: PaperOnboardingDelegate {
    
    func onboardingWillTransitonToIndex(_ index: Int) {
        if index == 2{
            DoneButton.isHidden = false
        }
        else{
            DoneButton.isHidden = true
        }
    }
    
    func onboardingDidTransitonToIndex(_ index: Int) {
        
    }
    
    func onboardingConfigurationItem(_ item: OnboardingContentViewItem, index: Int) {
        //    item.titleLabel?.backgroundColor = .redColor()
        //    item.descriptionLabel?.backgroundColor = .redColor()
        //    item.imageView = ...
    }
}

// MARK: PaperOnboardingDataSource

extension ViewController: PaperOnboardingDataSource {
    
    func onboardingItemAtIndex(_ index: Int) -> OnboardingItemInfo {
        let titleFont = UIFont(name: "Nunito-Bold", size: 36.0) ?? UIFont.boldSystemFont(ofSize: 36.0)
        let descriptionFont = UIFont(name: "OpenSans-Regular", size: 14.0) ?? UIFont.systemFont(ofSize: 14.0)
        return [
            (UIImage.Asset.logo.rawValue, "Welcome", "NASA Space Apps Challenge 2017", UIImage.Asset.Key.rawValue, UIColor.init(red: 19/255, green: 32/255, blue: 53/255, alpha: 1.0), UIColor.white, UIColor.white, titleFont,descriptionFont),
            (UIImage.Asset.Banks.rawValue, "VIT University, Vellore", "April 29-30", UIImage.Asset.Wallet.rawValue, UIColor.init(red: 0/255, green: 157/255, blue: 214/255, alpha: 1.0), UIColor.white, UIColor.white, titleFont,descriptionFont),
            (UIImage.Asset.ready.rawValue, "Are you ready to compete?", "Lets get started", UIImage.Asset.Shopping_Cart.rawValue, UIColor.black, UIColor.white, UIColor.white, titleFont,descriptionFont)
            ][index]
    }
    
    func onboardingItemsCount() -> Int {
        return 3
    }
}
