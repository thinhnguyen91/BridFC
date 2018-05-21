//
//  DetailViewController.swift
//  Bird_Fc
//
//  Created by Thinh Nguyen on 12/14/16.
//  Copyright © 2016 Thinh Nguyen. All rights reserved.
//

import UIKit
import AVFoundation

class DetailViewController: UIViewController,UIGestureRecognizerDelegate {
    var player: AVAudioPlayer?
    var buttionPlay: UIButton!
    var buttonStop: UIButton!
    var stringMm3: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.playSound()
        //self.setUpUI()
        swipeGesture()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    @IBAction func backButtion(_ sender: AnyObject) {
        backHome()
    }
    @IBAction func playButtion(_ sender: AnyObject) {
        player?.play()
    }
    @IBAction func stopButtion(_ sender: AnyObject) {
        player?.stop()
    }
    @IBAction func pauseButtion(_ sender: AnyObject) {
        player?.pause()
    }
    
    func swipeGesture() {
        let swipeLeft:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swiped))
        swipeLeft.direction = .left
    }
    
    func swiped(_ gesture: UIGestureRecognizer) {
        backHome()
    }
    func backHome() {
        navigationController?.popViewController(animated: true)
    }
    
    func playSound() {
        if let stringMm3 = stringMm3 {
            print("stringMm3 =",stringMm3)
            let url = Bundle.main.url(forResource: stringMm3, withExtension: "mp3")
            if let url = url {
                do {
                    player = try AVAudioPlayer(contentsOf: url)
                    guard let player = player else { return }
                    
                    player.prepareToPlay()
                } catch let error as NSError {
                    print(error.description)
                }
            }
            
        }
    }
    func setUpUI() {
        //Play/Pause button
        buttionPlay = UIButton(frame: CGRect(x: 100,y: 100, width: 100, height: 30))
        //        buttionPlay.center = view.center
        buttionPlay.setTitle("Play", for: UIControlState())
        buttionPlay.setTitleColor(UIColor.blue, for: UIControlState())
        buttionPlay.setTitleColor(UIColor.cyan, for: UIControlState.highlighted)
        buttionPlay.addTarget(self, action: #selector(buttonPressed), for: UIControlEvents.touchUpInside)
        view.addSubview(buttionPlay)
        
        //Stop button
        buttonStop = UIButton(frame: CGRect(x: 150, y: 150, width: 150, height: 30))
        //        buttonStop.center = CGPointMake(view.center.x, view.center.y+50)
        buttonStop.setTitle("Stop", for: UIControlState())
        buttonStop.setTitleColor(UIColor.blue, for: UIControlState())
        buttonStop.setTitleColor(UIColor.cyan, for: UIControlState.highlighted)
        buttonStop.addTarget(self, action: #selector(buttonStopPressed), for: UIControlEvents.touchUpInside)
        buttonStop.isHidden = true
        view.addSubview(buttonStop)
    }
    func buttonPressed() {
        if player!.isPlaying {
            player!.pause()
            buttionPlay.setTitle("Play", for: UIControlState())
        } else {
            player!.play()
            buttionPlay.setTitle("Pause", for: UIControlState())
            buttonStop.isHidden = false
        }
    }
    func buttonStopPressed() {
        player!.stop()
        player!.currentTime = 0 //rewind
        buttonStop.isHidden = true
        buttionPlay.setTitle("Play", for: UIControlState())
    }
}
