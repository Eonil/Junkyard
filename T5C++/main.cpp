//
//  main.cpp
//  T5C++
//
//  Created by Hoon H. on 2015/01/05.
//
//

#include <iostream>
#include <vector>
#include <memory>

using namespace std;

class Test1 {
public:
	Test1(wchar_t const value) {
		this->value	=	value;
	}
	wchar_t	value;
};

int main(int argc, const char * argv[]) {
	auto const	N	=	1024 * 1024 * 4;
	
	auto	ts	=	vector<shared_ptr<Test1>>();
	ts.push_back(shared_ptr<Test1>::make_shared(Test1('A')));
	ts.push_back(shared_ptr<Test1>::make_shared(Test1('B')));
	ts.push_back(shared_ptr<Test1>::make_shared(Test1('C')));
	ts.push_back(shared_ptr<Test1>::make_shared(Test1('D')));
	
	auto	s	=	std::wstring();
	
	for (auto i=0; i<N; i++) {
		for (auto const t: ts) {
			s.append(1, t->value);
		}
	}
	
	std::cout << (s.back()-1);
	std::cout << "end\n";
}
