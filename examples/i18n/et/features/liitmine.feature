Omadus: Liitmine
  Selleks et vältida rumalaid vigu
  Olles matemaatika-puupea
  Tahan et mulle öeldaks kahe numbri summa
 
  # Someone please translate this in languages.yml
  Scenario Outline: Liida kaks numbrit
    Eeldades et olen sisestanud kalkulaatorisse numbri <input_1>
    Ja olen sisestanud kalkulaatorisse numbri <input_2>
    Kui ma vajutan <button>
    Siis vastuseks peab ekraanil kuvatama <output>

  Examples:
    | input_1 | input_2 | button   | output |
    | 20      | 30      | liida    | 50     |
    | 2       | 5       | liida    | 7      |
    | 0       | 40      | liida    | 40     |