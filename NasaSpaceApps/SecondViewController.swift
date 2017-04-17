//
//  SecondViewController.swift
//  NasaSpaceApps
//
//  Created by Vansh Badkul on 09/04/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let time = [["8:00 am", "10:00 am", "11:00 am", "1:00 pm", "2:00 pm", "4:00 pm", "8:00 pm"],["1:00 am", "6:00 am", "9:00 am", "11:00 am", "2:00 pm", "5:00 pm", "6:00 pm"]]
    let eventTitle = [["Registration Check","HACK101", "Hacking Begins", "Lunch", "HackShop Opens", "Open Mentor Hours", "Dinner"], ["Midnight Munchies", "Team Acknowledgement", "Breakfast", "Practice Presentations", "Final Presentations", "Judges Deliberation and Feedback Session", "Closing Ceremony and Results"]]
    let sections = ["Saturday, April 29th","Sunday, April 30th"]

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = blue
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //tableview
    func numberOfSections(in tableView: UITableView) -> Int {
        return eventTitle.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventTitle[section].count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EventFlowTableViewCell
        cell.circleView.layer.cornerRadius = 9.5
        cell.title.text = String(eventTitle[indexPath.section][indexPath.row])
        cell.timing.text = String(time[indexPath.section][indexPath.row])
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        tableView.sectionIndexBackgroundColor = blue
        return String(sections[section])
    }


}

