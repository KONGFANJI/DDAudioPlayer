//
//  ViewController.swift
//  DDAudioPlayerDemo
//
//  Created by wuqh on 2018/7/16.
//  Copyright © 2018年 wuqh. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    let audioArray = ["http://video.zhihuishu.com/zhs_yufa_150820/zhsmanage/image/201712/ae70d4513f244edba6a4973f73de54c6_64.mp3",
                      "http://video.zhihuishu.com/zhs_yufa_150820/zhsmanage/image/201803/5d9a6706d14e4153bb3df3d2b48c7a95_64.mp3",
                      "http://video.zhihuishu.com/zhs_yufa_150820/zhsmanage/image/201712/ae70d4513f244edba6a4973f73de54c6_64.mp3",
                      "http://video.zhihuishu.com/zhs_yufa_150820/zhsmanage/image/201803/5d9a6706d14e4153bb3df3d2b48c7a95_64.mp3"]
    
    private lazy var tableView: UITableView = {
        let tv = UITableView(frame: view.bounds, style: .plain)
        tv.dataSource = self
        tv.delegate = self
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.addSubview(tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return audioArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        cell.textLabel?.text = audioArray[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DDAudioPlayer.shared.play(audioUrl: audioArray[indexPath.row])
        let vc = AudioPlayDetailViewController()
        navigationController?.pushViewController(vc, animated: true)

        
    }
}

