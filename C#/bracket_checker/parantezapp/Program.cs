using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections;

namespace parantezapp
{
    class Program
    {
        static void Main(string[] args)
        {
            Stack yigin = new Stack();
            char cikan = ' ';char bastus = ' ';
            while(bastus!='ç')
            {
                bastus = Convert.ToChar(Console.Read());
                if (bastus == '(' || bastus == '[' || bastus == '{')
                {
                    yigin.Push(bastus);
                    ElemanlariYaz(yigin); Console.ReadKey();
                }
                else if (bastus == ')' || bastus == ']' || bastus == '}')
                    if (yigin.Count > 0)
                    {
                        cikan = (char)yigin.Pop();
                        ElemanlariYaz(yigin);
                    }
                    else
                        Console.WriteLine("Yığında eleman yok...");
                if (bastus == ')' && cikan != '(')
                    Console.WriteLine("Yanlış Parantez....");
                else if (bastus == ']' && cikan != '[')
                    Console.WriteLine("Yanlış Parantez....");
                else if (bastus == '}' && cikan != '{')
                    Console.WriteLine("Yanlış Parantez....");
            }
        }

        public static void ElemanlariYaz(Stack yigin)
        {
            object obj = new Object();
            Stack yeniyigin = (Stack)yigin.Clone();
            if (yigin.Count!=0)
            {
                Console.WriteLine("Yığının içi...\n");
                while(yeniyigin.Count>0) 
                {
                    obj = yeniyigin.Pop();
                    Console.Write("\t" + obj.ToString());
                }
            }
        }

    }
}
