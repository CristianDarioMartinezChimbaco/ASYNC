#include <iostream>
#include <thread>
#include <chrono>
#include <stdlib.h>
using namespace std;
void crearDatosCobol(){
    system("cobc -x CREAR-DATOS.cob -o CREAR-DATOS");
    system("./CREAR-DATOS");
    cout<<"finalizo CREAR-DATOS.cob"<<endl;
}
void leerDatosCobol(){
    system("cobc -x LEER-DATOS.cob -o LEER-DATOS");
    system("./LEER-DATOS");
}

int main() {
    crearDatosCobol();
    
    thread leerDatosCobol0(leerDatosCobol);
    thread leerDatosCobol1(leerDatosCobol);
    thread leerDatosCobol2(leerDatosCobol);
    thread leerDatosCobol3(leerDatosCobol);
    thread leerDatosCobol4(leerDatosCobol);
    leerDatosCobol0.join();
    leerDatosCobol1.join();
    leerDatosCobol2.join();
    leerDatosCobol3.join();
    leerDatosCobol4.join();
    return 0;
}
