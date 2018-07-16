//
//  AudioPlayDetailViewController.swift
//  DDAudioPlayerDemo
//
//  Created by wuqh on 2018/7/16.
//  Copyright © 2018年 wuqh. All rights reserved.
//

import UIKit
import SnapKit

class AudioPlayDetailViewController: UIViewController {
    
    // MARK: - UI控件
    private lazy var audioBgImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "bg"))
        imageView.layer.cornerRadius = self.view.bounds.width * 0.5 * 0.5
        imageView.layer.masksToBounds = true
        return imageView
    }()

    private lazy var slider: UISlider = {
        let slider = UISlider(frame: CGRect.zero)
        slider.setThumbImage(#imageLiteral(resourceName: "Listen_Img_ProgressPoint"), for: .normal)
        slider.maximumTrackTintColor = UIColor.lightGray
        slider.minimumTrackTintColor = UIColor.green
        return slider
    }()
    
    private lazy var playButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(#imageLiteral(resourceName: "Listen_Btn_Play"), for: .normal)
        btn.setImage(#imageLiteral(resourceName: "Listen_Btn_Pause"), for: .selected)
        btn.addTarget(self, action: #selector(playButtonClick(btn:)), for: .touchUpInside)
        btn.isSelected = true
        return btn
    }()
    
    private lazy var preButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(#imageLiteral(resourceName: "Listen_Btn_Pre"), for: .normal)
        btn.addTarget(self, action: #selector(preButtonClick(btn:)), for: .touchUpInside)
        return btn
    }()
    
    private lazy var nextButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(#imageLiteral(resourceName: "Listen_Btn_Next"), for: .normal)
        btn.addTarget(self, action: #selector(nextButtonClick(btn:)), for: .touchUpInside)
        return btn
    }()

    // MAKR: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
        beginAnimation()
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor.white
        
        view.addSubview(audioBgImageView)
        view.addSubview(slider)
        view.addSubview(playButton)
        view.addSubview(preButton)
        view.addSubview(nextButton)
        
        audioBgImageView.snp.makeConstraints { (make) in
            make.width.height.equalTo(view.bounds.width * 0.5)
            make.top.equalToSuperview().offset(84)
            make.centerX.equalToSuperview()
        }
        slider.snp.makeConstraints { (make) in
            make.width.equalTo(view.bounds.size.width * 0.7)
            make.top.equalTo(audioBgImageView.snp.bottom).offset(60)
            make.centerX.equalToSuperview()
        }
        playButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(slider).offset(60)
        }
        preButton.snp.makeConstraints { (make) in
            make.right.equalTo(playButton.snp.left).offset(-80)
            make.centerY.equalTo(playButton)
        }
        nextButton.snp.makeConstraints { (make) in
            make.left.equalTo(playButton.snp.right).offset(80)
            make.centerY.equalTo(playButton)
        }
    }

    @objc private func playButtonClick(btn: UIButton) {
        
    }
    
    @objc private func preButtonClick(btn: UIButton) {
        
    }
    @objc private func nextButtonClick(btn: UIButton) {
    
    }
    
    private func beginAnimation() {

        if let _ = audioBgImageView.layer.animation(forKey: "basic") {
            let basicAnimation = CABasicAnimation(keyPath: "transform.rotation")
            basicAnimation.duration = 15
            basicAnimation.fillMode = "forwards"
            basicAnimation.isRemovedOnCompletion = false
            basicAnimation.toValue = (Double.pi * 2)
            basicAnimation.repeatCount = MAXFLOAT
            audioBgImageView.layer.add(basicAnimation, forKey: "basic")
        }else {
            audioBgImageView.layer.resumeAnimate()
        }
        
    }
    private func pasuAnimation() {
        audioBgImageView.layer.pauseAnimate()
    }
    private func removeAnimation() {
        audioBgImageView.layer.removeAnimation(forKey: "basic")
    }
    
}

extension CALayer {

    func pauseAnimate() {
        let pausedTime = self.convertTime(CACurrentMediaTime(), from: nil)
        speed = 0.0
        timeOffset = pausedTime
    }
    func resumeAnimate() {
        let pausedTime = self.timeOffset
        speed = 1.0
        timeOffset = 0.0
        beginTime = 0.0
        let timeSincePause = self.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
        beginTime = timeSincePause
    }
}
