<?php
//use Doctrine\ORM\EntityRepository;
//Hay implementamos para el constructor
use Doctrine\ORM\EntityManager;

class EquipoRepository extends Doctrine\ORM\EntityRepository{
//Propiedades
private EntityManager $entityManager;
//Constructor
public function __construct(EntityManager $entityManager)
{
    $this->entityManager = $entityManager;
}


//Métodos

//Función que devuelve una lista de jugadores del equipo cuyo nombre es igual al que le pasamos por parametros 
public function getLista(){
    
    $consulta = $this->entityManager->createQuery("SELECT j FROM JugadorBidireccional j JOIN j.equipo e WHERE e.nombre = 'Real Madrid' ");
    $jugadores = $consulta->getResult();
    if(!$jugadores){
        return -1;
    }else{
        return $jugadores;
    }

}

// Función que devuelve una lista de jugadores del equipo cuyo nombre es igual al que le pasamos por url 
// Con parametrización
public function getListaParam($nombre){

    $consulta = $this->entityManager->createQuery("SELECT j FROM JugadorBidireccional j JOIN j.equipo e WHERE e.nombre = :nombre");
    $consulta->setParameter('nombre', $nombre);
    $jugadores = $consulta->getResult();
    if(!$jugadores){
        return -1;
    }else{
        return $jugadores;
    }
}


//Mostrar Jugadores mayores de la edad que le pasemos
function getJugadoresMayoresDe($edad){
    $consulta = $this->entityManager->createQuery("SELECT COUNT(j) FROM jugadorBidireccional j JOIN j.equipo e WHERE j.edad>$edad");
    $jugadores = $consulta->getSingleScalarResult();
    if(!$jugadores){
        return -1;
    }else{
        return $jugadores;
    }
}

    //Función para sacar la media de edad de los jugadores de equipos de una ciudad cuyo nombre pasamos como parametro
    public function getMediaEdadParam() {
        $consulta = $this->entityManager->createQuery(
            "SELECT AVG(j.edad) as mediaEdad 
            FROM JugadorBidireccional j 
            JOIN j.equipo e 
            WHERE e.ciudad = 'Barcelona'"
        );

        $media = $consulta->getSingleScalarResult();

        if ($media === null) {
            return -1;
        } else {
            return $media;
        }
    }

    /* METODO PARA  SACAR JUGADORES CUYO NOMBRE EMPIECE POR LA LETRA 'A'*/ 
    public function getJugadoresConNombreA() {
        $consulta = $this->entityManager->createQuery(
            "SELECT j 
            FROM JugadorBidireccional j 
            WHERE j.nombre LIKE 'A%'"
        );

        $jugadores = $consulta->getResult();

        if (!$jugadores) {
            return -1;
        } else {
            return $jugadores;
        }

    }


    /*METODO PARA SACAR CIUDADES CON MAS HABITANTES DE LOS QUE DAMOS POR URL*/
    public function getCiudadesConMasHabitantes($socios) {
        $consulta = $this->entityManager->createQuery(
            "SELECT e.ciudad 
            FROM EquipoBidireccional e 
            WHERE e.socios > :socios"
        );
        $consulta->setParameter('socios', $socios);
        $ciudades = $consulta->getResult();

        if (!$ciudades) {
            return -1;
        } else {
            return $ciudades;
        }

    }

    /*METODO PARA SACAR CIUDADES CON MAS HABITANTES DE LOS QUE Doy por parametros*/
        public function getCiudadesConMasHabitantesParam() {
            $consulta = $this->entityManager->createQuery(
                "SELECT e.ciudad 
                FROM EquipoBidireccional e 
                WHERE e.socios > 50000"
            );
            $ciudades = $consulta->getResult();

            if (!$ciudades) {
                return -1;
            } else {
                return $ciudades;
            }
        }


}


    


?>