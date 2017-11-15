//
//  ViewController.swift
//  TeamupCal-Example
//
//  Created by Merrick Sapsford on 14/11/2017.
//  Copyright © 2017 AMRAP Labs. All rights reserved.
//

import UIKit
import TeamupKit
import TeamupCal

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let plist = Bundle(for: type(of: self)).path(forResource: "credentials", ofType: "plist")!
        let dictionary = NSDictionary(contentsOfFile: plist) as! [String : Any]
        
        let teamup = Teamup(apiToken: dictionary["apiToken"] as! String,
                            businessId: dictionary["businessId"] as! Int)
        let teamupCal = TeamupCal(with: teamup)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

