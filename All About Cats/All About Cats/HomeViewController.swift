//
//  ViewController.swift
//  All About Cats
//
//  Created by P.M. Student on 11/7/19.
//  Copyright © 2019 P.M. Student. All rights reserved.
//

import UIKit
import  AVFoundation
import UserNotifications
import CoreLocation

class HomeViewController: UIViewController, CLLocationManagerDelegate{
    
    let transition = SlideInTransition()
    let manager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UNUserNotificationCenter.current().requestAuthorization(
            options: [.alert, .sound, .badge],
            completionHandler: {didAllow, error in})
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    var audioPlayer:AVAudioPlayer?
    
    @IBAction func Sound(_ sender: UIButton) {
        let index2 = sender.tag
        
        switch index2 {
        case 1:
            guard let path = Bundle.main.path(forResource: "Cat Meowing - Sound Effect - Download", ofType: "mp3")
                else{return}
            let url = URL(fileURLWithPath: path)
            audioPlayer = try? AVAudioPlayer(contentsOf: url, fileTypeHint: nil)
            audioPlayer?.prepareToPlay()
            audioPlayer?.setVolume(1, fadeDuration: 0.1)
            audioPlayer?.play()
            audioPlayer?.play()
            print(index2)
        case 2:
            guard let path = Bundle.main.path(forResource: "Cat_Meow_2-Cat_Stevens-2034822903", ofType: "mp3")
                else{return}
            let url = URL(fileURLWithPath: path)
            audioPlayer = try? AVAudioPlayer(contentsOf: url, fileTypeHint: nil)
            audioPlayer?.prepareToPlay()
            audioPlayer?.setVolume(1, fadeDuration: 0.1)
            audioPlayer?.play()
            print(index2)
        case 3:
            guard let path = Bundle.main.path(forResource: "Kittens Meowing- Sound Effects", ofType: "mp3")
                else{return}
            let url = URL(fileURLWithPath: path)
            audioPlayer = try? AVAudioPlayer(contentsOf: url, fileTypeHint: nil)
            audioPlayer?.prepareToPlay()
            audioPlayer?.setVolume(1, fadeDuration: 0.1)
            audioPlayer?.play()
            print(index2)
        case 4:
            guard let path = Bundle.main.path(forResource: "HD Sound effects - cat meowing SFX - part 1", ofType: "mp3")
                else{return}
            let url = URL(fileURLWithPath: path)
            audioPlayer = try? AVAudioPlayer(contentsOf: url, fileTypeHint: nil)
            audioPlayer?.prepareToPlay()
            audioPlayer?.setVolume(1, fadeDuration: 0.1)
            audioPlayer?.play()
            print(index2)
        default:
            break
        }
    }
    
    @IBAction func didTabMenu(_ sender: UIBarButtonItem) {
        guard let menuViewContraoller = storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController else {return}
        menuViewContraoller.didTapMenuType = { menuType in
            self.transitionToNew(menuType)
        }
        menuViewContraoller.modalPresentationStyle = .overCurrentContext
        menuViewContraoller.transitioningDelegate = self
        present(menuViewContraoller, animated: true)
    }
    
    func transitionToNew(_ menuType: MenuType) {
        let title = String(describing: menuType).capitalized
        self.title = title
        switch menuType {
        case .cats:
            let view = UIView()
            view.backgroundColor = .yellow
            view.frame = self.view.bounds
            self.view.addSubview(view)
        default:
            break
        }
    }
    
}
extension HomeViewController: UIViewControllerTransitioningDelegate{
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }
}
