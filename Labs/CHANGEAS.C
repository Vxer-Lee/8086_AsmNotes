#include <stdio.h>
int main()
{
   char a[]="doS";
   char b[]="ASM";

   int i=0;
   do
   {
		a[i] = a[i] & 0xDF;
		b[i] = b[i] | 0x20;
		i++;
   }while(i<3);

   printf("%s%s\n",a,b);
   return 0;
}