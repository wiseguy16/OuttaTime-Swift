//
//  SetDestinationViewController.swift
//  OuttaTime Swift
//
//  Created by Gregory Weiss on 8/15/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

import UIKit

class SetDestinationViewController: UIViewController
{
    
     var delegate:SetDestinationViewControllerDelegate?

    @IBOutlet weak var setDatePicker: UIDatePicker!
    
    let dateFormatter = NSDateFormatter()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func setTapped(sender: UIButton)
    {
        
        
        delegate!.didFinishTask(setDatePicker.date)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func cancelTapped(sender: UIButton)
    {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
   //tiny tweak
}
