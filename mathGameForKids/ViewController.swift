//
//  ViewController.swift
//  mathGameForKids
//
//  Created by BettyPan on 2020/12/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var carImageView: UIImageView!
    @IBOutlet weak var carPriceLabel: UILabel!
    
    @IBOutlet weak var carSelect: UISegmentedControl!
   
    @IBOutlet weak var thousandQtyLabel: UILabel!
    @IBOutlet weak var fiveHundredQtyLabel: UILabel!
    @IBOutlet weak var aHundredQtyLabel: UILabel!
    @IBOutlet weak var fiftyQtyLabel: UILabel!
    @IBOutlet weak var tenQtyLabel: UILabel!
    @IBOutlet weak var fiveQtyLabel: UILabel!
    @IBOutlet weak var oneQtyLabel: UILabel!
    
    @IBOutlet weak var aHundredStepper: UIStepper!
    @IBOutlet weak var fiftyStepper: UIStepper!
    @IBOutlet weak var thousandStepper: UIStepper!
    @IBOutlet weak var fiveHundredStepper: UIStepper!
    @IBOutlet weak var tenStepper: UIStepper!
    @IBOutlet weak var fiveStepper: UIStepper!
    @IBOutlet weak var oneStepper: UIStepper!
    
    @IBOutlet weak var SumLabel: UILabel!
    @IBOutlet weak var discriptionLabel: UILabel!
    
    //抓出車子圖片
    let whiteCarImage = UIImage(named: "whiteCar")
    let blueCarImage = UIImage(named: "blueCar")
    let orangeCarImage = UIImage(named: "orangeCar")
    //定義車款價錢
    let whiteCarPrice = 3799
    let blueCarPrice = 7458
    let orangeCarPrice = 8076
    //金額預設數量(取Stepper.value，文字轉數字用)
    var thousandQtyNum:Int = 0
    var fiveHundredQtyNum:Int = 0
    var aHundredQtyNum:Int = 0
    var fiftyQtyNum:Int = 0
    var tenQtyNum:Int = 0
    var fiveQtyNum:Int = 0
    var oneQtyNum:Int = 0
    //計算總和之function
    func calculate() {
        let sum = thousandQtyNum*1000 + fiveHundredQtyNum*500 + aHundredQtyNum*100 + fiftyQtyNum*50 + tenQtyNum*10 + fiveQtyNum*5 + oneQtyNum*1
        SumLabel.text = "\(sum)"
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //連接Cars圖片，車的價錢
    @IBAction func chooseCars(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            carImageView.image = whiteCarImage
            carPriceLabel.text = "$\(whiteCarPrice)"
        }else if sender.selectedSegmentIndex == 1 {
            carImageView.image = blueCarImage
            carPriceLabel.text = "$\(blueCarPrice)"
        }else{
            carImageView.image = orangeCarImage
            carPriceLabel.text = "$\(orangeCarPrice)"
        }
        
    }
    
    //label.value, sum
    @IBAction func changeQty(_ sender: UIStepper) {
        thousandQtyNum = Int(thousandStepper.value)
        fiveHundredQtyNum = Int(fiveHundredStepper.value)
        aHundredQtyNum = Int(aHundredStepper.value)
        fiftyQtyNum = Int(fiftyStepper.value)
        tenQtyNum = Int(tenStepper.value)
        fiveQtyNum = Int(fiveStepper.value)
        oneQtyNum = Int(oneStepper.value)
        //將Stepper值，顯示於對應label中
        thousandQtyLabel.text = "\(thousandQtyNum)"
        fiveHundredQtyLabel.text = "\(fiveHundredQtyNum)"
        aHundredQtyLabel.text = "\(aHundredQtyNum)"
        fiftyQtyLabel.text = "\(fiftyQtyNum)"
        tenQtyLabel.text = "\(tenQtyNum)"
        fiveQtyLabel.text = "\(fiveQtyNum)"
        oneQtyLabel.text = "\(oneQtyNum)"
        
        calculate()
    }
    
    @IBAction func buy(_ sender: UIButton) {
        if carSelect.selectedSegmentIndex == 0 {
            if SumLabel.text == "\(whiteCarPrice)" {
                discriptionLabel.text = "YES! YOU DID IT!!"
            }else if SumLabel.text! < "\(whiteCarPrice)" {
                discriptionLabel.text = "THE AMOUNT ISN'T ENOUGH, PLEASE CHECK AGAIN!"
            }else if SumLabel.text! > "\(whiteCarPrice)" {
                discriptionLabel.text = "OVER THE AMOUNT, PLEASE CHECK!"
            }
        }else if carSelect.selectedSegmentIndex == 1 {
            if SumLabel.text == "\(blueCarPrice)" {
                discriptionLabel.text = "YES! YOU DID IT!!"
            }else if SumLabel.text! < "\(blueCarPrice)" {
                discriptionLabel.text = "THE AMOUNT ISN'T ENOUGH, PLEASE CHECK AGAIN!"
            }else if SumLabel.text! > "\(blueCarPrice)"{
                discriptionLabel.text = "OVER THE AMOUNT, PLEASE CHECK!"
            }
        }else{
            if SumLabel.text == "\(orangeCarPrice)" {
                discriptionLabel.text = "YES! YOU DID IT!!"
            }else if SumLabel.text! < "\(orangeCarPrice)" {
                discriptionLabel.text = "THE AMOUNT ISN'T ENOUGH, PLEASE CHECK AGAIN!"
            }else if SumLabel.text! > "\(orangeCarPrice)" {
                discriptionLabel.text = "OVER THE AMOUNT, PLEASE CHECK!"
            }
    
}

}
    @IBAction func restart(_ sender: Any) {
        carSelect.selectedSegmentIndex = 0
        carImageView.image = whiteCarImage
        carPriceLabel.text = "$\(whiteCarPrice)"
        thousandStepper.value = 0
        fiveHundredStepper.value = 0
        aHundredStepper.value = 0
        fiftyStepper.value = 0
        tenStepper.value = 0
        fiveStepper.value = 0
        oneStepper.value = 0
        
        thousandQtyLabel.text = "0"
        fiveHundredQtyLabel.text = "0"
        aHundredQtyLabel.text = "0"
        fiftyQtyLabel.text = "0"
        tenQtyLabel.text = "0"
        fiveQtyLabel.text = "0"
        oneQtyLabel.text = "0"
        
        SumLabel.text = "0"
        discriptionLabel.text = ""
        
    }
}
