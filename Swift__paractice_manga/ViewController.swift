//
//  ViewController.swift
//  Swift__paractice_manga
//
//  Created by 中野湧仁 on 2018/12/26.
//  Copyright © 2018年 中野湧仁. All rights reserved.
//

import UIKit
//      子クラス            親クラス
class ViewController: UIViewController {

    @IBOutlet var countLabel: UILabel!
    @IBOutlet var runnnerImageView: UIImageView!
    
    var imageArray = [UIImage]()
    var timer1 = Timer()
//    経過時間
    var countUp = 0
    var timer2 = Timer()
    var updateCount = 0
    @IBOutlet var runButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countLabel.text = "0"

        let image0 = UIImage(named: "1")
        let image1 = UIImage(named: "2")
        let image2 = UIImage(named: "3")
        let image3 = UIImage(named: "4")
        let image4 = UIImage(named: "5")
        let image5 = UIImage(named: "6")
        let image6 = UIImage(named: "7")
        let image7 = UIImage(named: "8")
        let image8 = UIImage(named: "9")
        let image9 = UIImage(named: "10")
        let image10 = UIImage(named: "11")
        
        
        imageArray = [image0!,image1!,image2!,image3!,image4!,image5!,image6!,image7!,image8!,image9!,image10!]
        
        
    }

    @IBAction func run(_ sender: Any) {
//        Enable = 有効
        runButton.isEnabled = false
//        1秒ごとにかっこの中が呼ばれる.リピートつき.
        timer1 = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
//            カウントアップ
//            blockに入るとselfが必要.
//            self = 自分自身（これの場合変数）
            self.countUp = self.countUp + 1
//            ラベルに反映
            self.countLabel.text = String(self.countUp)
        })
        
        timer2 = Timer.scheduledTimer(withTimeInterval: 0.8, repeats: true, block: { (timer) in
            
//            タンスの中から画像をとりだして、UIimageViewに反映して浮く
            if(self.updateCount > 10){
                
                self.updateCount = 0
                
                self.runnnerImageView.image = UIImage(named: "1")
                
            }else{
                
                self.runnnerImageView.image =
                    
                self.imageArray[self.updateCount]
                
            }
            
            
            
            self.updateCount = self.updateCount + 1
            
            
        })
        
        
        
        
    }
    
    @IBAction func stop(_ sender: Any) {
        runButton.isEnabled = true
        timer1.invalidate()
        timer2.invalidate()
    }
    

}

