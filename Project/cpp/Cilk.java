import org.antlr.v4.runtime.TokenStream;
import org.antlr.v4.runtime.misc.Interval;
import java.io.File;
import java.io.FileWriter;

public class Cilk extends cppBaseListener {
    FileWriter writer;
    cppParser parser;
    public Cilk(cppParser parser) {this.parser = parser;}

    @Override
    public void enterTranslationunit(cppParser.TranslationunitContext ctx) {
      TokenStream tokens = parser.getTokenStream();
      try{
     writer  =new FileWriter("Output.cpp");
    writer.write("#include <stdio.h>\n#include <stdlib.h>\n#include <time.h>\n#include <cilk/cilk.h>\n#include <cilk/cilk_api.h>\n");
    writer.write(tokens.getText(ctx));
  }catch(Exception e){System.out.println(e);}

}

@Override
public void exitTranslationunit(cppParser.TranslationunitContext ctx) {
  try{

 writer.close();
}catch(Exception e){System.out.println(e);}

}


@Override
public void enterFunctiondefinition(cppParser.FunctiondefinitionContext ctx) {
  TokenStream tokens = parser.getTokenStream();
  try{
writer.write("\n"+tokens.getText(ctx));
}catch(Exception e){System.out.println(e);}

}

}
