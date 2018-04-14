grammar Cilk;

string : '#include <iostream>'
 'using namespace std;'
  'int main() {' statement 'return 0; }';

statement: labeledstatement
          | selectionstatement
          | iterationstatement
          ;


labeledstatement:
	type ID '=' statement

;


selectionstatement:
	If '(' condition ')' statement
	| If '(' condition ')' statement Else statement
;

condition:
       type ID '=' INT
      | type ID '<' INT
;

iterationstatement:
	| For '(' forinitstatement condition? ';' expression? ')' statement
	| For '(' forrangedeclaration ':' forrangeinitializer ')' statement
;

forinitstatement:
	expressionstatement
	| simpledeclaration
;

expressionstatement
:
	expression? ';'
;





type: 'Int' | 'String';
ID : [a-zA-Z]+ ;
INT : [0-9]+;
WS : [ \t\r\n]+ -> skip ;
