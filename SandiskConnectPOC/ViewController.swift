//
//  ViewController.swift
//  SandiskConnectPOC
//
//  Created by Brandon Mantzey on 8/29/18.
//  Copyright © 2018 Brandon Mantzey. All rights reserved.
//

import UIKit
import FilesProvider

class ViewController: UIViewController {
    
    let server: URL = URL(string: "http://172.25.63.1/myconnect/")!
    let username = ""
    let password = ""
    
    var webdav: WebDAVFileProvider?
    
    //    @IBOutlet weak var testTextField: UITextField!
    @IBOutlet weak var uploadProgressView: UIProgressView!
    //    @IBOutlet weak var downloadProgressView: UIProgressView!
    
    var writeData: Data?
    
    override func viewDidLoad() {
        
        let fileMakerTest = StarlordFileMaker()
        //        fileMakerTest.tempRead()
        writeData = fileMakerTest.tempWrite()
        
        super.viewDidLoad()
        
        //        let credential = URLCredential(user: username, password: password, persistence: .permanent)
        
        webdav = WebDAVFileProvider(baseURL: server, credential: nil)!
        webdav?.delegate = self as FileProviderDelegate
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func createFolder(_ sender: Any) {
        let _ = webdav?.create(folder: "new folder", at: "/", completionHandler: nil)
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
        let localURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("CONFIG.DAT")
        
        self.uploadProgressView.observedProgress = webdav?.copyItem(localFile: localURL, to: "Files/CONFIG.DAT", completionHandler: { error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("Successfully wrote Starlord binary file contents.")
            }
            
            self.performSelector(onMainThread: #selector(self.didCompleteFileWrite), with: nil, waitUntilDone: false)
        })
    }
    @objc func createFilesFolder() {
        let _ = webdav?.create(folder: "Files", at: "", completionHandler: { error in
            if let error = error {
                print("\(error)")
            } else {
                print("Created files folder")
            }
        })
    }
    
    
    @IBAction func upload(_ sender: Any) {
        webdav?.contentsOfDirectory(path: "", completionHandler: { files, error in
            if let error = error {
                print("Error getting contents of root directory. \(error)")
            } else {
                var hasFilesFolder = false
                var hadExistingFile = false
                
                for aFile in files {
                    if aFile.name.lowercased() == "files" {
                        hasFilesFolder = true
                        print("Found Files Folder!")
                    }
                }

                if hasFilesFolder == false {
                    self.performSelector(onMainThread: #selector(self.createFilesFolder), with: nil, waitUntilDone: true)
                }
                
                self.webdav?.contentsOfDirectory(path: "/Files", completionHandler: { files, error in
                    if let error = error {
                        print("Error getting contents of /Files directory. \(error)")
                    } else {
                        for aFile in files {
                            if aFile.name.lowercased() == "config.dat" {
                                print("Found existing file.")
                                hadExistingFile = true
                                self.performSelector(onMainThread: #selector(self.deleteExistingFile), with: nil, waitUntilDone: true)
                                break
                            }
                        }
                    }

                    if hadExistingFile == false {
                        self.performSelector(onMainThread: #selector(self.writeTestFile), with: nil, waitUntilDone: true)
                    }
                })
            }
        })
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

