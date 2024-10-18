#! /usr/bin/bash
pwd
echo lang.y -\> lang.tab.c and lang.tab.h
bison -d lang.y
echo lang.l -\> lex.yy.c
flex lang.l
echo compiling lang.tab.c and lex.yy.c -\> language
gcc lang.tab.c lex.yy.c -o language -lm
echo cleared
rm lang.tab.c lang.tab.h lex.yy.c
echo running:
./language

# CodeBy FarnoodID