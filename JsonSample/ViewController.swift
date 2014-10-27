//
//  ViewController.swift
//  JsonSample
//
//  Created by paradigm creatives on 10/27/14.
//  Copyright (c) 2014 Paradigm Creatives. All rights reserved.
//

import UIKit

class ViewController: UIViewController,NSURLConnectionDelegate {
      lazy var data = NSMutableData()
    var jsonResult: NSDictionary!
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startConnection();
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    
    func startConnection(){
        let urlPath: String = "https://graph.facebook.com/19292868552"
        var url: NSURL = NSURL(string: urlPath)
        var request: NSURLRequest = NSURLRequest(URL: url)
        var connection: NSURLConnection = NSURLConnection(request: request, delegate: self, startImmediately: false)
        connection.start()
    }
    
    func printResults()
    {
        
       
      println("total objects are \(jsonResult.count)")
      
        for (obj, key) in jsonResult {
            println("\(obj): \(key)")
        }
        
    }
    
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!){
        self.data.appendData(data)
    }
    
    
    func connectionDidFinishLoading(connection: NSURLConnection!) {
        var err: NSError
        // throwing an error on the line below (can't figure out where the error message is)
         jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
       // println(jsonResult)
        printResults();

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

