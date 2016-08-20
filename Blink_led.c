#define F_CPU 16000000UL //1 MHz
#include <avr/io.h>

void delay(unsigned int time)//delay function
{
    volatile unsigned int rate=F_CPU/17500;//rate is the num of times the for loop should execute for 1ms delay				
    volatile unsigned int i;
    while(time--)						
    {
	for(i=0;i<=rate;i++)
	{
	    __asm__ __volatile__ ("nop");//nop is used for "No Operation" i.e to not change the state of any register during execution
        }
    }
}
int main()
{
	DDRB |=  _BV(PB5); //Sets Pin 13 as output
    while(1) 
    {
        PORTB ^= _BV(PB5); // Togel LED
        delay(1000);  // Delay of 1s
    }
    return 0;
}