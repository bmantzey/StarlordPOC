//
//  WriteStarlordFile.swift
//  SandiskConnectPOC
//
//  Created by Brandon Mantzey on 9/4/18.
//  Copyright © 2018 Brandon Mantzey. All rights reserved.
//

import Foundation
import FilesProvider

class WriteStarlordFile {
    let server: URL = URL(string: "http://172.25.63.1/myconnect/Files")!
    
    var webdav: WebDAVFileProvider?

    init() {
        self.connect()
    }

    public func connect() {
        webdav = WebDAVFileProvider(baseURL: server, credential: nil)!
        webdav?.delegate = self as FileProviderDelegate
        
        // Files need to be written to the correct directory.
        // TODO: On init, check to see if the folder is already there.  If not, create it.
        // NOTE: If the server is not available at the time that this class is initialized, there will be no way to retry and it will never succeed after the server becomes available.
//        let _ = webdav?.create(folder: "new folder", at: "/", completionHandler: nil)
    }
    
    // TODO:
    /*
     Maybe use an enum to decide which file format to generate.
     Maybe have a separate function per file.
     Pass the binary data to be written into the respective function along with a meaningful file name - one that can be used to identify which panel is being written to.
     */
    private func uploadConfig(data: Data) {
        let fileName = "config.dat"
        let remotePath = "/" + fileName

        // TODO:
        /*
         Accept the binary file and write it.
         */
        webdav?.writeContents(path: remotePath, contents: data, atomically: true, completionHandler: nil)
        
        // NOTE: This is what was used in the POC.  Text was taken from a text field in the UI and written as plain text.
//        if let text = testTextField.text {
//            let data = text.data(using: .utf8)
//            webdav?.writeContents(path: remotePath, contents: data, atomically: true, completionHandler: nil)
//        }
    }
    
    // TODO: Upload this to the correct folder location.
    private func uploadData(data: Data) {
        let fileName = "data.dat"
        let remotePath = "/" + fileName
        
        webdav?.writeContents(path: remotePath, contents: data, atomically: true, completionHandler: nil)
    }
    
    // TODO: Data validation?
}

extension WriteStarlordFile: FileProviderDelegate {
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
}
