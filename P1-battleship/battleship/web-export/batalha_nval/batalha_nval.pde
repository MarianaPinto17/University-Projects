import java.util.*;
int LADO=100;
int LINHAS=5, COLUNAS=5;
int tiro = 11;
int[][] tabuleiro = new int [LINHAS][COLUNAS];
Random generator = new Random();
//Scanner ler = new Scanner(System.in);

void setup() { 
  size(500, 500);
  noStroke();
  // fill(255, 0, 0);
  println("teste leitura:");
  // String nome = ler.next();
  // println(nome);
  /* coloca 3 barcos
   tabuleiro[0][4] = 1;
   tabuleiro[1][3] = 1;
   tabuleiro[3][1] = 1;
   */
  // colaca bracos aleatoriamente
  int nextl = generator.nextInt(5);
  int nextc = generator.nextInt(5);
  tabuleiro[nextl][nextc] = 1;
  nextl = generator.nextInt(5);
  nextc = generator.nextInt(5);
  tabuleiro[nextl][nextc] = 1;
}

void draw() {
  background(0, 255, 0);
  // desenha tabuleiro
  for (int l = 0; l < LINHAS; l++) {
    for (int c = 0; c < COLUNAS; c++) {
      fill(255, 0, 0);
      if (tabuleiro[l][c] <0 ) {
        fill (0, 0, 255);
      }
      rect(c*LADO, l*LADO, LADO-5, LADO-5);
    }
  }
}
public void mousePressed() {
  int l, c;
  c=mouseX /LADO;
  l=mouseY /LADO;
  if (tabuleiro[l][c] > 0) tabuleiro[l][c]= -tabuleiro[l][c];
}