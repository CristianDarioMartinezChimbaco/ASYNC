#include <iostream>
#include <thread>
#include <chrono>
#include <stdlib.h>
#include <cstdlib>

using namespace std;
using namespace chrono;
void crearDatosCobol(string name){
        auto inicio = high_resolution_clock::now();
        string comando = "cobc -x CREAR-DATOS" + name + ".cob -o CREAR-DATOS" + name + ".exe";
        system(comando.c_str());
        comando = ".\\CREAR-DATOS" + name + ".exe"; 
        system(comando.c_str());
        cout << "finalizo CREAR-DATOS" << name << endl;
    auto fin = high_resolution_clock::now();
    auto duracion = duration_cast<milliseconds>(fin - inicio);
    cout << "Tiempo: " << duracion.count() << " ms" << endl;
}
void leerDatosCobol(string name){
    auto inicio = high_resolution_clock::now();
        string comando = "cobc -x LEER-DATOS" + name + ".cob -o LEER-DATOS" + name + ".exe";
        system(comando.c_str());
        comando = ".\\LEER-DATOS" + name + ".exe"; 
        system(comando.c_str());
        cout << "finalizo LEER-DATOS" << name << endl;
    auto fin = high_resolution_clock::now();
    auto duracion = duration_cast<milliseconds>(fin - inicio);
    cout << "Tiempo: " << duracion.count() << " ms" << endl;
}

int main() {
    crearDatosCobol("0");
    crearDatosCobol("1");
    crearDatosCobol("2");
    crearDatosCobol("3");
    crearDatosCobol("4");
    cout << "Termino La creacion de todos los datos" << endl;
    leerDatosCobol("0");
    leerDatosCobol("1");
    leerDatosCobol("2");
    leerDatosCobol("3");
    leerDatosCobol("4");
    return 0;
}
