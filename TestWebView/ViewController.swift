//
//  ViewController.swift
//  TestWebView
//
//  Created by Aleksandr Khalupa on 12.07.2021.
//

import UIKit
import WebKit

class ViewController: UIViewController, ManagerTWVDelegate, WKNavigationDelegate, UITabBarDelegate {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var tabBar: UITabBar!
    
    var managerTWV = ManagerTWV()
    
    @IBOutlet weak var chooseGameItem: UITabBarItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        managerTWV.delegate = self
        managerTWV.request()
        webView.navigationDelegate = self
        tabBar.delegate = self
        
    }
    
    
    func requestData(url: URL) {
        webView.load(URLRequest(url: url))
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        if webView.url?.absoluteString == "https://www.google.com/"{
            performSegue(withIdentifier: "toChoosingGameVC", sender: self)
        }
    }
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.tag == 1{
            performSegue(withIdentifier: "toChoosingGameVC", sender: self)
        }
    }
    
}
