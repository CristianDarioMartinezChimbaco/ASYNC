#include <iostream>
#include <thread>
#include <chrono>
#include <stdlib.h>

void cearDatosCobol(){
    std::system("cobc -x CREAR-DATOS.cob -o CREAR-DATOS");
    std::system("./CREAR-DATOS");
}
void leerDatosCobol(){
    std::system("cobc -x LEER-DATOS.cob -o LEER-DATOS");
    std::system("./LEER-DATOS");
}

int main() {
    std::thread crearDatos(cearDatosCobol);
    crearDatos.join();
    std::thread leerDatosCobol(cearDatosCobol);
    crearDatos.join();
    return 0;
}