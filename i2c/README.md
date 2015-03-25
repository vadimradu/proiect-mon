Interfața PS2
Interfața PS2 este descrisă de manualul plăcii Nexys 2, paginile 7-9. Interfața PS2 va fi implementată
având structura din imaginea de mai jos:
• Modulul Deserializer transformă comunicația serială PS2 în setul de semnale (DONE, CODE)
• DONE semnalizează că un cod a fost recepționat de la tastatură, și este activ (1 logic)
doar după ce comunicația serială cu tastatura a fost incheiată
• CODE reprezintă codul primit de la tastatură, ce include bitul de paritate
• Modulul Parity Check verifică validitatea codului prin calculul parității, și semnalizeaza 1 logic
timp de o perioadă de ceas pe ieșirea VALID dacă paritatea este corectă. Bitul de paritate este 1
logic doar dacă semnalul de date transmis (0-7) conține un număr par de biți cu valoarea 1 logic.
• Modulul Scan Decoder transformă codul de la tastatură într-un semnal care indică dacă oricare
din tastele de interes au fost apăsate

Ieșirea DATA a modulului scan decoder va avea 6 biți, ce corespund fiecărei taste de interes pentru
jocul Snake, conform cerințelor de proiectare:
• 1 bit (bitul 0) corespunde comenzii de a schimba direcția de deplasare în sus
• 1 bit (bitul 1) corespunde comenzii de a schimba direcția de deplasare în jos
• 1 bit (bitul 2) corespunde comenzii de a schimba direcția de deplasare în stânga
• 1 bit (bitul 3) corespunde comenzii de a schimba direcția de deplasare în dreapta
• 1 bit (bitul 4) corespunde comenzii de a reseta jocul
• 1 bit (bitul 5) corespunde comenzii de a suspenda sau reporni jocul
Fiecare din acești biți este asociat unei taste și devine activ (1 logic) timp de o perioadă de ceas după ce
a fost recepționat de la tastatură codul care ne indică faptul că tasta respectivă a fost apăsată. 
