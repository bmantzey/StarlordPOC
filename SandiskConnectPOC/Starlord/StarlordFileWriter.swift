//
//  WriteStarlordFile.swift
//  SandiskConnectPOC
//
//  Created by Brandon Mantzey on 9/4/18.
//  Copyright © 2018 Brandon Mantzey. All rights reserved.
//

import Foundation
import FilesProvider

class StarlordFileWriter {
    let filesFolderName = "Files"
    
    let server: URL = URL(string: "http://172.25.63.1/myconnect/")!
    
    var webdav: WebDAVFileProvider?
    
    var connectivityStatus: ((_ connected: Bool, _ error: Error?) -> Void)? = nil

    public func connect(connectivityStatus: @escaping (_ connected: Bool, _ error: Error?) -> Void) {
        webdav = WebDAVFileProvider(baseURL: server, credential: nil)!
        webdav?.delegate = self as FileProviderDelegate
        self.connectivityStatus = connectivityStatus
        
        // Files need to be written to the correct directory.
        checkForFilesFolder()
    }
    
    // TODO:
    /*
     Pass the binary data to be written into the respective function along with a meaningful file name - one that can be used to identify which panel is being written to.
     */
    public func uploadConfig(data: Data, toPath: String) {
        let fileName = "/config.dat"
        let remotePath = "/Files/" + toPath + fileName

        self.upload(data: data, toLocation: remotePath)
    }
    
    // TODO: Upload this to the correct folder location.
    public func uploadData(data: Data, toPath: String) {
        let fileName = "/data.dat"
        let remotePath = "/Files/" + toPath + fileName
        
        self.upload(data: data, toLocation: remotePath)
    }
    private func upload(data: Data, toLocation: String) {
        webdav?.writeContents(path: toLocation, contents: data, atomically: true, completionHandler: { [weak self] error in
            if let error = error {
                if let callback = self?.connectivityStatus {
                    callback(false, error)
                }
                print("error: \(error)")
            } else {
                if let callback = self?.connectivityStatus {
                    callback(true, nil)
                }
                print("Success uploading Config. data.")
            }
        })
    }
    
    private func checkForFilesFolder() {
        func createFilesFolder() {
            let _ = webdav?.create(folder: "Files", at: "", completionHandler: { [weak self] error in
                if let error = error {
                    print("\(error)")
                    if let callback = self?.connectivityStatus {
                        callback(false, error)
                    }
                } else {
                    if let callback = self?.connectivityStatus {
                        print("created files folder")
                        callback(true, nil)
                    }
                }
            })
        }

        webdav?.contentsOfDirectory(path: "", completionHandler: { [weak self] files, error in
            if let error = error {
                // TODO: Respond to error
                print("Error: \(error)")
            } else {
                for aFile in files {
                    if aFile.name == self?.filesFolderName {
                        // If we have a Files folder, do nothing.
                        print("Found Files Folder!")
                        return
                    }
                }

                createFilesFolder()
                // At this point, the Files folder is not found.  Create it!
            }
        })
    }
    
    // TODO: Data validation?
}

extension StarlordFileWriter: FileProviderDelegate {
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
