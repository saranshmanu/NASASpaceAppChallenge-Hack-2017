//
//  QRCodeGeneratorViewController.swift
//  NasaSpaceApps
//
//  Created by Saransh Mittal on 20/04/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class QRCodeGeneratorViewController: UIViewController {

    var qrcodeImage: CIImage!
    @IBOutlet weak var qrCode: UIImageView!
    
    var code = "google84ybf5489ynpv984ynp98v4pnivn45v"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if qrcodeImage == nil {
            if code == "" {
                return
            }
            let data = code.data(using: String.Encoding.isoLatin1, allowLossyConversion: false)
            let filter = CIFilter(name: "CIQRCodeGenerator")
            filter?.setValue(data, forKey: "inputMessage")
            filter?.setValue("Q", forKey: "inputCorrectionLevel")
            qrcodeImage = filter?.outputImage
            displayQRCodeImage()
        }
    }
    // function to clear out the blur QR code
    func displayQRCodeImage() {
        let scaleX = qrCode.frame.size.width / qrcodeImage.extent.size.width
        let scaleY = qrCode.frame.size.height / qrcodeImage.extent.size.height
        let transformedImage = qrcodeImage.applying(CGAffineTransform(scaleX: scaleX, y: scaleY))
        qrCode.image = UIImage(ciImage: transformedImage)

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
