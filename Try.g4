grammar Cilk;

string : '#include <iostream>'
 'using namespace std;'
 function
  'int main() {' statement 'return 0; }';
  
function:  type ID '(' type  ID')' statement ;

statement: labeledstatement
          | selectionstatement
          | iterationstatement
	  | functionstatement
	  | compoundstatement
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

expressionstatement:
	expression? ';'
;


functionstatement: statment 'return' ID 
		  | statment 'return' INT
;		  


compoundstatement:
	'{' statementseq? '}'
;

statementseq:
	statement
	| statementseq statement
;


type: 'Int' | 'String' | 'void';
operator: '-' | '*'| '&'| '+'| '!'| '~'| '-';
ID : [a-zA-Z]+ ;
INT : [0-9]+;
WS : [ \t\r\n]+ -> skip ;
