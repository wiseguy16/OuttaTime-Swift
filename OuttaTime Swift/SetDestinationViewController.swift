//
//  SetDestinationViewController.swift
//  OuttaTime Swift
//
//  Created by Gregory Weiss on 8/15/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

import UIKit

class SetDestinationViewController: UIViewController {
    
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
