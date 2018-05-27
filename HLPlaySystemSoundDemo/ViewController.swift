//
//  ViewController.swift
//  HLPlaySystemSoundDemo
//
//  Created by LHL on 2018/5/25.
//  Copyright © 2018 HL. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    var myTableview : UITableView? = nil;
    var soundsArray:NSArray?;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableview = UITableView(frame: self.view.bounds, style: UITableViewStyle.plain);
        myTableview?.delegate = self;
        myTableview?.dataSource = self;
        self.view.addSubview(myTableview!);
        
        // 配置数据
        configurationSound();
    }
    
    func configurationSound() {
        let plistPath:String? = Bundle.main.path(forResource: "SoundsList", ofType: "plist")
        soundsArray = NSArray(contentsOfFile: plistPath!);
        self.myTableview?.reloadData();
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return soundsArray!.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellName:String = "HLTableViewCell";
        var cell : UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellName);
        if (nil == cell) {
            cell = UITableViewCell.init(style: UITableViewCellStyle.subtitle, reuseIdentifier: cellName);
        }
        if  (indexPath.row < (soundsArray?.count)!) {
            let dict:NSDictionary = soundsArray?.object(at: indexPath.row) as! NSDictionary;
            let fileName:String? = String.init(format: "%@  %@", (dict["category"] as! String), (dict["fileName"] as! String));
            cell?.textLabel?.text = fileName as String? ;
                
            cell?.detailTextLabel?.text = String.init(format: "soundId: %@", (dict["soundId"] as! String));
        }
        return cell!;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dict:NSDictionary = soundsArray?.object(at: indexPath.row) as! NSDictionary;
        let soundId:NSString = dict.object(forKey: "soundId") as! NSString;
        
        AudioServicesPlaySystemSound(SystemSoundID(soundId.intValue));
        
//        播放震动
//        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    }
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

