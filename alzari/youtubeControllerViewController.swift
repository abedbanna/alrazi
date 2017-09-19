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
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.load(request)
        
        //------------------
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
       
        if selectedVideo?.Youtube != nil
        {
        activityIndicator.center=self.view.center
        activityIndicator.hidesWhenStopped=true
        activityIndicator.activityIndicatorViewStyle=UIActivityIndicatorViewStyle.gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
   
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.0) {
            
           
           if  self.viewer.load(withVideoId: (selectedVideo?.Youtube)!)
           {
            //sleep(1)
            //self.activityIndicator.stopAnimating()
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
