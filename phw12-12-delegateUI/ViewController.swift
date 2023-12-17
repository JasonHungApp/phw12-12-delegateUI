//
//  ViewController.swift
//  phw12-12-delegateUI
//
//  Created by jasonhung on 2023/12/17.
//

import UIKit

protocol BGcolorChangeable {
    func changeBgColor(bgColor:UIColor)
}

extension UIView:BGcolorChangeable{
    func changeBgColor(bgColor:UIColor) {
        self.backgroundColor = bgColor
    }
}


class BGColorManager{
    
    var bgColorDelegate:[BGcolorChangeable]=[]
    
    func bgColorDelegate(ui: BGcolorChangeable) {
        bgColorDelegate.append(ui)
    }
    
    func changeBgColor(bgColor:UIColor){
        print("changeBgColor")
        for ui in bgColorDelegate {
            ui.changeBgColor(bgColor: bgColor)
        }
    }
}


class ViewController: UIViewController {
   
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var textField: UITextField!
    var bgColorManager = BGColorManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        bgColorManager.bgColorDelegate(ui: label)
        bgColorManager.bgColorDelegate(ui: button)
        bgColorManager.bgColorDelegate(ui: view1)
        bgColorManager.bgColorDelegate(ui: textView)
        bgColorManager.bgColorDelegate(ui: textField)

    }

           
    @IBAction func changeOtherUiBgColor(_ sender: UISegmentedControl) {
        var color = UIColor.white
        
        switch sender.selectedSegmentIndex{
        case 0: color = UIColor.white
        case 1: color = UIColor.red.withAlphaComponent(0.5)
        case 2: color = UIColor.green.withAlphaComponent(0.5)
        case 3: color = UIColor.blue.withAlphaComponent(0.2)
        default:
            color = UIColor.white
        }
        
            bgColorManager.changeBgColor(bgColor: color)

        
    }
    
 
}

