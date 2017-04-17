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
    let information = [["All the Registered Participants acknowledge there presence followed by simultaneous Ice-Breaking Sessions.", "NASA SpaceApps 2017 would be explained and problem statements would be discussed. All the participants would be introduced to NASA Open Data and the judging criteria.", "Participants are expected to get a sense of problem statements by now. Hack Begins. Participants would be given HackerSpace, some plug points and a good WiFi Connection.", "Take a break, Relax!", "Hardware components will be given to the Teams, if required, on a First-Come-First-Serve basis.", "Mentors from diverse backgrounds would be accessible to all the participants.", "Fuel Up!"], ["Snacks and Caffeine will be provided to the hackers to keep up with the energy!", "Final Team List would be prepared for scheduling the presentations.", "Relax For a While!", "Time will be given to better help the hackers with their own mock presentation.", "The time for the participants to Show Off their hard work done during the SpaceAppsChallenge!", "Participants will be reminded to focus on giving kind, specific and helpful feedback.", "The most awaited moment!"]]

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
        tableView.deselectRow(at: indexPath, animated: true)
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

