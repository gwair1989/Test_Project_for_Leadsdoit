//
//  ChoosingGameVC.swift
//  TestWebView
//
//  Created by Aleksandr Khalupa on 12.07.2021.
//

import UIKit

class ChoosingGameVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func pressedButton(_ sender: UIButton) {
        performSegue(withIdentifier: "toGameVC", sender: self)
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
