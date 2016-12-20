//
//  ViewController.swift
//  AudioProject
//
//  Created by Niu Panfeng on 7/9/16.
//  Copyright © 2016 NaPaFeng. All rights reserved.
//

import UIKit
import AudioToolbox //系统声音
import AVFoundation  //
import AVKit

class ViewController: UIViewController {
    
    var audioPlayer:AVAudioPlayer = AVAudioPlayer()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        /*
        var _soundID:SystemSoundID = 0
        let path = NSBundle.mainBundle().pathForResource("hello", ofType: "mp3")
        let soundUrl = NSURL.fileURLWithPath(path!)
        AudioServicesCreateSystemSoundID(soundUrl, &_soundID)
        AudioServicesPlaySystemSound(_soundID)
        */
        
        
        /*
        let session = AVAudioSession.sharedInstance()
 
        do{
            try session.setActive(true)
            try session.setCategory(AVAudioSessionCategoryPlayback)
            UIApplication.sharedApplication().beginReceivingRemoteControlEvents()
            
           
            let songPath = NSBundle.mainBundle().pathForResource("song", ofType: "mp3")
            let songUrl = NSURL.fileURLWithPath(songPath!)
            try audioPlayer = AVAudioPlayer(contentsOfURL: songUrl)
            audioPlayer.prepareToPlay()
            audioPlayer.volume = 2.0
            audioPlayer.numberOfLoops = -1
            audioPlayer.play()
            
        }catch{
            print(error)
        }
        */
        /////////////////////////////////////
        
        
        let moviePath = NSBundle.mainBundle().pathForResource("湖滨宾馆", ofType: "mp4")
        let movieUrl = NSURL.fileURLWithPath(moviePath!)
        let avPlayer = AVPlayer(URL: movieUrl)
        /*
        let avPlayerLayer = AVPlayerLayer(player: avPlayer)
        avPlayerLayer.frame = self.view.bounds
        self.view.layer.addSublayer(avPlayerLayer)
        avPlayer.play()
        */
        
        let avPlayerViewController = AVPlayerViewController()
        avPlayerViewController.player = avPlayer
        avPlayerViewController.view.frame = self.view.frame
        self.addChildViewController(avPlayerViewController)
        self.view.addSubview(avPlayerViewController.view)
        avPlayer.play()
        
        
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

