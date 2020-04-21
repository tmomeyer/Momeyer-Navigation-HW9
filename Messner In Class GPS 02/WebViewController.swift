//
//  WebViewController.swift
//  Messner In Class GPS 02
//
//  Created by Trevor Momeyer on 4/21/20.
//  Copyright © 2020 Brad D. Messner. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBAction func openSite(_ sender: Any) {
        
        if let url = URL(string:
            "https://www.colorado.com") {
            UIApplication.shared.open(url, options: [:])
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Load Website
        let myURL = URL(string:"https://www.breckenridge.com")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)


    }
    


}
