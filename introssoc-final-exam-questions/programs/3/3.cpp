#include <iostream>
#include <string>
using namespace std;

void getval(std::string &a, std::string &b)
{
	int l1,l2;
	l1= strlen(a);
	l2 = strlen(b);
	cout<<l1<<l2;
	if(l1==l2){
		cout<<"0";
	}
	if(l1<l2)
		cout<<"-1";
	if(l1>l2)
		cout<<"1";
}
int main()
{
	string d,e;
	cin>>d;
	cin>>e;
	getval(d,e);
	return 0;

}
