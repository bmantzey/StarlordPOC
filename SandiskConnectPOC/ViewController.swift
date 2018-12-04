//
//  ViewController.swift
//  SandiskConnectPOC
//
//  Created by Brandon Mantzey on 8/29/18.
//  Copyright © 2018 Brandon Mantzey. All rights reserved.
//

import UIKit
import FilesProvider
import Alamofire

class ViewController: UIViewController {
    
    let server: URL = URL(string: "http://172.25.63.1/myconnect/Files/CONFIG_Finally.DAT")!
//    let server: URL = URL(string: "http://172.25.63.1/myconnect/")!
    let username = ""
    let password = ""
    
    var folderCreator: WebDAVFileProvider?
    var webdav: WebDAVFileProvider?
    
    //    @IBOutlet weak var testTextField: UITextField!
    @IBOutlet weak var uploadProgressView: UIProgressView!
    @IBOutlet weak var folderNameTextField: UITextField!
    //    @IBOutlet weak var downloadProgressView: UIProgressView!
    
    var writeData: Data?
    
    override func viewDidLoad() {
        
        let fileMakerTest = StarlordFileMaker()
        //        fileMakerTest.tempRead()
        fileMakerTest.tempMessagePackTest()
        
        writeData = fileMakerTest.tempWrite()
        
        super.viewDidLoad()
        
        //        let credential = URLCredential(user: username, password: password, persistence: .permanent)
        
        webdav = WebDAVFileProvider(baseURL: server, credential: nil)!
        webdav?.delegate = self as FileProviderDelegate
        folderCreator = WebDAVFileProvider(baseURL: server, credential: nil)!
        folderCreator?.delegate = self as FileProviderDelegate
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func createFolder(_ sender: Any) {
        let _ = folderCreator?.create(folder: "new folder", at: "/", completionHandler: nil)
    }
    
    @IBAction func createFile(_ sender: Any) {
        let data = "Hello world from sample.txt!".data(using: .utf8)
        let _ = webdav?.writeContents(path: "sample.txt", contents: data, atomically: true, overwrite: true, completionHandler: nil)
        //(path: "sample.txt", content: data, atomically: true, overwrite: true, completionHandler: nil)
    }
    
    @IBAction func getData(_ sender: Any) {
        webdav?.contents(path: "sample.txt", completionHandler: {
            contents, error in
            if let contents = contents {
                print(String(data: contents, encoding: .utf8) ?? "")
            }
        })
    }
    
    @IBAction func remove(_ sender: Any) {
        let _ = webdav?.removeItem(path: "sample.txt", completionHandler: nil)
    }
    
    @IBAction func download(_ sender: Any) {
        //        let localURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("fileprovider.png")
        //        let remotePath = "fileprovider.png"
        
        //        let progress = webdav?.copyItem(path: remotePath, toLocalURL: localURL, completionHandler: nil)
        //        downloadProgressView.observedProgress = progress
    }
    
    func showAlert(text: String, error: Bool) {
        let alert = UIAlertController(title: error ? "Error" : "Message", message: text, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { _ in
            //            self.uploadProgressView.progress = 0
        })
        alert.addAction(ok)
        self.show(alert, sender: nil)
    }
    
    @objc func didCompleteFileWrite() {
        self.uploadProgressView.progress = 0.0
    }
    @objc func deleteExistingFile() {
        let _ = webdav?.removeItem(path: "/Files/CONFIG.DAT", completionHandler: { error in
            if let error = error {
                print("error: \(error)")
            } else {
                print("Deleted existing file!")
                self.performSelector(onMainThread: #selector(self.writeTestFile), with: nil, waitUntilDone: true)
            }
        })
    }
    @objc func writeTestFile() {
        webdav = WebDAVFileProvider(baseURL: server, credential: nil)!
        webdav?.delegate = self as FileProviderDelegate
        self.uploadProgressView.observedProgress = nil

        let localURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("CONFIG.DAT")
        let destinationString = folderNameTextField.text! +  "CONFIG.DAT"
        
        self.uploadProgressView.observedProgress = webdav?.copyItem(localFile: localURL, to: destinationString, overwrite: true, completionHandler: { error in
            //        self.uploadProgressView.observedProgress = webdav?.copyItem(localFile: localURL, to: destinationString, completionHandler: { error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("Successfully wrote Starlord binary file contents.")
            }
            
            self.performSelector(onMainThread: #selector(self.didCompleteFileWrite), with: nil, waitUntilDone: false)
        })
    }
    @objc func createFilesFolder() {
        let _ = folderCreator?.create(folder: "Files", at: "", completionHandler: { error in
            if let error = error {
                print("\(error)")
            } else {
                print("Created files folder")
            }
        })
    }
    @objc func createRandomFolder() {
        let randomString = String.randomString(length: 5)
        
        let _ = folderCreator?.create(folder: randomString, at: "/Files", completionHandler: { error in
            if let error = error {
                print("\(error)")
            } else {
                print("Created  folder named: \(randomString)")

                let dispatchTime = 2.0
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + dispatchTime, execute: {
                    self.performSelector(onMainThread: #selector(self.writeTestFile), with: nil, waitUntilDone: true)
                })
                
//                let timer = Timer(timeInterval: 2.0, target: self, selector: #selector(self.writeTestFile), userInfo: nil, repeats: false)
//                timer.fire()
                
//                self.performSelector(onMainThread: #selector(self.writeTestFile), with: nil, waitUntilDone: true)
            }
        })
    }
    
    private func putConfigDat(folderName: String,
                                      completion: @escaping() -> Void,
                                      errorHandler: @escaping(_ error: Error, _ statusCode: Int?) -> Void) {
        
        Alamofire.request(FieldNETRouter.putConfigDat(directory: folderName, data: self.writeData!))
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success:
                    if let _ = response.result.value as? [String: Any] {
                        completion()
                        return
                    }
                case .failure(let error):
                    errorHandler(error, response.response?.statusCode)
                }
        }
    }

    
    @IBAction func upload(_ sender: Any) {
        
        
//        self.performSelector(onMainThread: #selector(self.writeTestFile), with: nil, waitUntilDone: true)

        let nowTimestamp = Date().iso8601

        let httpHeaders = [
            "Pragma": "no-cache",
            "X-AirStash-Date": nowTimestamp,
            "User-Agent": "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36",
            "Referer": "http://172.25.63.1/myconnect/Files/"
        ]
        
        Alamofire.upload(self.writeData!, to: server, method: .put, headers: httpHeaders).response(completionHandler: { (response) in
            if let error = response.error {
                print("error: \(error.localizedDescription)")

            } else if let data = response.data {
                if let dataText = String(data: data, encoding: .utf8) {
                    if dataText.count == 0 {
                        print("SUCCESS!!!")
                    } else {
                        print(dataText)
                    }
                }
            } else {
                print("ELSE!!")
            }
        })
        /*
        responseJSON { (response) in
            if let json = response.result.value as? [String: Any] {
                print(json)
            } else {
                let message = response.result.error != nil ? response.result.error!.localizedDescription : "Unable to communicate."
                print(message)
            }
        }
 */

        
//        Alamofire.upload(self.writeData!, to: server), method: .put, headers: nil)
        
        /*
        .responseJSON { (response) in
            if let json = response.result.value as? Dictionary {
                print(json)
            } else {
                let message = response.result.error != nil ? response.result.error!.localizedDescription : "Unable to communicate."
                
            }
        }
 */

            /*
        webdav?.contentsOfDirectory(path: "", completionHandler: { files, error in
            if let error = error {
                print("Error getting contents of root directory. \(error)")
            } else {
                var hasFilesFolder = false
                //                var hadExistingFile = false
                
                for aFile in files {
                    if aFile.name.lowercased() == "files" {
                        hasFilesFolder = true
                        print("Found Files Folder!")
                    }
                }
                
                if hasFilesFolder == false {
                    self.performSelector(onMainThread: #selector(self.createFilesFolder), with: nil, waitUntilDone: true)
                }
         
               self.performSelector(onMainThread: #selector(self.writeTestFile), with: nil, waitUntilDone: true)
                let destinationString = "/Files/" + self.folderNameTextField.text!
                self.putConfigDat(folderName: destinationString, completion: {
                        print("SUCCESS!")
                    }, errorHandler: {error, statusCode in
                        print("ERROR: \(error).  StatusCode: \(statusCode ?? 0)")
                })

//                self.performSelector(onMainThread: #selector(self.createRandomFolder), with: nil, waitUntilDone: true)
                
                //                self.webdav?.contentsOfDirectory(path: "/Files", completionHandler: { files, error in
                //                    if let error = error {
                //                        print("Error getting contents of /Files directory. \(error)")
                //                    } else {
                //                        for aFile in files {
                //                            if aFile.name.lowercased() == "config.dat" {
                //                                print("Found existing file.")
                //                                hadExistingFile = true
                //                                self.performSelector(onMainThread: #selector(self.deleteExistingFile), with: nil, waitUntilDone: true)
                //                                break
                //                            }
                //                        }
                //                    }
                //
                //                    if hadExistingFile == false {
                //                        self.performSelector(onMainThread: #selector(self.writeTestFile), with: nil, waitUntilDone: true)
                //                    }
                //                })
            }
        })
 */
    }
}

extension ViewController: FileProviderDelegate {
    
    func fileproviderSucceed(_ fileProvider: FileProviderOperations, operation: FileOperationType) {
        switch operation {
        case .copy(source: let source, destination: let dest):
            print("\(source) copied to \(dest).")
        case .remove(path: let path):
            print("\(path) has been deleted.")
        default:
            if let destination = operation.destination {
                print("\(operation.actionDescription) from \(operation.source) to \(destination) succeed.")
            } else {
                print("\(operation.actionDescription) on \(operation.source) succeed.")
            }
        }
    }
    
    func fileproviderFailed(_ fileProvider: FileProviderOperations, operation: FileOperationType, error: Error) {
        print("error: \(error)")
        
        switch operation {
        case .copy(source: let source, destination: let dest):
            print("copying \(source) to \(dest) has been failed.")
        case .remove:
            print("file can't be deleted.")
        default:
            if let destination = operation.destination {
                print("\(operation.actionDescription) from \(operation.source) to \(destination) failed.")
            } else {
                print("\(operation.actionDescription) on \(operation.source) failed.")
            }
        }
    }
    
    func fileproviderProgress(_ fileProvider: FileProviderOperations, operation: FileOperationType, progress: Float) {
        switch operation {
        case .copy(source: let source, destination: let dest) where dest.hasPrefix("file://"):
            print("Downloading \(source) to \((dest as NSString).lastPathComponent): \(progress * 100) completed.")
        case .copy(source: let source, destination: let dest) where source.hasPrefix("file://"):
            print("Uploading \((source as NSString).lastPathComponent) to \(dest): \(progress * 100) completed.")
        case .copy(source: let source, destination: let dest):
            print("Copy \(source) to \(dest): \(progress * 100) completed.")
        default:
            break
        }
    }
    
    @IBAction func didTapCommitToFile(_ sender: Any) {
        //        self.commitFile()
        self.upload(sender)
        //        self.webdav?.contentsOfDirectory(path: "/", completionHandler: { fileObjects, error in
        //            print("fileObjects: \(fileObjects)")
        //        })
        
        //        testTextField.resignFirstResponder()
    }
}

/*
 class ViewController: UIViewController {
 let server: URL = URL(string: "https://172.25.63.1/myconnect/files/")!
 var webdav: WebDAVFileProvider?
 
 @IBOutlet weak var uploadProgressView: UIProgressView!
 
 
 @IBOutlet weak var testTextField: UITextField!
 
 override func viewDidLoad() {
 super.viewDidLoad()
 
 let credential = URLCredential(user: "", password: "", persistence: URLCredential.Persistence.none)
 
 webdav = WebDAVFileProvider(baseURL: server, credential: credential)!
 webdav?.delegate = self as FileProviderDelegate
 
 // Do any additional setup after loading the view, typically from a nib.
 }
 
 override func didReceiveMemoryWarning() {
 super.didReceiveMemoryWarning()
 // Dispose of any resources that can be recreated.
 }
 
 @IBAction func didTapCommitToFile(_ sender: Any) {
 self.commitFile()
 
 testTextField.resignFirstResponder()
 }
 
 private func commitFile() {
 //        let url = URL(fileURLWithPath: "http://172.25.63.1/myconnect/files/")
 let filePath = "testfile2.txt"
 
 
 
 //        let webdav = WebDAVFileProvider(baseURL: url, credential: nil)
 
 if let text = testTextField.text {
 let contents = text.data(using: .utf8)
 do {
 try text.write(to: url, atomically: true, encoding: String.Encoding.utf8)
 } catch {
 print("FAIL")
 }
 //            webdav?.writeContents(path: filePath, contents: contents, atomically: true, completionHandler: nil)
 
 let localURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent(filePath)
 let remotePath = "/" + filePath
 
 let progress = webdav?.copyItem(localFile: localURL, to: remotePath, completionHandler: nil)
 uploadProgressView.observedProgress = progress
 }
 
 }
 
 }
 
 extension ViewController: FileProviderDelegate {
 func fileproviderSucceed(_ fileProvider: FileProviderOperations, operation: FileOperationType) {
 switch operation {
 case .copy(source: let source, destination: let dest):
 print("\(source) copied to \(dest).")
 case .remove(path: let path):
 print("\(path) has been deleted.")
 default:
 if let destination = operation.destination {
 print("\(operation.actionDescription) from \(operation.source) to \(destination) succeed.")
 } else {
 print("\(operation.actionDescription) on \(operation.source) succeed.")
 }
 }
 
 }
 
 func fileproviderFailed(_ fileProvider: FileProviderOperations, operation: FileOperationType, error: Error) {
 print("\(error)")
 
 switch operation {
 case .copy(source: let source, destination: let dest):
 print("copying \(source) to \(dest) has been failed.")
 case .remove:
 print("file can't be deleted.")
 default:
 if let destination = operation.destination {
 print("\(operation.actionDescription) from \(operation.source) to \(destination) failed.")
 } else {
 print("\(operation.actionDescription) on \(operation.source) failed.")
 }
 }
 }
 
 func fileproviderProgress(_ fileProvider: FileProviderOperations, operation: FileOperationType, progress: Float) {
 switch operation {
 case .copy(source: let source, destination: let dest) where dest.hasPrefix("file://"):
 print("Downloading \(source) to \((dest as NSString).lastPathComponent): \(progress * 100) completed.")
 case .copy(source: let source, destination: let dest) where source.hasPrefix("file://"):
 print("Uploading \((source as NSString).lastPathComponent) to \(dest): \(progress * 100) completed.")
 case .copy(source: let source, destination: let dest):
 print("Copy \(source) to \(dest): \(progress * 100) completed.")
 default:
 break
 }
 }
 
 
 }
 */

extension ViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


extension String {
    static func randomString(length: Int) -> String {
        
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let len = UInt32(letters.length)
        
        var randomString = ""
        
        for _ in 0 ..< length {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }
        
        return randomString
        
    }
}

extension Formatter {
    static let iso8601: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss'-0000'"
        return formatter
    }()
}
extension Date {
    var iso8601: String {
        return Formatter.iso8601.string(from: self)
    }
}

