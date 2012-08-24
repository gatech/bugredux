/*
 * First KLEE tutorial: testing a small function
 */

#include <stdio.h>
#include <assert.h>
int testa(int x) {
	if (x>='a' && x<='i') 
		assert(0);
	else
		return 0;
}

int my_islower(int x) {
  if (x >= 'a' && x <= 'z')
    return testa(x);
  else return 0;
}

int main(int argc, char** argv) {
	if (argc!=2)
		return 0;
  int c=fgetc(fopen(argv[1],"r"));
 // klee_make_symbolic(&c, sizeof(c), "input");
  return my_islower(c);
}
