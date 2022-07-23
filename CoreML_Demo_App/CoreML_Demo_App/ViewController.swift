//
//  ViewController.swift
//  CoreML_Demo_App
//
//  Created by Kwangjun Kim on 2022/07/24.
//

import UIKit
import CoreML
import Vision
import ImageIO

class ViewController: UIViewController {
    
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var button: UIButton!
    @IBOutlet var label: UILabel!
    
    lazy var detectionRequest: VNCoreMLRequest = {
        do {
            let model = try VNCoreMLModel(for: CoreML_Demo().model)
            
            let request = VNCoreMLRequest(model: model, completionHandler: { [weak self] request, error in
                guard let self = self else { return }
                
                self.processDetection(for: request, error: error)
            })
            request.imageCropAndScaleOption = .scaleFit
            return request
        } catch {
            fatalError("Failed to load Vision ML model: \(error)")
        }
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoImageView.backgroundColor = .secondarySystemBackground
        button.backgroundColor = .systemBlue
        button.setTitle("Take picture", for: .normal)
        button.setTitleColor(.white, for: .normal)
    }
    
    @IBAction func didTapButton() {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true)
    }
    
//    @IBAction func testPhoto(sender: UIButton) {
//        let vc = UIImagePickerController()
//        vc.sourceType = .photoLibrary
//        vc.delegate = self
//        present(vc, animated: true)
//    }

    


}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
       
        
        picker.dismiss(animated: true) { [weak self] in
            guard let self = self else { return }
            guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else { return }
            DispatchQueue.main.async {
                self.photoImageView.image = image
            }
            self.updateDetections(for: image)
        }
        
        
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
    
}

extension ViewController {
    private func updateDetections(for image: UIImage) {

        let orientation = CGImagePropertyOrientation(rawValue: UInt32(image.imageOrientation.rawValue))
        guard let ciImage = CIImage(image: image) else { fatalError("Unable to create \(CIImage.self) from \(image).") }
        
        DispatchQueue.global(qos: .userInitiated).async {
            let handler = VNImageRequestHandler(ciImage: ciImage, orientation: orientation!)
            do {
                try handler.perform([self.detectionRequest])
            } catch {
                print("Failed to perform detection.\n\(error.localizedDescription)")
            }
        }
    }
    
    private func processDetection(for request: VNRequest, error: Error?) {
        DispatchQueue.main.async {
            guard let results = request.results else {
                print("Unable to detect anything.\n\(error!.localizedDescription)")
                return
            }
        
            let detections = results as! [VNClassificationObservation]
            self.drawDetectionsOnPreview(detections: detections)
        }
    }
    
    func drawDetectionsOnPreview(detections: [VNClassificationObservation]) {
        guard let image = self.photoImageView?.image else {
            return
        }
        
        let imageSize = image.size
        let scale: CGFloat = 0
        UIGraphicsBeginImageContextWithOptions(imageSize, false, scale)
        
        image.draw(at: CGPoint.zero)
        
        for detection in detections {
            
            DispatchQueue.main.async {
                self.label.text = "\(detection.identifier) confidence: \(detection.confidence)"
            }
            
//            print(detection.labels.map({"\($0.identifier) confidence: \($0.confidence)"}).joined(separator: "\n"))
            print("-----------")
            
            guard let boundingBox = detection.accessibilityPath?.bounds else { return }
            let rectangle = CGRect(x: boundingBox.minX*image.size.width, y: (1-boundingBox.minY-boundingBox.height)*image.size.height, width: boundingBox.width*image.size.width, height: boundingBox.height*image.size.height)
            UIColor(red: 0, green: 1, blue: 0, alpha: 0.4).setFill()
            UIRectFillUsingBlendMode(rectangle, CGBlendMode.normal)
        }
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.photoImageView?.image = newImage
    }
}

//extension ViewController: UIImagePickerControllerDelegate {
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        picker.dismiss(animated: true)
//
//        guard let image = info[.originalImage] as? UIImage else {
//            return
//        }
//
//        self.photoImageView?.image = image
//        updateDetections(for: image)
//    }
//}
