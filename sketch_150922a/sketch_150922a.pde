//Jerson Wade, Francisco Duran, Mauren Bastos
int longitudCanvas = 300;
int targetX = int(random(1, longitudCanvas-1));
int targetY = int(random(1, longitudCanvas-1));
par objetivo = new par(targetX,targetY);
par[] arbol = new par[longitudCanvas*longitudCanvas];
par[] paresVisitados = new par[longitudCanvas*longitudCanvas];
int[] padres = new int[longitudCanvas*longitudCanvas];
agenteBuscador agente = new agenteBuscador(objetivo);
int indiceArbolPush = 0;
int indiceArbolPop = 0;
int indiceVisitados = 0;

void setup(){

  size(300,300);
  ////print("pos inicial del agente ");
  ////print(agente.pos.x,agente.pos.y);
  ////print("\n");
  push(agente.pos); //aqui tenemos que meter el nodo raiz del arbol que es la posicion inical del agente
  print("Meta del agente ");
  print(targetX,targetY);
  print("\n");
  

}

void draw(){
   
      
     
  
  boolean llegue = agente.revisarMeta(); //<>//
  

  if(llegue==false){
    background(125);
     fill(255,0,0);
    
     expandirPar(agente.pos);  //<>//
     par sigpos = pop();
     agente.pos = sigpos;
      ellipse(agente.pos.x, agente.pos.y, 10, 10);
     
     print("sigpos del agente ");
     print(agente.pos.x,agente.pos.y);
     print("\n");
  fill(255,99,255);
  rect(targetX, targetY, 10, 10); //<>//
    
  }else{
  
    fill(0,255,0);
    ellipse(agente.pos.x, agente.pos.y, 10, 10);
    //print("llegue a la meta");
    
  }

}


void expandirPar(par pos){
  
  
   paresVisitados[indiceVisitados] = pos;
   indiceVisitados++;

  int x1 = pos.x-1; //<>//
  int x2 = pos.x+1;
  int y1 = pos.y-1;
  int y2 = pos.y+1;
 
  par  arriba= new par(pos.x,y1);
  par abajo = new par(pos.x,y2);
  par izq = new par(x1,pos.y);
  par der = new par(x2,pos.y);
  
  if(validarPar(arriba)){
    push(arriba);
  
  }
  
    if(validarPar(abajo)){
      push(abajo);
  
  }
  
  
    if(validarPar(izq)){
      push(izq);
  
  }
  
  
    if(validarPar(der)){
      push(der);
  
  }
  
  
}

boolean validarPar(par pos){

  // print("pos validado ");
   //print(pos.x,pos.y);
   //print("\n");
  
  // print("resultado de validacion: ");
  // print( ((pos.x >= 0 ) && (pos.x <= longitudCanvas)) && ( (pos.y >= 0 ) && (pos.y <= longitudCanvas) ) && ( !noVisitado(pos)) );
   //print("\n");
  
 return ( ((pos.x >= 0 ) && (pos.x <= longitudCanvas)) && ( (pos.y >= 0 ) && (pos.y <= longitudCanvas) ) && ( !noVisitado(pos)) );
 // return ( ((pos.x > 0 ) && (pos.x < longitudCanvas)) && ( (pos.y > 0 ) && (pos.y < longitudCanvas) ));
  

}

boolean noVisitado(par pos){

    boolean visitado = false;
    boolean resultado = false;
    
    for(int i=0;i<indiceVisitados;i++){
      
      visitado=pos.parIgual(paresVisitados[i]);
      
      if(visitado==true){
        resultado=true;
      
      }

    }
  
  return resultado;
}


void push(par pos){
   
  
  //logica para que no meta repeditos en arbol
  
  boolean enArbol = false;
  boolean control = false;
  
 for(int i=0;i<indiceArbolPush;i++){
   control=pos.parIgual(arbol[i]);
   if(control==true){
    enArbol=true;
   }
   
 }
 ///
 
 if(enArbol==false){
    //print("push del par: ");
    //print(pos.x,pos.y);
    //print("\n");
     arbol[indiceArbolPush] = pos;
     indiceArbolPush++;
   }
   
    //arbol[indiceArbolPush] = pos;
    //indiceArbolPush++;

}

par pop(){
  
  indiceArbolPop++;
  par pos = new par(arbol[indiceArbolPop].x,arbol[indiceArbolPop].y); //<>//
  return pos; 

}
