<?php
// repositorios.php
require_once "bootstrap.php";
require_once './src/Entity/Jugador.php';
require_once './src/Entity/Equipo.php';
require_once './src/Entity/EquipoBidireccional.php';
require_once './src/Entity/JugadorBidireccional.php';
require_once './src/Entity/EquipoRepository.php';

/*usar el repositorio*/
/*METODO GET LISTA POR PARAMETRO */
$jugadores = $entityManager->getRepository('Equipo')->getLista("Real Madrid");
if($jugadores === -1)
{
    echo "Equipo no encontrado";
    }else
    {
        foreach($jugadores as $jugador)
        {
            echo "Nombre: ". $jugador->getNombre(). " ". $jugador->getApellidos(). "<br>";
        }
        echo"<br>";
}


// Obtención del parámetro desde la URL
$nombreEquipo = isset($_GET['equipo']) ? $_GET['equipo'] : null;

if ($nombreEquipo) {
    $jugadores = $entityManager->getRepository('Equipo')->getListaParam($nombreEquipo);
    
    if ($jugadores === -1) {
        echo "Equipo no encontrado";
    } else {
        foreach ($jugadores as $jugador) {
            echo "Nombre: " . $jugador->getNombre() . " " . $jugador->getApellidos() . "<br>";
        }
        echo"<br>";
    }
} else {
    echo "No se proporcionó el nombre del equipo.";
}


/*METODO PARA Mostrar Jugadores mayores de la edad que le pasemos POR URL*/
$edad = isset($_GET['edad']) ? (int)$_GET['edad'] : null;

if ($edad !== null) {
    $resultado = $entityManager->getRepository('Equipo')->getJugadoresMayoresDe($edad);

    if ($resultado === -1) {
        echo "No hay jugadores mayores de $edad años.<br>";
    } else {
        echo "Hay $resultado jugadores mayores de $edad años.<br>";
    }
} else {
    echo "No se proporcionó una edad válida.<br>";
}


/*Función para sacar la media de edad de los jugadores de equipos de una ciudad cuyo nombre pasamos como parametro*/
$mediaEdad = $entityManager->getRepository('Equipo')->getMediaEdadParam();

if ($mediaEdad === -1) {
    echo "No se encontraron jugadores en equipos de la ciudad de Barcelona.<br>";
} else {
    echo "La media de edad de los jugadores de equipos en Barcelona es: $mediaEdad<br>";
}



/* METODO PARA  SACAR JUGADORES CUYO NOMBRE EMPIECE POR LA LETRA 'A'*/ 
$jugadoresConNombreA = $entityManager->getRepository('Equipo')->getJugadoresConNombreA();
if ($jugadoresConNombreA === -1) {
    echo "No se encontraron jugadores cuyo nombre empiece por 'A'.";
} else {
    foreach ($jugadoresConNombreA as $jugador) {
        echo "Nombre: " . $jugador->getNombre() . " " . $jugador->getApellidos() . "<br>";
    }
}

/*METODO PARA SACAR CIUDADES CON MAS HABITANTES DE LOS QUE DAMOS POR URL*/
$socios = isset($_GET['socios']) ? (int)$_GET['socios'] : null;
if ($socios !== null) {
    $ciudadesConMasHabitantes = $entityManager->getRepository('Equipo')->getCiudadesConMasHabitantes($socios);

    if ($ciudadesConMasHabitantes === -1) {
        echo "No se encontraron ciudades con más de $socios socios.<br>";
    } else {
        echo "Ciudades con más de $socios socios:<br>";
        foreach ($ciudadesConMasHabitantes as $ciudad) {
            echo $ciudad['ciudad'] . "<br>"; // Accede al valor de la clave 'ciudad'
        }
    }
} else {
    echo "No se proporcionó un número de socios válido.<br>";
}



/*METODO PARA SACAR CIUDADES CON MAS HABITANTES DE LOS QUE Doy por parametros*/

$ciudadesConMasHabitantes = $entityManager->getRepository('Equipo')->getCiudadesConMasHabitantesParam();

if ($ciudadesConMasHabitantes === -1) {
    echo "No se encontraron ciudades con más de 50000 socios.<br>";
} else {
    echo "Ciudades con más de 50000 socios:<br>";
    foreach ($ciudadesConMasHabitantes as $ciudad) {
        echo $ciudad['ciudad'] . "<br>"; // Accede al valor de la clave 'ciudad'
    }
}

?>