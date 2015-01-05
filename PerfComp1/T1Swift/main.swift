//
//  main.swift
//  T1Swift
//
//  Created by Hoon H. on 2015/01/05.
//
//

import Foundation

class Test1 {
	let	value:UnicodeScalar
	init(_ value:UnicodeScalar) {
		self.value	=	value
	}
}

let	N	=	1024 * 1024 * 4

func RUN1() {
	var	ts	=	[Test1]()
	ts.append(Test1("A"))
	ts.append(Test1("B"))
	ts.append(Test1("C"))
	ts.append(Test1("D"))
	
	var	ts1	=	[Unmanaged<Test1>]()
	for t in ts {
		ts1.append(Unmanaged<Test1>.passUnretained(t))
	}
	var	s	=	""
	s.reserveCapacity(N * ts.count * 2)

	for i in 0..<(N) {
		for t in ts {
			s.append(t.value);
		}
	}
	
	println("utf16 length: \(s.utf16Count)")
	println(s[s.endIndex.predecessor()])
	
}

RUN1()