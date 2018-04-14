grammar Cilk;

string : '#include <iostream>'
 'using namespace std;'
  'int main() {' s 'return 0; }';

s : type ID ';' ;
type: 'int ' | 'string';
ID : [a-zA-Z]+ ;
WS : [ \t\r\n]+ -> skip ;
