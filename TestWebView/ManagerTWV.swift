//
//  ManagerTWV.swift
//  TestWebView
//
//  Created by Aleksandr Khalupa on 12.07.2021.
//

import Foundation

protocol ManagerTWVDelegate {
    func requestData(url: URL)
}

class ManagerTWV{
    let testURL = "https://i.i-bbva.com/click.php?key=sv2n47z3n770fyx7tmjb&p=partner&c=creative&l=lander&off=offer&link=link"
    var delegate: ManagerTWVDelegate?
    
    
    func request(){
        guard let url = URL(string: testURL) else{return}
        DispatchQueue.main.async {
            self.delegate?.requestData(url: url)
        }
    }
    
    
}
