Afișajul cu 7 segmente este descris de manualul plăcii Nexys 2 la paginile 5-6. Numărul afișat
corespunde valorilor electrice atribuite semnalului Cx, conectat la catozii LED-urilor ce formează
afișajul. Pentru că avem 4 cifre cu 7 segmente, vom genera 4 semnale Cx: C0, C1, C2, C3. Cele patri
cufre cu 7 segmente împart semnalele de control ale catozilor, se va folosi mecanismul de multiplexare
în timp descris de manualul Nexys 2 în figura 10 și textul asociat.
• Modulul Points decoder transformă semnalul Points, ce indică binar numărul curent de puncte,
în semnalele aferente catozilor cifrelor pe care se va face afișarea
• Modulul Level decoder transformă semnalul Level, ce indică binar numărul curent de puncte, în
semnalele aferente catozilor cifrei pe care se va face afișarea
• Modulul Digit selector realizează multiplexarea ciclică a valorilor aferente catozilor, și
generează semnalele de selecție AN
