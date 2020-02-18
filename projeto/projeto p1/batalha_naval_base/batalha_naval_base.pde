import java.util.*;
import java.io.*;

int LADO=60; //TAMANHO DA GRELHA
int LINHAS=10, COLUNAS=10; //NUMERO de linhas e colunas 
int tiro = 11;
int[][] tabuleiro = new int [LINHAS][COLUNAS]; 
PFont font; // tipo de letra
Random generator = new Random();

//gerar barcos
int [] [] passou; //marca de passagem de click do mouse
int [] tam;
int [] posx;
int [] posy;
int [] sentido; // vertical(0) ou horizontal(1)
int n;
int [] [] grade; // matriz

void setup() { 
  size(1000, 600); // tamanho da janela
  noStroke();
  // coloca barcos aleatoriamente
  tabuleiro = CriaBarcos(tabuleiro, LINHAS, COLUNAS);
  try {
    eFich();
  } 
  catch (IOException e) {
    System.out.println("erro");
  }

  //coloca sons
  
  
  //coloca barcos
  tam = new int [n];
  posx = new int [n];
  posy = new int [n];
  sentido = new int [n]; // cada barco possui seu sentido
  grade = new int [20] [20]; //criar matriz
  passou = new int [20] [20]; //comando para saber se ja houve click num local

  for (int i=0; i<(n-1); i++){
    tam [i] = int (random(1,6)); //tamanho dos barquinhos variavel
    posx [i] = int (random(0,20 - tam [i])); // atribuir posicao dos barcos dentro da grade da matriz
    posy [i] = int (random(0,20 - tam [i]));
    sentido [i] = int (random(0,2)); //vertical ou horizontal

  }  

  for (int i=0; i<n; i++) {
    for (int j=0; j< tam[i]; j++){// verificar tamanho de cada barco
      if (sentido [i] == 0) { // se a posicao for vertical
        grade [posx [i]] [posy [i]+j]++; // muda a posicao y
      }
      if (sentido [i] == 1) { //se a posicao for horizontal
        grade [posx[i]+j] [posy[i]]++;
      }
    }
  }
  for (int i=0; i<20; i++) { //for para zerar os valores da funcao passou
    for (int j=0; j<20; j++){
      passou [LINHAS] [COLUNAS] = 0;
    }
  }
}

void draw() {
  // FUNDO
  PImage img; 
  img = loadImage("sea.jpg");
  background(img);
  // desenha tabuleiro
  for (int l = 0; l < LINHAS; l++) {
    for (int c = 0; c < COLUNAS; c++) {
      fill(0, 0, 0, 100);
      if (tabuleiro[l][c] <0 ) {
        fill (255, 255, 255);
      }
      rect(c*LADO, l*LADO, LADO-3, LADO-3); 
    }
  }
  fill (0);
  font = loadFont ("ArialMT-48.vlw");
  textFont (font, 20);  
  
  //PImage s; //carregar submarino no canto inferior direito
  //s = loadImage ("submarino.gif");
  //image (s,590,400,210,200);
  
  // MENU
  fill (250,250,250,100); 
  noStroke ();
  rect (600,0,400,600);
  // tempo 
  fill (0);
  font = loadFont ("ArialMT-48.vlw");
  textFont (font, 30);
  text ("TOP 5",650,50);
  text ("TIME",650,400);
  text ("RESET",650,550);
}

void mousePressed() {
  int l, c;

  c=mouseX /LADO;
  l=mouseY /LADO;
  if (tabuleiro[l][c] > 0) tabuleiro[l][c]= -tabuleiro[l][c];
}

// Gera barcos aleatoriamente
  int[][] CriaBarcos(int[][] tab1, int cl, int cc) {
  int nextl = generator.nextInt(cl);
  int nextc = generator.nextInt(cc);
  // Testa se existe já algum barco na vizinhança
  if (!ExisteBarco(tab1, nextl, nextc)) {
    tab1[nextl][nextc] = 2;
  } else {
    println("Barco já EXISTE");
  }
  nextl = generator.nextInt(cl);
  nextc = generator.nextInt(cc);
  tab1[nextl][nextc] = 2;
  return tab1; 
  }
  
  
// Testa se existe já algum barco na vizinhança de l,c
boolean ExisteBarco(int[][] tab, int l, int c) {
  if (tab[l][c] == 1) return true;
  return false;
 //
}
// ler e escrever ficheiros de texto.
void eFich() throws IOException {
  try {
    File fin = new File("revisions.txt");
    Scanner lerf = new Scanner(fin);
    String linha = lerf.nextLine();
    System.out.println(linha);
    lerf.close();

    // Associação do nome do ficheiro de saída ao programa
    File fout = new File("namef.txt");
    PrintWriter pw = new PrintWriter(fout);
    pw.println("teste da classe Scanner");
    pw.println("com o Processing");
    pw.close();
  } 
  catch (IOException e) {
    System.out.println("erro");
  }
}