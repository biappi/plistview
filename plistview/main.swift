//
//  main.swift
//  plistview
//
//  Created by Antonio Malara on 27/07/14.
//  Copyright (c) 2014 Antonio Malara. All rights reserved.
//

import Foundation

func exit(error: String, code: Int32) {
    println(error)
    Foundation.exit(code)
}

let args = NSProcessInfo().arguments
if args.count != 2 {
    println("usage: \(args[0]) plistname")
    exit(0)
}

let filepath = args[1] as String
var error : NSError?

let data = NSData.dataWithContentsOfFile(
    filepath,
    options: NSDataReadingOptions(),
    error: &error
)

if !data {
    exit("cannot read file at path '\(filepath)': \(error)", 1)
}

let plist : AnyObject? = NSPropertyListSerialization.propertyListWithData(
    data,
    options: 0,
    format: nil,
    error: &error
)

if !plist {
    exit("cannot read property list: \(error)", 2)
}

println(plist)
