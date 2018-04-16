import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;
import java.io.FileInputStream;
import java.io.InputStream;

public class Translate{

  public static void main(String[] args) throws Exception {
      String inputFile = null;
      if ( args.length>0 ) inputFile = args[0];
      InputStream is = System.in;
      if ( inputFile!=null ) {
          is = new FileInputStream(inputFile);
      }
      ANTLRInputStream input = new ANTLRInputStream(is);

      //#############################
      cppLexer lexer = new cppLexer(input);
      // create a buffer of tokens pulled from the lexer
      CommonTokenStream tokens = new CommonTokenStream(lexer);

      // create a parser that feeds off the tokens buffer
      //#############################
      cppParser parser = new cppParser(tokens);

      //#################### .g4 first rule
      ParseTree tree = parser.translationunit();

      ParseTreeWalker walker = new ParseTreeWalker(); // create standard walker

      //####################  file name that extends Listener (ExtractInterfaceListener)
      Cilk extractor = new Cilk(parser);
      walker.walk(extractor, tree); // initiate walk of tree with listener
  }

}
