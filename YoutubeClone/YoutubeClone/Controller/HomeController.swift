//
//  ViewController.swift
//  YoutubeClone
//
//  Created by Sarin Swift on 12/31/18.
//  Copyright © 2018 sarinswift. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    let cellId = "cellId"
    
//    var videos: [Video] = {
//        var kanyeChannel = Channel()
//        kanyeChannel.name = "KanyeIsTheBest"
//        kanyeChannel.profileImageName = "kanye_profile"
//
//        var blankSpaceVideo = Video()
//        blankSpaceVideo.title = "Taylor Swift - Blank Space"
//        blankSpaceVideo.thumbnailImageName = "taylor_swift_blank_space"
//        blankSpaceVideo.channel = kanyeChannel
//        blankSpaceVideo.numberOfViews = 347236481
//
//        var badBloodVideo = Video()
//        badBloodVideo.title = "Taylor Swift - Bad Blood featuring Kendrick Lamar"
//        badBloodVideo.thumbnailImageName = "taylor_swift_bad_blood"
//        badBloodVideo.channel = kanyeChannel
//        badBloodVideo.numberOfViews = 827637691
//
//        return [blankSpaceVideo, badBloodVideo]
//    }()
    
    var videos: [Video]?
    
    func fetchVideos() {
        // go in jsonprettyprint.com and enter the text in sublime file
        let url = URL(string: "https://s3-us-west-2.amazonaws.com/youtubeassets/home.json")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if error != nil {
                print(error as Any)
                return
            }
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                
                self.videos = [Video]()
                
                for dict in json as! [[String: AnyObject]] {
                    let video = Video()
                    video.title = dict["title"] as? String
                    video.thumbnailImageName = dict["thumbnail_image_name"] as? String
                    
                    let channelDict = dict["channel"] as! [String: AnyObject]
                    
                    let channel = Channel()
                    channel.name = channelDict["name"] as? String
                    channel.profileImageName = channelDict["profile_image_name"] as? String
                    
                    video.channel = channel
                    
                    self.videos?.append(video)
                }
                self.collectionView?.reloadData()
                
            } catch let jsonError {
                print(jsonError)
            }
            
            let str = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print(str as Any)
        }.resume()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchVideos()
        
        navigationItem.title = "Home"
        navigationController?.navigationBar.isTranslucent = false
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = "Home"
        titleLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        navigationItem.titleView = titleLabel
        
        collectionView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)

        collectionView.register(VideoCell.self, forCellWithReuseIdentifier: cellId)
        
        // moving the top of the collectionview 50 pixels down from the navbar
        collectionView.contentInset = UIEdgeInsets(top: 50,left: 0,bottom: 0,right: 0)
        // sets the scroll indicator on the left most side to stop wight under the navbar
        collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 50,left: 0,bottom: 0,right: 0)
        
        setupMenuBar()
        setupNavBarButtons()
    }
    
    let menuBar: MenuBar = {
        let mb = MenuBar()
        return mb
    }()
    
    // no other class should have access to this function
    private func setupMenuBar() {
        view.addSubview(menuBar)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat(format: "V:|[v0(50)]|", views: menuBar)
    }
    
    private func setupNavBarButtons() {
        // .alwaysOriginal will set the image to be the original colors. Or else it would be a blue color by default
        let searchImage = UIImage(named: "search_icon")?.withRenderingMode(.alwaysOriginal)
        let moreImage = UIImage(named: "nav_more_icon")?.withRenderingMode(.alwaysOriginal)
        let searchBarButtonItem = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(handleSearch))
        let moreBarButtonItem = UIBarButtonItem(image: moreImage, style: .plain, target: self, action: #selector(handleMore))
        navigationItem.rightBarButtonItems = [moreBarButtonItem, searchBarButtonItem]
    }
    @objc func handleSearch() {
        print(123)
    }
    @objc func handleMore() {
        print(456)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return videos?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! VideoCell
        cell.video = videos?[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.width - 16 - 16) * 9 / 16
        return CGSize(width: view.frame.width, height: height + 16 + 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}




