import java.io.File;
import java.io.FileWriter;
public class Cilk extends CilkBaseListener {
    FileWriter writer;
    JavaParser parser;
    public ExtractInterfaceListener(JavaParser parser) {this.parser = parser;}
    
    @Override
    public void enterString(CilkParser.StringContext ctx) {
      try{
     writer  =new FileWriter("Output.c");
    writer.write("#include <iostream>\n#include <stdio.h>\n#include <cilk/cilk.h>\n#include <cilk/cilk_api.h>\nusing namespace std; \n int main() {\n");
  }catch(Exception e){System.out.println(e);}

}

@Override
public void exitString(CilkParser.StringContext ctx) {
  try{

writer.write("return 0; }");
 writer.close();
}catch(Exception e){System.out.println(e);}


}

@Override
public void enterS(CilkParser.SContext ctx) {
  try{
    String value = ctx.getText();
    writer.write(value);
  }catch(Exception e){System.out.println(e);}

}
}
