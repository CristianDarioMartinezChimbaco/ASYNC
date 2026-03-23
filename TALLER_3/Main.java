package TALLER_3;
import java.io.*;
import java.util.concurrent.*;

interface ejecutarConsola {
    int ejecutar ();       
}

class llamadoCobol implements ejecutarConsola {
    @Override
    public int ejecutar() {
        int estado = 0;
        try {
            ProcessBuilder pb = new ProcessBuilder("ls");
            Process proceso = pb.start();
            BufferedReader reader = new BufferedReader(new InputStreamReader(proceso.getInputStream()));
            String linea;
            while ((linea = reader.readLine()) != null) {
                System.out.println(linea);
            }
            //int exitCode = proceso.waitFor();
            ///System.out.println("Código de salida: " + exitCode);
        } catch (Exception e){
            //System.out.print(e);
            estado = 1;
        }
        return estado;
    }
}

class llamadoLisp implements ejecutarConsola {
    @Override
    public int ejecutar() {
        int estado = 0;
        try {
            ProcessBuilder pb = new ProcessBuilder("tree");
            Process proceso = pb.start();
            BufferedReader reader = new BufferedReader(
                new InputStreamReader(proceso.getInputStream())
            );
            String linea;
            while ((linea = reader.readLine()) != null) {
                System.out.println(linea);
            }
            //int exitCode = proceso.waitFor();
            //System.out.println("Código de salida: " + exitCode);
        } catch (Exception e){
            //System.out.print(e);
            estado = 1;
        }
        return estado;
    }
}

public class Main {
    public static void main (String[] args){
        llamadoCobol cob = new llamadoCobol();
        llamadoLisp lis = new llamadoLisp();
        cob.ejecutar();
        lis.ejecutar();
    }
}