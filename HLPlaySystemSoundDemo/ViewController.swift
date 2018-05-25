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
    

    var tableview : UITableView? = nil;
    var soundsArray = NSMutableArray();
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview = UITableView(frame: self.view.bounds, style: UITableViewStyle.plain);
        tableview?.delegate = self;
        tableview?.dataSource = self;
        self.view.addSubview(tableview!);
        
        tableview?.register(UITableViewCell.self, forCellReuseIdentifier: "HLTableViewCell")
        
        // 配置数据
        configurationSound();
    }
    
    func configurationSound() {
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return soundsArray.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = (tableview?.dequeueReusableCell(withIdentifier: "HLTableViewCell", for: indexPath))!;
        
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        AudioServicesPlaySystemSound(1335);
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

