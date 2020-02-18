//CÓDIGO POR MARIANA PINTO E MICAELA CARDOSO - UNIVERSIDADE DE AVEIRO; MIECT - 1º ANO PROGRAMAÇÃO I

import java.util.*;
import java.io.*;
import processing.sound.*;
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer inicio; //variável nome
Boolean som=true;
int LADO=59; //TAMANHO DA GRELHA
int LINHAS=13, COLUNAS=13; //NUMERO de linhas e colunas 
int tiro = 11;
String Top5[];
int[][] tabuleiro = new int [LINHAS+1][COLUNAS+1]; 
PFont font; // tipo de letra
Random generator = new Random();
int start=0;

//gerar barcos
String [] sentidoArray; // vertical(0) ou horizontal(1)
int numeroBarcos = 25;
boolean game=false;


//tempo
int t=0;
int t0=0;
int delta=0;

//pontuações
int score=0;
String [] top5 = new String [5];
String [] nomes = new String [5];
int menor=1;

//load de imagens
PImage mar;
PImage imgbarco;
PImage battleship;

//nome player
String nome = "";

void setup() { 
  // <<-------------------------JANELA------------------------>>
  fullScreen();
  noStroke();
   Top5 = loadStrings("pontuacoes.txt");
  //imagens
  mar = loadImage("sea.jpg");
  imgbarco = loadImage("");
  battleship = loadImage("title2.png");
  frameRate(65); // taxa de atualização
  
  // <<-------------------------COLOCAR BARCOS ALEATÓRIOS------------------------>>
  sentidoArray = new String [numeroBarcos+1]; //sentido dos barcos
  tabuleiro = CriaBarcos(tabuleiro, LINHAS, COLUNAS);
  try {
    eFich(); //<>//
  } 
  catch (IOException e) {
  System.out.println("erro");
  }
  
  // <<-------------------------SONS------------------------>>
  //som de introdução
  if(game==false){
    minim = new Minim(this);
    inicio = minim.loadFile("inicio.mp3");
    inicio.loop();
  }
  // <<-------------------------TEMPO INICIAL------------------------>>
   if (game==true){
     t0 = millis(); //tempo inicial para se calcular tempo de jogo
   } 
  // <<-------------------------LOAD TOP 5------------------------>>
  top5 = loadStrings("pontuacoes.txt");
}

void draw() {
  // ---------------------------------------------EM JOGO--------------------------------------------
if(game) { 
  
  //parar a música de introdução
  if(som){
    inicio.play();
  }else{
    inicio.pause();
  }
  
  //tempo
  t = millis();
  delta = t-t0; // println (delta);
 
  // FUNDO
  background(176, 224, 230);
  PImage mar;
  mar = loadImage ("sea.jpg");
  mar.resize(LADO*COLUNAS,LADO*LINHAS);
  image (mar,0,0);
  
  // desenha tabuleiro
  for (int l = 0; l < LINHAS; l++) {
    for (int c = 0; c < COLUNAS; c++) {
      fill(23, 23, 181,100);
      //desenha barcos
      if (tabuleiro[l][c] <0 ) {
        int barcoActual = -tabuleiro[l][c]; //Negativo para dizer que tem barco
        String imgbarco = ""; //imagens do barco
        String sentido = sentidoArray[barcoActual];  //sentido dos barcos
      if (sentido == "horizontal"){ //quando o barco é horizontal //<>//
        if(c+2 <= 12 &&  Math.abs(tabuleiro[l][c+1]) == barcoActual && Math.abs(tabuleiro[l][c+2]) == barcoActual){ //testa se existe barco nas 2 casas seguintes (usa colunas porque o sentido é horizontal)
          imgbarco = "alterada1.gif"; //Se não existir barco, coloca a primeira imagem para que se comece a formar um
        }
        else if (c-2 >= 0 && Math.abs(tabuleiro[l][c-1]) ==barcoActual && Math.abs(tabuleiro[l][c-2])==barcoActual ){ //testa se existe barco nas 2 casas anteriores
          imgbarco = "alterada1.3.gif"; //Se existir, aparece o fim do barco pois na anterior estava o meio
       }
        else if (c-1 >= 0 && c+1 <= 12 && Math.abs(tabuleiro[l][c-1]) ==barcoActual && Math.abs(tabuleiro[l][c+1])==barcoActual){ //testa se existe barco na casa anterior
          imgbarco = "alterada1.2.gif"; //Se existir, aparece o centro do barco pois na anterior estava o inicio
        }
      }
      else if (sentido == "vertical"){ //No barco vertical
        if (l+2 <= 12  && Math.abs(tabuleiro[l+1][c]) ==barcoActual && Math.abs(tabuleiro[l+2][c])==barcoActual){  //testa se existe barco nas 2 casas seguintes (usa linhas porque o sentido é vertical)
          imgbarco = "alterada3.gif"; //Se não existir barco, coloca a primeira imagem para que se comece a formar um
        }
        else if( l-2 >= 0 && Math.abs(tabuleiro[l-1][c]) ==barcoActual && Math.abs(tabuleiro[l-2][c])==barcoActual){ //testa se existe barco nas 2 casas anteriores
          imgbarco = "alterada3.3.gif"; //Se existir, aparece o fim do barco pois na anterior estava o meio
        }
        else if(l+1<=12 && l-1 >= 0 && Math.abs(tabuleiro[l-1][c]) ==barcoActual && Math.abs(tabuleiro[l+1][c])==barcoActual){ //testa se existe barco na casa anterior
          imgbarco = "alterada3.2.gif"; //Se existir, aparece o centro do barco pois na anterior estava o inicio
        //Usei a condição l+1<=9, c-2<=9/0 e etc para que não criasse nenhum barco nas margens do tabuleiro porque senão ficavam barcos inacabados
        }
      }
      else{
          imgbarco = "barco2.gif"; //barcos só com uma célula, não interessa o sentido
      }
        fill (255, 255, 255, 10); 
        PImage barcos; //imagens dos barcos a colocar quando carregar na célula
        barcos = loadImage(imgbarco); 
        float x1 = c*LADO; //coordenadas para colocar os barcos para que preencham o quadrado inteiro
        float y1 = l*LADO;
      
       image(barcos, x1, y1, LADO-1, LADO-1); //se for barco
      }
      else{
        rect(c*LADO, l*LADO, LADO-1, LADO-1); //caso não seja barco
       }      
    }
  }
   //<<-------------------------MENU LATERAL------------------------>>
  fill (176,224,230); //cor do menu
  noStroke ();
  rect (775,0,400,600); // posição do menu
  fill (32, 25, 135);
  font = loadFont ("AgencyFB-Bold-60.vlw");
  textFont(font, 60);
  text("Top 5", 850, 100);
  for (int i =0; i<top5.length; i++) {
  textFont(font,30);
  fill(32,25,135);
  text ( (i+1)+ ". " +top5[i], 850, 150+i*50);
  }
  textFont(font,60);
  text ("TIME",850,450);
  textFont(font,30);
  text (delta/1000, 850, 500); //tempo a contar
  textFont(font,60);
  text ("SCORE",850,590);
  textFont(font,30);
  text(score, 850, 640);
  text("TO MUTE SOUND PRESS ZERO", 850, 690);
  PImage bomba; //carregar bomba no canto inferior direito
  bomba = loadImage ("bomba.png");
  image (bomba,1150,500,210,200);
 //tempo e game over
  if (delta > 60000) { //tempo limite do jogo em milisegundos (no caso, 60 segundos)
    noLoop (); //parar o jogo "gameover"
    smooth ();
    font = loadFont ("AgencyFB-Bold-60.vlw");
    textFont (font, 100);
    fill (255);
    text ("GAME OVER",width/2 - (int)textWidth("GAME OVER")/2,350);
    CompararTop5();
    if(score<1000){
    text ("NEED TO IMPROVE",width/2 - (int)textWidth("NEED TO IMPROVE")/2,450);
    }
    else if (score<2000 && score>1000){
    text ("YOU ARE GETTING BETTER",width/2 - (int)textWidth("YOU ARE GETTING BETTER")/2,450);
    }
    else if(score<3000 && score>2000){
    text ("KEEP TRYING, YOU ARE CLOSE",width/2 - (int)textWidth("KEEP TRYING, YOU ARE CLOSE")/2,450);
    }
    else if(score<5000 && score>3000){
    text ("ALMOST BEAT ME, TRY AGAIN",width/2 - (int)textWidth("ALMOST BEAT ME, TRY AGAIN")/2,450);
    }
    else if(score<6000 && score>5000){
     text("YOU BEAT ME!",width/2 - (int)textWidth("YOU BEAT ME!")/2,450);
    }
  } 
  }else {
  //---------------------------------------------------------FORA DE JOGO-----------------------------------------------------------------
  //<<-------------------------MENU INICIAL------------------------>>
  background(0);
  noStroke();
  fullScreen ();
    
    //titulo
  PImage battleship;
  battleship = loadImage ("title2.png");
  image (battleship,260,50);
    
    //caixa nome
  fill(0);
  rect(300,320,850,100);
   
    //tipo letra menu inicial
  font = loadFont ("AgencyFB-Bold-60.vlw");
  fill(135,206,250);
  textFont (font,40);
  text("PLAYER'S NAME: " +nome,400,385 );
  textFont (font,40);
  fill(255);
  text ("YOU HAVE SIXTY SECONDS TO BEAT ME",width/2 - (int)textWidth("YOU HAVE SIXTY SECONDS TO BEAT ME")/2,500);
  textFont (font,60);
  fill (32, 25, 135);
  text ("WRITE YOUR NAME AND PRESS ENTER TO START", width/2 - (int)textWidth("WRITE YOUR NAME AND PRESS ENTER TO START")/2,600);
  textFont(font,30);
  fill (43, 34, 191);
  text ("By Mariana Pinto and Micaela Cardoso",  width/2 - (int)textWidth("By Mariana Pinto and Micaela Cardoso")/2,700);
}
}

void mousePressed() {
  //menu inicial
   if (game == false) {
  } else {
    game = true;
    int l, c;
    c=mouseX /LADO;
    l=mouseY /LADO;
     if (tabuleiro[l][c] > 0){ 
          tabuleiro[l][c]= -tabuleiro[l][c]; 
          score=score+100;
    }
  }
}


// Gera barcos aleatoriamente
  int[][] CriaBarcos(int[][] tab, int cl, int cc) {
  for (int j = 1 ; j<=25 ; j++) { 
    int l = 0;
    int c = 0;
    boolean existeBarco = false;
    do  {
      //
      l = generator.nextInt(cl); 
      c = generator.nextInt(cc);
      String sentido = "vertical";
      if(j %2 == 0 && j>5){ //
        sentido = "horizontal";
      }
      else if (j<5){ //barcos só duma célula
        sentido = "nenhum";
      }
      sentidoArray[j] = sentido;
      
      existeBarco = ExisteBarco(tab, l, c, sentido);
      if(!existeBarco){ //Identifica em que parte do barco se clicou e gera as 3 partes
        if (sentido == "horizontal"){ //barco horiznontal
          if( tab[l][c]==0 && tab[l][c+1] ==0 && tab[l][c+2]==0){ //clique no inicio do barco
            tab[l][c] = j;
            tab[l][c+1] = j;
            tab[l][c+2] = j;
            
          }
          else if (tab[l][c]==0 && tab[l][c-1]==0 && tab[l][c-2]==0){ //Clique no fim do barco
            tab[l][c] = j;
            tab[l][c-1] = j;
            tab[l][c-2] = j;
            
          }
          else if (tab[l][c]==0 && tab[l][c-1]==0 && tab[l][c+1]==0){ //Clique no meio do barco
            tab[l][c] = j;
            tab[l][c-1] = j;
            tab[l][c+1] = j;
            
          }
        }
        else if (sentido == "vertical"){ //barcos verticais
          if (tab[l][c]==0 && tab[l+1][c]==0 && tab[l+2][c]==0){ //clique no inicio do barco
            tab[l][c] = j;
            tab[l+1][c] = j;
            tab[l+2][c] = j;
            
          }
          else if(tab[l][c]==0 && tab[l-1][c]==0 && tab[l-2][c]==0){ //Clique no fim do barco
            tab[l][c] = j;
            tab[l-1][c] = j;
            tab[l-2][c] = j;
            
          }
          else if(tab[l][c] ==0 && tab[l-1][c] ==0 && tab[l+1][c]==0){ //Clique no meio do barco
            tab[l][c] = j;
            tab[l-1][c] = j;
            tab[l+1][c] = j;
            
          }
        }
        else{ //Barcos de uma célula
          tab[l][c] = j;
        }
       }
    } while (existeBarco);
  } 
  return tab; 
}
   
// Testa se existe algum barco na vizinhança de l,c paara evitar sobreposição
boolean ExisteBarco(int[][] tab, int l, int c, String sentido) {
  if (sentido == "horizontal"){
    return  ( c+2 > 12 || (  tab[l][c] >0 && tab[l][c+1] >0 && tab[l][c+2]>0) ) 
     ||  (c-2 <0 || ( tab[l][c] >0 && tab[l][c-1] >0 && tab[l][c-2]>0 ))
     ||  ( (c+1 >12 || c-1 <0) ||( tab[l][c] >0 && tab[l][c-1] >0 && tab[l][c+1]>0 )) ;
  }
  else if(sentido == "vertical"){
    return (l+2 >12 || (tab[l][c] >0 && tab[l+1][c] >0 && tab[l+2][c]>0))
     || (l-2 <0 || (tab[l][c] >0 && tab[l-1][c] >0 && tab[l-2][c]>0 ))
     || ((l+1 > 12 || l-1 <0 ) || ( tab[l][c] >0 && tab[l-1][c] >0 && tab[l+1][c]>0 )) ;
  }
  
  if (tab[l][c] == 1) return true;
  return false;
 
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

void CompararTop5 () {
  int [] auxiliar= new int[Top5.length];
  for (int i=0; i<Top5.length; i++) {
    auxiliar[i] = (Integer.parseInt(Top5[i])); // passa as pontuações de string para int
  }
  auxiliar=sort(auxiliar); //por em ordem crescente
  if (score>auxiliar[0] && menor==1) { //o menor é para fazer como que está abaixo da pontuação não fica igual ao de cima
    menor=0;
    auxiliar [0] = score;
  }
  println(auxiliar); 
  auxiliar = sort(auxiliar); //põe por ordem crescente outra vez com a pontuação que entrou ou fica igual para ordenar a que entrou
  int j = Top5.length-1;
  for (int i=0; i<Top5.length; i++){
    if(j<=-1) break;
    Top5[i]= ""+auxiliar[j];
    j--; //para ir decrementando
    } //para pôr em ordem descrescente
   
  saveStrings("pontuacoes.txt",Top5); //guarda as pontuações
}

void keyPressed() {
  //nome do player
  if (keyCode==ENTER){
    game=true;
  }
  if(!game) {
    if(nome.length()<=30 && key!=keyCode && Character.isLetter(key)) nome=nome+key;
       if (keyCode==BACKSPACE)// && !nome.isEmpty())
       {
         if (nome.isEmpty())
         nome=nome.substring(0,nome.length()-1);
       }
  }
  
//parar a música de introdução
if(key=='0' && som==true){
  som=false;
  }else{
    if(key=='0'&& som==false){
      som=true;
    }
  }
  
}