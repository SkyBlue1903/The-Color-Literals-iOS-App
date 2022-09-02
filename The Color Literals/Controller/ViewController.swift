//
//  ViewController.swift
//  The Color Literals
//
//  Created by Erlangga Anugrah Arifin on 02/09/22.
//

import UIKit
import Toast

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
    // Nilai output tanpa modifikasi
    var rOutput: Float = 0.0
    var gOutput: Float = 0.0
    var bOutput: Float = 0.0
    var aOutput: Float = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
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
        // Nilai asli
        rAsli.text = "\(String(format: "%.2f", (colorSelectedByUser.components![0]/1) * 255))"
        gAsli.text = "\(String(format: "%.2f", (colorSelectedByUser.components![1]/1) * 255))"
        bAsli.text = "\(String(format: "%.2f", (colorSelectedByUser.components![2]/1) * 255))"
        alphaAsli.text = "\(String(format: "%.1f", (colorSelectedByUser.components![3]/1) * 100))%"
        
        // Nilai konversi
        rKonv.text = "\(String(format: "%.3f", colorSelectedByUser.components![0]))"
        gKonv.text = "\(String(format: "%.3f",colorSelectedByUser.components![1]))"
        bKonv.text = "\(String(format: "%.3f",colorSelectedByUser.components![2]))"
        alphaKonv.text = "\(String(format: "%.3f",colorSelectedByUser.components![3]))"
        
        // Nilai output
        rOutput = Float(colorSelectedByUser.components![0])
        gOutput = Float(colorSelectedByUser.components![1])
        bOutput = Float(colorSelectedByUser.components![2])
        aOutput = Float(colorSelectedByUser.components![3])

        
    }
    
    @IBAction func tombolSalin(_ sender: Any) {
        if alphaKonv.text == "-" {
            toastError.show()
        } else {
            toastSuccess.show()
            UIPasteboard.general.string = "#colorLiteral(red: \(rOutput), green: \(gOutput), blue: \(bOutput), alpha: \(aOutput))"
        }
        
    }
    
    let toastError = Toast.default(
        image: UIImage(systemName: "xmark.circle")!,
        title: "Gagal",
        subtitle: "Pilih warna dahulu"
    )
    let toastSuccess = Toast.default(
        image: UIImage(systemName: "checkmark.circle")!,
        title: "Sukses",
        subtitle: "Berhasil menyalin"
    )
}
