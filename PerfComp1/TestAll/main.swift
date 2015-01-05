//
//  main.swift
//  TestAll
//
//  Created by Hoon H. on 2015/01/05.
//
//

import Foundation


let	s	=	NSFileManager.defaultManager().currentDirectoryPath
println(s.stringByAppendingPathComponent("T1Swift"))

println("T1Swift")
NSTask.launchedTaskWithLaunchPath("/usr/bin/time", arguments: ["-p", s.stringByAppendingPathComponent("T1Swift")]).waitUntilExit()

println("T2Swift")
NSTask.launchedTaskWithLaunchPath("/usr/bin/time", arguments: ["-p", s.stringByAppendingPathComponent("T2Swift")]).waitUntilExit()

println("T3OBJC")
NSTask.launchedTaskWithLaunchPath("/usr/bin/time", arguments: ["-p", s.stringByAppendingPathComponent("T3OBJC")]).waitUntilExit()

println("T4OBJC")
NSTask.launchedTaskWithLaunchPath("/usr/bin/time", arguments: ["-p", s.stringByAppendingPathComponent("T4OBJC")]).waitUntilExit()

println("T5C++")
NSTask.launchedTaskWithLaunchPath("/usr/bin/time", arguments: ["-p", s.stringByAppendingPathComponent("T5C++")]).waitUntilExit()