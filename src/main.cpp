#include <stdio.h>
#include <iostream>

#include "lexer.h"
#include "logger.h"
#include "parser.h"

int main(int argc, char** argv)
{
  ALPACA_LOG_FUNC(main);

  printf("Hello, alpaca!\n");

  {
    ALPACA_LOG_BLOCK(readSource);

    std::string s;

    std::ifstream sourcefile;
    sourcefile.open ("al/test.al");


    std::smatch m;

    Alpaca::Lexer lexer;

    std::string tn;

    std::string res;

    int line = 0;
    int pos;

    while (!sourcefile.eof())
    {
      std::getline(sourcefile, s);
      line++;
      pos = 0;

      while (s.length() > 0 && lexer.getLexeme(s, tn, res ))
      {
        ALPACA_LOG(std::to_string(line) + ":" + std::to_string(pos) + "\t[" + res + "] "+ tn + "\n");
        s = s.substr(res.length());
        pos += res.length();
      }

      if (s.length() > 0)
      {
        ALPACA_LOG("[" + s.substr(0, 10) + "] unknown" + "\n");
      }
    }
    sourcefile.close();
  }

  Alpaca::Parser parser;

  return 0;
}
