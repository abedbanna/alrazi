//
//  youtubeControllerViewController.swift
//  alzari
//
//  Created by AbedMac on 8/19/17.
//  Copyright © 2017 AbedMac. All rights reserved.
//

import UIKit
import GoogleMobileAds
import youtube_ios_player_helper
var selectedVideo:Video?=nil
class youtubeControllerViewController: UIViewController {
var activityIndicator:UIActivityIndicatorView=UIActivityIndicatorView()
    
    @IBOutlet weak var bannerView: GADBannerView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //Admob Ads
        let request=GADRequest()
        
        //bannerView.delegate = self
        //self.view.addSubview(bannerView)
        bannerView.adUnitID = "ca-app-pub-8889796611679482/5293359092"
        //request.testDevices = [ "35a4ae7a86a3ad5eb7f4b75255fe6e14" ];
        bannerView.rootViewController = self
        bannerView.load(request)
        
        //------------------
        
        // Do any additional setup after loading the view.
    }
 
    
    override func viewWillDisappear(_ animated : Bool) {
        super.viewWillDisappear(animated)
        
        if (self.isMovingFromParentViewController) {
            UIDevice.current.setValue(Int(UIInterfaceOrientation.portrait.rawValue), forKey: "orientation")
        }
    }
    
     func canRotate() -> Void {}
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.dismiss(animated: true) { () -> Void in
            UIDevice.current.setValue(Int(UIInterfaceOrientation.portrait.rawValue), forKey: "orientation")
            
        }
        if selectedVideo?.Youtube != nil
        {
        activityIndicator.center=self.view.center
        activityIndicator.hidesWhenStopped=true
        activityIndicator.activityIndicatorViewStyle=UIActivityIndicatorViewStyle.gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
   
            
            
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.0) {
            
           let playerVars = [ "rel" : 0 ]
           if  self.viewer.load(withVideoId: (selectedVideo?.Youtube)!,playerVars: playerVars)
           {
            let elapsed=10.0
            let delay = max(0.0, 2.0 - elapsed)
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
            }
            
            
            }
            
            }
    
            
          
        }
        
    
    }
    
    
    
    
  
    
@IBOutlet weak var viewer: YTPlayerView!
   
    func playerView(playerView: YTPlayerView!, didChangeToState state: YTPlayerState) {
        switch(state) {
        case YTPlayerState.unstarted:
            print("Unstarted")
            break
        case YTPlayerState.queued:
             self.activityIndicator.stopAnimating()
            break
        case YTPlayerState.playing:
            print("Video playing")
            break
        case YTPlayerState.paused:
            print("Video paused")
            break
        default:
            break
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
