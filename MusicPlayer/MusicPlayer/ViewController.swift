//
//  ViewController.swift
//  MusicPlayer
//
//  Created by Ryan Nickel on 2016-01-05.
//  Copyright © 2016 Ryan Nickel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var _constraintsSet = false
    private var container = UIView()
    private var artwork = UIImageView(image: UIImage(named: "album_artwork"))
    private var trackName = UILabel()
    private var albumName = UILabel()
    private var favouriteBtn = UIButton()
    private var favouriteBorder = UIImage(named: "favourite_border")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
    private var favouriteFull = UIImage(named: "favourite_full")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
    private var listBtn = UIButton()
    private var list = UIImage(named: "list")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
    private var bar = UIView()
    private var circle = UIImageView(image: UIImage(named: "player_circle")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate))
    
    private var playTime = UILabel()
    private var songLength = UILabel()
    private var progressBar = UIView()
    
    private var playerButtonsContainer = UIView()
    private var playPauseBtn = UIButton()
    private var playArrow = UIImage(named: "play_arrow")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
    private var pause = UIImage(named: "pause")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
    private var previousSkipBtn = UIButton()
    private var previousSkip = UIImage(named: "skip_previous")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
    private var nextSkipBtn = UIButton()
    private var nextSkip = UIImage(named: "skip_next")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(colorLiteralRed: 165/255.0, green: 165/255.0, blue: 165/255.0, alpha: 1)
        
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = UIColor(colorLiteralRed: 230/255.0, green: 230/255.0, blue: 230/255.0, alpha: 1)
        container.layer.cornerRadius = 5
        container.layer.masksToBounds = true
        
        artwork.translatesAutoresizingMaskIntoConstraints = false
        artwork.layer.masksToBounds = true
        container.addSubview(artwork)
        
        trackName.translatesAutoresizingMaskIntoConstraints = false
        trackName.text = "Mercy but it's a longer one so that I can see what the truncation looks like"
        trackName.font = UIFont.boldSystemFontOfSize(12)
        trackName.textColor = UIColor.blackColor()
        trackName.numberOfLines = 1
        trackName.lineBreakMode = .ByTruncatingTail
        container.addSubview(trackName)

        
        albumName.translatesAutoresizingMaskIntoConstraints = false
        albumName.text = "Drones  but it's a longer one so that I can see what the truncation looks like"
        albumName.font = UIFont.systemFontOfSize(10)
        albumName.textColor = UIColor.blackColor()
        albumName.numberOfLines = 1
        albumName.lineBreakMode = .ByTruncatingTail
        container.addSubview(albumName)
        
        favouriteBtn.translatesAutoresizingMaskIntoConstraints = false
        favouriteBtn.setBackgroundImage(favouriteBorder, forState: .Normal)
        favouriteBtn.setBackgroundImage(favouriteFull, forState: .Selected)
        favouriteBtn.addTarget(self, action: "favourited", forControlEvents: .TouchUpInside)
        favouriteBtn.tintColor = UIColor(red: 197 / 255, green: 145 / 255, blue: 157 / 255, alpha: 1)

        container.addSubview(favouriteBtn)
        
        listBtn.translatesAutoresizingMaskIntoConstraints = false
        listBtn.tintColor = UIColor(red: 205/255, green: 205/255, blue: 205/255, alpha: 205/255)
        listBtn.setBackgroundImage(list, forState: .Normal)
        container.addSubview(listBtn)
        
        bar.translatesAutoresizingMaskIntoConstraints = false
        bar.backgroundColor = UIColor(red: 180 / 255, green: 180 / 255, blue: 180 / 255, alpha: 1)
        bar.layer.cornerRadius = 1
        container.addSubview(bar)
        
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        progressBar.backgroundColor = UIColor(red: 197 / 255, green: 145 / 255, blue: 157 / 255, alpha: 1)
        progressBar.layer.cornerRadius = 1
        container.addSubview(progressBar)
        
        circle.translatesAutoresizingMaskIntoConstraints = false
        circle.tintColor = UIColor.blackColor()
        container.addSubview(circle)
        
        playTime.translatesAutoresizingMaskIntoConstraints = false
        playTime.textColor = UIColor.blackColor()
        playTime.text = "0:36"
        playTime.font = UIFont.systemFontOfSize(7)
        container.addSubview(playTime)
        
        songLength.translatesAutoresizingMaskIntoConstraints = false
        songLength.textColor = UIColor.blackColor()
        songLength.text = "2:30"
        songLength.font = UIFont.systemFontOfSize(7)
        container.addSubview(songLength)
        
        playerButtonsContainer.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(playerButtonsContainer)
        
        previousSkipBtn.translatesAutoresizingMaskIntoConstraints = false
        previousSkipBtn.setBackgroundImage(previousSkip, forState: .Normal)
        previousSkipBtn.tintColor = UIColor.blackColor()
        playerButtonsContainer.addSubview(previousSkipBtn)
        
        playPauseBtn.translatesAutoresizingMaskIntoConstraints = false
        playPauseBtn.setBackgroundImage(pause, forState: .Normal)
        playPauseBtn.setBackgroundImage(playArrow, forState: .Selected)
        playPauseBtn.addTarget(self, action: "playPause", forControlEvents: .TouchUpInside)
        playPauseBtn.tintColor = UIColor.blackColor()
        playerButtonsContainer.addSubview(playPauseBtn)
        
        nextSkipBtn.translatesAutoresizingMaskIntoConstraints = false
        nextSkipBtn.setBackgroundImage(nextSkip, forState: .Normal)
        nextSkipBtn.tintColor = UIColor.blackColor()
        playerButtonsContainer.addSubview(nextSkipBtn)

        
        self.view.addSubview(container)
    }
    
    func favourited() {
        favouriteBtn.selected = !favouriteBtn.selected
    }
    
    func playPause() {
        playPauseBtn.selected = !playPauseBtn.selected
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func updateViewConstraints() {
        if !_constraintsSet {
            
            self.view.addConstraint(
                NSLayoutConstraint(item: container, attribute: .Leading, relatedBy: .Equal, toItem: self.view, attribute: .Leading, multiplier: 1, constant: 20)
            )
            self.view.addConstraint(
                NSLayoutConstraint(item: container, attribute: .Trailing, relatedBy: .Equal, toItem: self.view, attribute: .Trailing, multiplier: 1, constant: -20)
            )
            self.view.addConstraint(
                NSLayoutConstraint(item: container, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1, constant: -20)
            )
            self.view.addConstraint(
                NSLayoutConstraint(item: container, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 100)
            )
            
            container.addConstraint(
                NSLayoutConstraint(item: artwork, attribute: .Leading, relatedBy: .Equal, toItem: container, attribute: .Leading, multiplier: 1, constant: 0)
            )
            container.addConstraint(
                NSLayoutConstraint(item: artwork, attribute: .Top, relatedBy: .Equal, toItem: container, attribute: .Top, multiplier: 1, constant: 0)
            )
            container.addConstraint(
                NSLayoutConstraint(item: artwork, attribute: .Bottom, relatedBy: .Equal, toItem: container, attribute: .Bottom, multiplier: 1, constant: 0)
            )
            container.addConstraint(
                NSLayoutConstraint(item: artwork, attribute: .Width, relatedBy: .Equal, toItem: artwork, attribute: .Height, multiplier: 1, constant: 0)
            )
            
            container.addConstraint(
                NSLayoutConstraint(item: trackName, attribute: .Leading, relatedBy: .Equal, toItem: artwork, attribute: .Trailing, multiplier: 1, constant: 10)
            )
            container.addConstraint(
                NSLayoutConstraint(item: trackName, attribute: .Top, relatedBy: .Equal, toItem: container, attribute: .Top, multiplier: 1, constant: 10)
            )
            container.addConstraint(
                NSLayoutConstraint(item: trackName, attribute: .Trailing, relatedBy: .Equal, toItem: favouriteBtn, attribute: .Leading, multiplier: 1, constant: -5)
            )
            
            container.addConstraint(
                NSLayoutConstraint(item: albumName, attribute: .Leading, relatedBy: .Equal, toItem: artwork, attribute: .Trailing, multiplier: 1, constant: 10)
            )
            container.addConstraint(
                NSLayoutConstraint(item: albumName, attribute: .Top, relatedBy: .Equal, toItem: trackName, attribute: .Bottom, multiplier: 1, constant: 0)
            )
            container.addConstraint(
                NSLayoutConstraint(item: albumName, attribute: .Trailing, relatedBy: .Equal, toItem: container, attribute: .Trailing, multiplier: 1, constant: -10)
            )
            
            container.addConstraint(
                NSLayoutConstraint(item: favouriteBtn, attribute: .Leading, relatedBy: .Equal, toItem: trackName, attribute: .Trailing, multiplier: 1, constant: 5)
            )
            container.addConstraint(
                NSLayoutConstraint(item: favouriteBtn, attribute: .Trailing, relatedBy: .Equal, toItem: listBtn, attribute: .Leading, multiplier: 1, constant: -5)
            )
            container.addConstraint(
                NSLayoutConstraint(item: favouriteBtn, attribute: .Height, relatedBy: .Equal, toItem: trackName, attribute: .Height, multiplier: 1, constant: 0)
            )
            container.addConstraint(
                NSLayoutConstraint(item: favouriteBtn, attribute: .Width, relatedBy: .Equal, toItem: favouriteBtn, attribute: .Height, multiplier: 1, constant: 0)
            )
            container.addConstraint(
                NSLayoutConstraint(item: favouriteBtn, attribute: .CenterY, relatedBy: .Equal, toItem: trackName, attribute: .CenterY, multiplier: 1, constant: 0)
            )
            
            container.addConstraint(
                NSLayoutConstraint(item: listBtn, attribute: .Leading, relatedBy: .Equal, toItem: favouriteBtn, attribute: .Trailing, multiplier: 1, constant: 5)
            )
            container.addConstraint(
                NSLayoutConstraint(item: listBtn, attribute: .Trailing, relatedBy: .Equal, toItem: container, attribute: .Trailing, multiplier: 1, constant: -5)
            )
            container.addConstraint(
                NSLayoutConstraint(item: listBtn, attribute: .Height, relatedBy: .Equal, toItem: favouriteBtn, attribute: .Height, multiplier: 1, constant: 0)
            )
            container.addConstraint(
                NSLayoutConstraint(item: listBtn, attribute: .Width, relatedBy: .Equal, toItem: listBtn, attribute: .Height, multiplier: 1, constant: 0)
            )
            container.addConstraint(
                NSLayoutConstraint(item: listBtn, attribute: .CenterY, relatedBy: .Equal, toItem: favouriteBtn, attribute: .CenterY, multiplier: 1, constant: 0)
            )
            
            container.addConstraint(
                NSLayoutConstraint(item: bar, attribute: .Top, relatedBy: .Equal, toItem: trackName, attribute: .Bottom, multiplier: 1, constant: 20)
            )
            container.addConstraint(
                NSLayoutConstraint(item: bar, attribute: .Leading, relatedBy: .Equal, toItem: artwork, attribute: .Trailing, multiplier: 1, constant: 10)
            )
            container.addConstraint(
                NSLayoutConstraint(item: bar, attribute: .Trailing, relatedBy: .Equal, toItem: container, attribute: .Trailing, multiplier: 1, constant: -10)
            )
            container.addConstraint(
                NSLayoutConstraint(item: bar, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 2)
            )
            
            container.addConstraint(
                NSLayoutConstraint(item: progressBar, attribute: .Top, relatedBy: .Equal, toItem: trackName, attribute: .Bottom, multiplier: 1, constant: 20)
            )
            container.addConstraint(
                NSLayoutConstraint(item: progressBar, attribute: .Leading, relatedBy: .Equal, toItem: artwork, attribute: .Trailing, multiplier: 1, constant: 10)
            )
            container.addConstraint(
                NSLayoutConstraint(item: progressBar, attribute: .Width, relatedBy: .Equal, toItem: bar, attribute: .Width, multiplier: 0.3, constant: 0)
            )
            container.addConstraint(
                NSLayoutConstraint(item: progressBar, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 2)
            )
            
            container.addConstraint(
                NSLayoutConstraint(item: circle, attribute: .Leading, relatedBy: .Equal, toItem: progressBar, attribute: .Trailing, multiplier: 1, constant: -5)
            )
            container.addConstraint(
                NSLayoutConstraint(item: circle, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 10)
            )
            container.addConstraint(
                NSLayoutConstraint(item: circle, attribute: .Height, relatedBy: .Equal, toItem: circle, attribute: .Width, multiplier: 1, constant: 0)
            )
            container.addConstraint(
                NSLayoutConstraint(item: circle, attribute: .CenterY, relatedBy: .Equal, toItem: progressBar, attribute: .CenterY, multiplier: 1, constant: 0)
            )
            
            container.addConstraint(
                NSLayoutConstraint(item: playTime, attribute: .Leading, relatedBy: .Equal, toItem: bar, attribute: .Leading, multiplier: 1, constant: 0)
            )
            container.addConstraint(
                NSLayoutConstraint(item: playTime, attribute: .Top, relatedBy: .Equal, toItem: bar, attribute: .Bottom, multiplier: 1, constant: 2)
            )
            
            container.addConstraint(
                NSLayoutConstraint(item: songLength, attribute: .Trailing, relatedBy: .Equal, toItem: bar, attribute: .Trailing, multiplier: 1, constant: 0)
            )
            container.addConstraint(
                NSLayoutConstraint(item: songLength, attribute: .Top, relatedBy: .Equal, toItem: bar, attribute: .Bottom, multiplier: 1, constant: 2)
            )
            
            container.addConstraint(
                NSLayoutConstraint(item: playerButtonsContainer, attribute: .CenterX, relatedBy: .Equal, toItem: bar, attribute: .CenterX, multiplier: 1, constant: 0)
            )
            container.addConstraint(
                NSLayoutConstraint(item: playerButtonsContainer, attribute: .Top, relatedBy: .Equal, toItem: playTime, attribute: .Bottom, multiplier: 1, constant: 5)
            )
            container.addConstraint(
                NSLayoutConstraint(item: playerButtonsContainer, attribute: .Bottom, relatedBy: .Equal, toItem: container, attribute: .Bottom, multiplier: 1, constant: 0)
            )
            
            playerButtonsContainer.addConstraint(
                NSLayoutConstraint(item: previousSkipBtn, attribute: .Leading, relatedBy: .Equal, toItem: playerButtonsContainer, attribute: .Leading, multiplier: 1, constant: 0)
            )
            playerButtonsContainer.addConstraint(
                NSLayoutConstraint(item: previousSkipBtn, attribute: .Top, relatedBy: .Equal, toItem: playerButtonsContainer, attribute: .Top, multiplier: 1, constant: 0)
            )
            playerButtonsContainer.addConstraint(
                NSLayoutConstraint(item: previousSkipBtn, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 18)
            )
            playerButtonsContainer.addConstraint(
                NSLayoutConstraint(item: previousSkipBtn, attribute: .Height, relatedBy: .Equal, toItem: previousSkipBtn, attribute: .Width, multiplier: 1, constant: 0)
            )
            playerButtonsContainer.addConstraint(
                NSLayoutConstraint(item: previousSkipBtn, attribute: .Trailing, relatedBy: .Equal, toItem: playPauseBtn, attribute: .Leading, multiplier: 1, constant: -15)
            )
            
            playerButtonsContainer.addConstraint(
                NSLayoutConstraint(item: playPauseBtn, attribute: .Leading, relatedBy: .Equal, toItem: previousSkipBtn, attribute: .Trailing, multiplier: 1, constant: 15)
            )
            playerButtonsContainer.addConstraint(
                NSLayoutConstraint(item: playPauseBtn, attribute: .Top, relatedBy: .Equal, toItem: playerButtonsContainer, attribute: .Top, multiplier: 1, constant: 0)
            )
            playerButtonsContainer.addConstraint(
                NSLayoutConstraint(item: playPauseBtn, attribute: .Width, relatedBy: .Equal, toItem: previousSkipBtn, attribute: .Width, multiplier: 1, constant: 0)
            )
            playerButtonsContainer.addConstraint(
                NSLayoutConstraint(item: playPauseBtn, attribute: .Height, relatedBy: .Equal, toItem: playPauseBtn, attribute: .Width, multiplier: 1, constant: 0)
            )
            playerButtonsContainer.addConstraint(
                NSLayoutConstraint(item: playPauseBtn, attribute: .Trailing, relatedBy: .Equal, toItem: nextSkipBtn, attribute: .Leading, multiplier: 1, constant: -15)
            )
            
            playerButtonsContainer.addConstraint(
                NSLayoutConstraint(item: nextSkipBtn, attribute: .Leading, relatedBy: .Equal, toItem: playPauseBtn, attribute: .Trailing, multiplier: 1, constant: 15)
            )
            playerButtonsContainer.addConstraint(
                NSLayoutConstraint(item: nextSkipBtn, attribute: .Top, relatedBy: .Equal, toItem: playerButtonsContainer, attribute: .Top, multiplier: 1, constant: 0)
            )
            playerButtonsContainer.addConstraint(
                NSLayoutConstraint(item: nextSkipBtn, attribute: .Width, relatedBy: .Equal, toItem: previousSkipBtn, attribute: .Width, multiplier: 1, constant: 0)
            )
            playerButtonsContainer.addConstraint(
                NSLayoutConstraint(item: nextSkipBtn, attribute: .Height, relatedBy: .Equal, toItem: playPauseBtn, attribute: .Width, multiplier: 1, constant: 0)
            )
            playerButtonsContainer.addConstraint(
                NSLayoutConstraint(item: nextSkipBtn, attribute: .Trailing, relatedBy: .Equal, toItem: playerButtonsContainer, attribute: .Trailing, multiplier: 1, constant: 0)
            )
            
            
            _constraintsSet = true
        }
        
        super.updateViewConstraints()
    }


}

