#!/usr/bin/python

def calc( a, b):
	l1=len(a)
	l2=len(b)
	if l1==l2:
		print(0)
	if l1<l2:
		print(-1)
	if l1>l2:
		print(0)
		return

def main():
	a= raw_input("enter 1")
	b= raw_input()
	print a
	print b
	calc(a,b)
	return
