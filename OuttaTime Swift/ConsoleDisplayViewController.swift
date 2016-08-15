//
//  ConsoleDisplayViewController.swift
//  OuttaTime Swift
//
//  Created by Gregory Weiss on 8/15/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

import UIKit

protocol SetDestinationViewControllerDelegate
{
    func didFinishTask(dateToSet: NSDate)
}


class ConsoleDisplayViewController: UIViewController, SetDestinationViewControllerDelegate
{

    
    
    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var presentDateLabel: UILabel!
    @IBOutlet weak var lastDateLabel: UILabel!    
    @IBOutlet weak var speedMPHLabel: UILabel!
    let dateFormatter = NSDateFormatter()
    var speedMPHtimer: NSTimer?
    var currentSpeed: Int = 0
    var originalSpeed: Int = 0
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        dateFormatter.dateStyle = .MediumStyle
        dateFormatter.timeStyle = .NoStyle
        let currentDate = NSDate()
        presentDateLabel.text = dateFormatter.stringFromDate(currentDate)
        destinationLabel.text = "Pick a Date!"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
// ACTION HANDLERS
    
    
    @IBAction func travelBackTapped(sender: UIButton)
    {
        
        speedMPHtimer = NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: "travelBackFired", userInfo: nil, repeats: true)
        
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "SetDestinationSegue"
        {
            let setDateVC = segue.destinationViewController as! SetDestinationViewController
            setDateVC.delegate = self
        }
    }
    
    func didFinishTask(dateToSet: NSDate)
    {
       destinationLabel.text = dateFormatter.stringFromDate(dateToSet)
        
    }
    
    func travelBackFired()
    {
        // Going to count up to 88!!!
        if (originalSpeed < 88)
        {
            originalSpeed = originalSpeed + 1
            speedMPHLabel.text = "\(originalSpeed) MPH"
        }
        else
        {
          speedMPHtimer?.invalidate()
            originalSpeed = 0
            speedMPHLabel.text = "0 MPH"
            lastDateLabel.text = presentDateLabel.text
            presentDateLabel.text = destinationLabel.text
            destinationLabel.text = "Pick a date!"
        }
    }

    

}

