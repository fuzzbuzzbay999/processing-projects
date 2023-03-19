String[] flowers ={"rose","blossom","lily","tulip","freesia","buttercup","sunflower","bellflower","hydradangea","lavender","peony","cornflower","celosia","gardenia"};
int smallest =0;
int largest =0;
String current;
int sort=0;
void setup(){
  for(int i=0;i<flowers.length; i++){
    if(flowers[i].length()>flowers[largest].length()){
     largest =i;
  }
     if(flowers[i].length()<flowers[smallest].length()){
     smallest =i;
  }
}
while(sort/flowers.length<flowers.length){
for (int i=1;i<flowers.length; i++){
 if(flowers[i-1].length()>flowers[i].length()){
   current=flowers[i-1];
   flowers[i-1]=flowers[i];
   flowers[i]=current;
   sort --;
}else{
  sort ++;
    }
  }
}
println(flowers[smallest]);
println(flowers[largest]);
println("\n");
for(String p:flowers){
 println(p); 
}
}
