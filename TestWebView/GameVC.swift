//
//  GameVC.swift
//  TestWebView
//
//  Created by Aleksandr Khalupa on 12.07.2021.
//

import UIKit
import AVFoundation
import UserNotifications

class GameVC: UIViewController, UNUserNotificationCenterDelegate {

    @IBOutlet var suitCollection: [UIImageView]!
    
    let suitCard = [UIImage(named: "бубей"), UIImage(named: "червей"), UIImage(named: "вина"), UIImage(named: "трефа")]
    var player: AVAudioPlayer?
    var notificationCenter = UNUserNotificationCenter.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notificationCenter.delegate = self
        
    }

    @IBAction func pressedSpin(_ sender: UIButton) {
        for index in suitCollection.indices {
            suitCollection[index].image = suitCard.randomElement()!
        }
        if checkMatch(){
            playMusic()
        }
        }
    
    func playMusic(){
        if let fileOfGuard = Bundle.main.url(forResource: "true", withExtension: "mp3") {
            player = try! AVAudioPlayer(contentsOf: fileOfGuard)
            player?.play()
            sendNotification()
        }
}
    func checkMatch() ->Bool{
        if suitCollection[0].image == suitCollection[1].image || suitCollection[1].image == suitCollection[3].image || suitCollection[0].image == suitCollection[2].image {
            return true
        }
        return false
    }
    
    func sendNotification(){
        let content = UNMutableNotificationContent()
        content.title = "YOU WIN"
        content.sound = UNNotificationSound.default
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)
        let request = UNNotificationRequest(identifier: "notification", content: content, trigger: trigger)
        notificationCenter.add(request) { erorrr in
        }
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound])
    }

}
        
    

