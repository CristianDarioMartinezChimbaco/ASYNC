package TALLER_4;
import java.io.*;
import java.util.concurrent.*;

interface ejecutar {
    int ejecutarRetorno ();       
}

class llamadoCobol implements ejecutar{
    @Override
    public int ejecutarRetorno() {
        int estado = 0;        
        try {
            ProcessBuilder pb = new ProcessBuilder("ls");
            pb.start();        
        } catch (Exception e){
            estado = 1;
        }
        return estado;
    }
    
}

class llamadoP1 implements ejecutar {
    @Override
    public int ejecutarRetorno() {
        int estado = 0;       
        try {
            Thread.sleep(3000);
        } catch (InterruptedException e) {
            estado = 1;
        }    
        return estado;
    }
}

class llamadoP2 implements ejecutar {
    @Override
    public int ejecutarRetorno() {
        int estado = 0;
        try {
            Thread.sleep(5000); 
        } catch (InterruptedException e) {
            estado = 1;
        }  
        return estado;
    }
}

public class Main {
    public static void main (String[] args){
        llamadoP1 p1 = new llamadoP1();
        llamadoP2 p2 = new llamadoP2();
        p1.ejecutarRetorno();
        p2.ejecutarRetorno();
    }
}