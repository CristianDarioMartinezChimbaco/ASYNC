#include <iostream>
#include <thread>
#include <chrono>
#include <stdlib.h>
#include <cstdlib>

using namespace std;
void crearDatosCobol(char name[1]){
    char comand[50] = "cobc -x CREAR-DATOS" + name + ".cob -o CREAR-DATOS" + name;
    system(comand);
    comand = "./CREAR-DATOS" + name; 
    system(comand);
    cout << "finalizo CREAR-DATOS" << endl;
}
void leerDatosCobol(char name[1]){
    system("cobc -x LEER-DATOS" + name + ".cob -o LEER-DATOS" + name);
    system("./LEER-DATOS");
    cout << "finalizo LEER-DATOS" << name << endl;
}

int main() {
    crearDatosCobol('0');
    crearDatosCobol('1');
    crearDatosCobol('2');
    crearDatosCobol('3');
    crearDatosCobol('4');
    thread leerDatosCobol0(leerDatosCobol,'0');
    thread leerDatosCobol1(leerDatosCobol,'1');
    thread leerDatosCobol2(leerDatosCobol,'2');
    thread leerDatosCobol3(leerDatosCobol,'3');
    thread leerDatosCobol4(leerDatosCobol,'4');
    leerDatosCobol0.join();
    leerDatosCobol1.join();
    leerDatosCobol2.join();
    leerDatosCobol3.join();
    leerDatosCobol4.join();
    return 0;
}
