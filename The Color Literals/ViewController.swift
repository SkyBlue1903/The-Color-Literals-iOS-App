//
//  ViewController.swift
//  The Color Literals
//
//  Created by Erlangga Anugrah Arifin on 02/09/22.
//

import UIKit

class ViewController: UIViewController, UIColorPickerViewControllerDelegate {

    @IBOutlet weak var pilihWarnaButton: UIButton!
    @IBOutlet weak var pratinjauWarna: UIView!
    // Nilai Asli
    @IBOutlet weak var rAsli: UILabel!
    @IBOutlet weak var gAsli: UILabel!
    @IBOutlet weak var bAsli: UILabel!
    @IBOutlet weak var alphaAsli: UILabel!
    
    // Nilai Konversi
    @IBOutlet weak var rKonv: UILabel!
    @IBOutlet weak var gKonv: UILabel!
    @IBOutlet weak var bKonv: UILabel!
    @IBOutlet weak var alphaKonv: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        UIPasteboard.general.string = "Haii teman2 semua!!"
    }

    @IBAction func aksiPilihWarna(_ sender: UIButton) {
        pilihWarna()
    }

    @objc private func pilihWarna() {
        let colorPickerVC = UIColorPickerViewController()
        colorPickerVC.delegate = self
        colorPickerVC.isModalInPresentation = true
        present(colorPickerVC, animated: true)
    }
    
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        let colorSelectedByUser = viewController.selectedColor.cgColor
        pratinjauWarna.backgroundColor = viewController.selectedColor

        print("Green: \(colorSelectedByUser.components![1])")
        print("Blue: \(colorSelectedByUser.components![2])")
        print("Alpha: \(colorSelectedByUser.components![3])")
        
        // Nilai asli
        
        // Nilai konversi
        rKonv.text = "\(colorSelectedByUser.components![0])"
        gKonv.text = "\(colorSelectedByUser.components![1])"
        bKonv.text = "\(colorSelectedByUser.components![2])"
        alphaKonv.text = "\(colorSelectedByUser.components![3])"

        
    }
}
