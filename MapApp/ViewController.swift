//
//  ViewController.swift
//  MapApp
//
//  Created by Mouna Cheikhna on 28/07/2018.
//  Copyright © 2018 Mouna Cheikhna. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    fileprivate class var apiKey: String {
        return "API_KEY_HERE"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // TODO: don't commit the API KEY (put in an uncomitted place)
        Alamofire.request("https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=Museum%20of%20Contemporary%20Art%20Australia&inputtype=textquery&fields=photos,formatted_address,name,rating,opening_hours,geometry&key=\(ViewController.apiKey)").responseJSON { response in
            if let json = response.result.value {
                self.onMapResults(data: json as! [String: Any?])
            }
        };
    }

    func onMapResults(data: [String: Any?]) {
        let results = data["candidates"] as! [NSDictionary]
        results.map { (result) -> String in
            let geometry = result["geometry"] as! NSDictionary
            let location = geometry["location"] as! NSDictionary
            
            // i need to get lat and lon so i can display them on a map
            
            let lat = location["lat"]
            return "Hello"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

