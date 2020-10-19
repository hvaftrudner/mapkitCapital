//
//  WebViewController.swift
//  project 16
//
//  Created by Kristoffer Eriksson on 2020-10-19.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    @IBOutlet var webView: WKWebView!
    
    var placeTitle: String?
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let baseWiki = "https://en.wikipedia.org/wiki/"
        guard let baseTitle = placeTitle else {return}
        guard let baseUrl = URL(string: baseWiki + baseTitle) else {return}

        // Do any additional setup after loading the view.
        webView.load(URLRequest(url: baseUrl))
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
