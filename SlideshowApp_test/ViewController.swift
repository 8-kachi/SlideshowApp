//
//  ViewController.swift
//  SlideshowApp_test
//
//  Created by 浅野総一郎 on 2021/09/12.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var prevButton: UIButton!
    
    var nowIndex:Int = 0
    
    var timer: Timer!
    
    var imageArray:[UIImage] = [
        UIImage(named: "401")!,
        UIImage(named: "go")!,
        UIImage(named: "yu")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (timer != nil) {
        timer.invalidate()
            timer = nil
            
            startButton.setTitle("再生", for: .normal)}
        
        let  resultViewController:ResultViewController = segue.destination as! ResultViewController
        
        resultViewController.selectedImg = imageArray[nowIndex]
        
    }
    
    @IBAction func slidShowButton(_ sender: Any) {
        if (timer == nil) {
            
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
            
            startButton.setTitle("停止", for: .normal)
            nextButton.isEnabled = false
            prevButton.isEnabled = false
            
        } else {
            
            timer.invalidate()
            
            timer = nil
            
            startButton.setTitle("再生", for: .normal)
            nextButton.isEnabled = true
            prevButton.isEnabled = true
            
        }
    }
    
    //進むボタン
    @IBAction func nextShowButton(_ sender: Any) {
        if (startButton.currentTitle == "再生") {
            
            changeImage()
            
        }
    }
    
    //戻るボタン
    @IBAction func prevShowButton(_ sender: Any) {
        if (startButton.currentTitle == "再生") {
            
            backchangeImage()
            
        }
    }
    
    @objc func changeImage() {
        
        nowIndex += 1
        
        if (nowIndex == imageArray.count) {
            
            nowIndex = 0
            
        }
        
        imageView.image = imageArray[nowIndex]
        
    }
    
    @objc func backchangeImage() {
        
        nowIndex -= 1
        
        if (nowIndex == -1) {
            
            nowIndex = 2
            
        }
        
        
        imageView.image = imageArray[nowIndex]
        
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue){
    }
    
    
}
