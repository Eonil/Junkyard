//
//  main.swift
//  T2Swift
//
//  Created by Hoon H. on 2015/01/05.
//
//

import Foundation

class Test1 {
	let	value:UTF16Char
	init(_ value:UTF16Char) {
		self.value	=	value
	}
}

let	N	=	1024 * 1024 * 4

func RUN1() {
	var	ts	=	ContiguousArray<Test1>()
	ts.append(Test1("A".utf16[0]))
	ts.append(Test1("B".utf16[0]))
	ts.append(Test1("C".utf16[0]))
	ts.append(Test1("D".utf16[0]))
	
	var	ts1	=	ContiguousArray<Unmanaged<Test1>>()
	for t in ts {
		ts1.append(Unmanaged<Test1>.passUnretained(t))
	}
	var	s	=	""
	s.reserveCapacity(N * ts.count * 2)
	
	for i in 0..<(N) {
//		for t1 in ts1 {
//			unowned let	t	=	t1.takeUnretainedValue()
//			s.append(UnicodeScalar(t.value))
//		}
		for t in ts {
			s.append(UnicodeScalar(t.value))
		}
	}
	
	println("utf16 length: \(s.utf16Count)")
	println(s[s.endIndex.predecessor()])
}

RUN1()